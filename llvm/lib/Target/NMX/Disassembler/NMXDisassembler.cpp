//===- NMXDisassembler.cpp - Disassembler for NMX -------------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file is part of the NMX Disassembler.
//
//===----------------------------------------------------------------------===//

#include "NMX.h"

#include "NMXRegisterInfo.h"
#include "NMXSubtarget.h"
#include "llvm/MC/MCDisassembler/MCDisassembler.h"
#include "llvm/MC/MCFixedLenDisassembler.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/Support/MathExtras.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

#define DEBUG_TYPE "NMX-disassembler"

typedef MCDisassembler::DecodeStatus DecodeStatus;

namespace {

/// NMXdisassemblerBase - a disassembler class for NMX.
class NMXDisassemblerBase : public MCDisassembler {
public:
  NMXDisassemblerBase(const MCSubtargetInfo &STI, MCContext &Ctx,
                       bool bigEndian) :
    MCDisassembler(STI, Ctx),
    IsBigEndian(bigEndian) {}

  virtual ~NMXDisassemblerBase() {}

protected:
  bool IsBigEndian;
};

/// NMXDisassembler - a disassembler class for NMX32.
class NMXDisassembler : public NMXDisassemblerBase {
public:
  NMXDisassembler(const MCSubtargetInfo &STI, MCContext &Ctx, bool bigEndian)
    : NMXDisassemblerBase(STI, Ctx, bigEndian) {}

  DecodeStatus getInstruction(MCInst &Inst, uint64_t &Size,
                              ArrayRef<uint8_t> Bytes, uint64_t Address,
                              raw_ostream &VStream,
                              raw_ostream &CStream) const override;
};

} // end of anonymous namespace

// Decoder tables for GPR register
static const unsigned CPURegsTable[] = {
  NMX::ZERO, NMX::AT, NMX::V0, NMX::V1,
  NMX::A0, NMX::A1, NMX::T9, NMX::T0,
  NMX::T1, NMX::S0, NMX::S1, NMX::GP,
  NMX::FP, NMX::SP, NMX::LR, NMX::SW
};

// Decoder tables for co-processor 0 register
static const unsigned C0RegsTable[] = {
  NMX::PC, NMX::EPC
};

static DecodeStatus DecodeCPURegsRegisterClass(MCInst &Inst,
                                               unsigned RegNo,
                                               uint64_t Address,
                                               const void *Decoder);
static DecodeStatus DecodeGPROutRegisterClass(MCInst &Inst,
                                              unsigned RegNo,
                                              uint64_t Address,
                                              const void *Decoder);
static DecodeStatus DecodeSRRegisterClass(MCInst &Inst,
                                          unsigned RegNo,
                                          uint64_t Address,
                                          const void *Decoder);
static DecodeStatus DecodeC0RegsRegisterClass(MCInst &Inst,
                                              unsigned RegNo,
                                              uint64_t Address,
                                              const void *Decoder);
static DecodeStatus DecodeBranch16Target(MCInst &Inst,
                                         unsigned Insn,
                                         uint64_t Address,
                                         const void *Decoder);
static DecodeStatus DecodeBranch24Target(MCInst &Inst,
                                         unsigned Insn,
                                         uint64_t Address,
                                         const void *Decoder);
static DecodeStatus DecodeJumpTarget(MCInst &Inst,
                                     unsigned Insn,
                                     uint64_t Address,
                                     const void *Decoder);
static DecodeStatus DecodeJumpFR(MCInst &Inst,
                                 unsigned Insn,
                                 uint64_t Address,
                                 const void *Decoder);
static DecodeStatus DecodeMem(MCInst &Inst,
                              unsigned Insn,
                              uint64_t Address,
                              const void *decoder);
static DecodeStatus DecodeSimm16(MCInst &Inst,
                                 unsigned Insn,
                                 uint64_t Address,
                                 const void *Decoder);

namespace llvm {
extern Target TheNMXelTarget, TheNMXTarget, TheNMX64Target,
              TheNMX64elTarget;
}

static MCDisassembler *createNMXDisassembler(
    const Target &T,
    const MCSubtargetInfo &STI,
    MCContext &Ctx) {
  return new NMXDisassembler(STI, Ctx, true);
}

static MCDisassembler *createNMXelDisassembler(
    const Target &T,
    const MCSubtargetInfo &STI,
    MCContext &Ctx) {
  return new NMXDisassembler(STI, Ctx, false);
}

extern "C" void LLVMInitializeNMXDisassembler() {
  // Register the disassembler.
  TargetRegistry::RegisterMCDisassembler(getTheNMXTarget(),
                                         createNMXDisassembler);
  TargetRegistry::RegisterMCDisassembler(getTheNMXelTarget(),
                                         createNMXelDisassembler);
}

#include "NMXGenDisassemblerTables.inc"

/// Read four bytes from the ArrayRef and return 32 bit word sorted
/// according to the given endianess
static DecodeStatus readInstruction32(ArrayRef<uint8_t> Bytes, uint64_t Address,
                                      uint64_t &Size, uint32_t &Insn,
                                      bool IsBigEndian) {
  // We want to read exactly 4 Bytes of data.
  if (Bytes.size() < 4) {
    Size = 0;
    return MCDisassembler::Fail;
  }

  if (IsBigEndian) {
    // Encoded as a big-endian 32-bit word in the stream.
    Insn = (Bytes[3] << 0)  |
           (Bytes[2] << 8)  |
           (Bytes[1] << 16) |
           (Bytes[0] << 24);
  } else {
    // Encoded as a little-endian 32-bit word in the stream.
    Insn = (Bytes[0] << 0)  |
           (Bytes[1] << 8)  |
           (Bytes[2] << 16) |
           (Bytes[3] << 24);
  }

  return MCDisassembler::Success;
}

DecodeStatus NMXDisassembler::getInstruction(MCInst &Instr, uint64_t &Size,
                                              ArrayRef<uint8_t> Bytes,
                                              uint64_t Address,
                                              raw_ostream &VStream,
                                              raw_ostream &CStream) const {
  uint32_t Insn;
  DecodeStatus Result;
  Result = readInstruction32(Bytes, Address, Size, Insn, IsBigEndian);

  if (Result == MCDisassembler::Fail)
    return Result;

  // Calling the auto-generated decoder function
  Result = decodeInstruction(DecoderTableNMX32, Instr, Insn, Address, this, STI);

  if (Result != MCDisassembler::Fail) {
    Size = 4;
  }

  return Result;
}

static DecodeStatus DecodeCPURegsRegisterClass(MCInst &Inst,
                                               unsigned RegNo,
                                               uint64_t Address,
                                               const void *Decoder) {
  if (RegNo > 15)
    return MCDisassembler::Fail;

  Inst.addOperand(MCOperand::createReg(CPURegsTable[RegNo]));
  return MCDisassembler::Success;
}

static DecodeStatus DecodeGPROutRegisterClass(MCInst &Inst,
                                              unsigned RegNo,
                                              uint64_t Address,
                                              const void *Decoder) {
  return DecodeCPURegsRegisterClass(Inst, RegNo, Address, Decoder);
}

static DecodeStatus DecodeSRRegisterClass(MCInst &Inst,
                                          unsigned RegNo,
                                          uint64_t Address,
                                          const void *Decoder) {
  return DecodeCPURegsRegisterClass(Inst, RegNo, Address, Decoder);
}

static DecodeStatus DecodeC0RegsRegisterClass(MCInst &Inst,
                                              unsigned RegNo,
                                              uint64_t Address,
                                              const void *Decoder) {
  if (RegNo > 1)
    return MCDisassembler::Fail;

  Inst.addOperand(MCOperand::createReg(C0RegsTable[RegNo]));
  return MCDisassembler::Success;
}

static DecodeStatus DecodeBranch16Target(MCInst &Inst,
                                         unsigned Insn,
                                         uint64_t Address,
                                         const void *Decoder) {
  int BranchOffset = fieldFromInstruction(Insn, 0, 16);
  if (BranchOffset > 0x8fff)
    BranchOffset = -1 * (0x10000 - BranchOffset);

  Inst.addOperand(MCOperand::createImm(BranchOffset));
  return MCDisassembler::Success;
}

static DecodeStatus DecodeBranch24Target(MCInst &Inst,
                                         unsigned Insn,
                                         uint64_t Address,
                                         const void *Decoder) {
  int BranchOffset = fieldFromInstruction(Insn, 0, 24);
  if (BranchOffset > 0x8ffff)
    BranchOffset = -1 * (0x10000000 - BranchOffset);

  Inst.addOperand(MCOperand::createReg(NMX::SW));
  Inst.addOperand(MCOperand::createImm(BranchOffset));
  return MCDisassembler::Success;
}
static DecodeStatus DecodeJumpTarget(MCInst &Inst,
                                     unsigned Insn,
                                     uint64_t Address,
                                     const void *Decoder) {
  unsigned JumpOffset = fieldFromInstruction(Insn, 0, 24);
  Inst.addOperand(MCOperand::createImm(JumpOffset));
  return MCDisassembler::Success;
}

static DecodeStatus DecodeJumpFR(MCInst &Inst,
                                 unsigned Insn,
                                 uint64_t Address,
                                 const void *Decoder) {
  int Reg = (int)fieldFromInstruction(Insn, 20, 4);
  Inst.addOperand(MCOperand::createReg(CPURegsTable[Reg]));
  if (CPURegsTable[Reg] == NMX::LR)
    Inst.setOpcode(NMX::RET);
  else
    Inst.setOpcode(NMX::JR);
  return MCDisassembler::Success;
}

static DecodeStatus DecodeMem(MCInst &Inst,
                              unsigned Insn,
                              uint64_t Address,
                              const void *decoder) {
  int Offset = SignExtend32<16>(Insn & 0xffff);
  int Reg = (int)fieldFromInstruction(Insn, 20, 4);
  int Base = (int)fieldFromInstruction(Insn, 16, 4);

  Inst.addOperand(MCOperand::createReg(CPURegsTable[Reg]));
  Inst.addOperand(MCOperand::createReg(CPURegsTable[Base]));
  Inst.addOperand(MCOperand::createImm(Offset));

  return MCDisassembler::Success;
}

static DecodeStatus DecodeSimm16(MCInst &Inst,
                                 unsigned Insn,
                                 uint64_t Address,
                                 const void *Decoder) {
  Inst.addOperand(MCOperand::createImm(SignExtend32<16>(Insn)));
  return MCDisassembler::Success;
}
