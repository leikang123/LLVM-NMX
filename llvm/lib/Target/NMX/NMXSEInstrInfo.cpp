//===-- NMXSEInstrInfo.cpp - NMX32/64 Instruction Information -----------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the NMX32/64 implementation of the TargetInstrInfo class.
//
//===----------------------------------------------------------------------===//

#include "NMXSEInstrInfo.h"

#include "NMXMachineFunctionInfo.h"
#include "NMXAnalyzeImmediate.h"
#include "NMXTargetMachine.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

NMXSEInstrInfo::NMXSEInstrInfo(const NMXSubtarget &STI)
    : NMXInstrInfo(STI),
      RI(STI) {}

const NMXRegisterInfo &NMXSEInstrInfo::getRegisterInfo() const {
  return RI;
}

void NMXSEInstrInfo::copyPhysReg(MachineBasicBlock &MBB,
                                  MachineBasicBlock::iterator I,
                                  const DebugLoc &DL, unsigned DestReg,
                                  unsigned SrcReg, bool KillSrc) const {
  unsigned Opc = 0, ZeroReg = 0;

  if (NMX::CPURegsRegClass.contains(DestReg)) {  // Copy to CPU Reg
    if (NMX::CPURegsRegClass.contains(SrcReg))
      Opc = NMX::ADDu, ZeroReg = NMX::ZERO;
    else if (SrcReg == NMX::HI)
      Opc = NMX::MFHI, SrcReg = 0;
    else if (SrcReg == NMX::LO)
      Opc = NMX::MFLO, SrcReg = 0;
  }
  else if (NMX::CPURegsRegClass.contains(SrcReg)) {  // Copy from CPU Reg
    if (DestReg == NMX::HI)
      Opc = NMX::MTHI, DestReg = 0;
    else if (DestReg == NMX::LO)
      Opc = NMX::MTLO, DestReg = 0;
  }

  assert(Opc && "Cannot copy registers");

  MachineInstrBuilder MIB = BuildMI(MBB, I, DL, get(Opc));

  if (DestReg)
    MIB.addReg(DestReg, RegState::Define);

  if (ZeroReg)
    MIB.addReg(ZeroReg);

  if (SrcReg)
    MIB.addReg(SrcReg, getKillRegState(KillSrc));
}

const NMXInstrInfo *llvm::createNMXSEInstrInfo(const NMXSubtarget &STI) {
  return new NMXSEInstrInfo(STI);
}

bool NMXSEInstrInfo::expandPostRAPseudo(MachineInstr &MI) const {
  MachineBasicBlock &MBB = *MI.getParent();

  switch(MI.getDesc().getOpcode()) {
    default:
      return false;
    case NMX::RetLR:
      expandRetLR(MBB, MI);
      break;
  }

  MBB.erase(MI);
  return true;
}

void NMXSEInstrInfo::expandRetLR(MachineBasicBlock &MBB,
                                  MachineBasicBlock::iterator I) const {
  BuildMI(MBB, I, I->getDebugLoc(), get(NMX::RET)).addReg(NMX::LR);
}

void NMXSEInstrInfo::
storeRegToStack(MachineBasicBlock &MBB, MachineBasicBlock::iterator I,
                unsigned SrcReg, bool isKill, int FI,
                const TargetRegisterClass *RC, const TargetRegisterInfo *TRI,
                int64_t Offset) const {
  DebugLoc DL;
  MachineMemOperand *MMO = GetMemOperand(MBB, FI, MachineMemOperand::MOStore);

  unsigned Opc = 0;

  Opc = NMX::ST;
  assert(Opc && "Register class not handled!");
  BuildMI(MBB, I, DL, get(Opc)).addReg(SrcReg, getKillRegState(isKill))
    .addFrameIndex(FI).addImm(Offset).addMemOperand(MMO);
}

void NMXSEInstrInfo::
loadRegFromStack(MachineBasicBlock &MBB, MachineBasicBlock::iterator I,
                 unsigned DestReg, int FI, const TargetRegisterClass *RC,
                 const TargetRegisterInfo *TRI, int64_t Offset) const {
  DebugLoc DL;
  if (I != MBB.end()) DL = I->getDebugLoc();
  MachineMemOperand *MMO = GetMemOperand(MBB, FI, MachineMemOperand::MOLoad);
  unsigned Opc = 0;

  Opc = NMX::LD;
  assert(Opc && "Register class not handled!");
  BuildMI(MBB, I, DL, get(Opc), DestReg).addFrameIndex(FI).addImm(Offset)
    .addMemOperand(MMO);
}

// Adjust SP by Amount bytes.
void NMXSEInstrInfo::adjustStackPtr(unsigned SP, int64_t Amount,
                                     MachineBasicBlock &MBB,
                                     MachineBasicBlock::iterator I) const {
  DebugLoc DL = I != MBB.end() ? I->getDebugLoc() : DebugLoc();
  unsigned ADDu = NMX::ADDu;
  unsigned ADDiu = NMX::ADDiu;

  if (isInt<16>(Amount)) {
    // addiu sp, sp, amount
    BuildMI(MBB, I, DL, get(ADDiu), SP).addReg(SP).addImm(Amount);
  }
  else { // Expand immediate that doesn't fit in 16-bit.
    unsigned Reg = loadImmediate(Amount, MBB, I, DL, nullptr);
    BuildMI(MBB, I, DL, get(ADDu), SP).addReg(SP).addReg(Reg, RegState::Kill);
  }
}

// This function generates the sequence of instructions needed to get the
// result of adding register REG and immediate IMM.
unsigned NMXSEInstrInfo::loadImmediate(int64_t Imm, MachineBasicBlock &MBB,
                                        MachineBasicBlock::iterator II,
                                        const DebugLoc &DL,
                                        unsigned *NewImm) const {
  NMXAnalyzeImmediate AnalyzeImm;
  unsigned Size = 32;
  unsigned LUi = NMX::LUi;
  unsigned ZEROReg = NMX::ZERO;
  unsigned ATReg = NMX::AT;
  bool LastInstrIsADDiu = NewImm;

  const NMXAnalyzeImmediate::InstSeq &Seq =
    AnalyzeImm.Analyze(Imm, Size, LastInstrIsADDiu);
  NMXAnalyzeImmediate::InstSeq::const_iterator Inst = Seq.begin();

  assert(Seq.size() && (!LastInstrIsADDiu || (Seq.size() > 1)));

  // The first instruction can be a LUi, which is different from other
  // instructions (ADDiu, ORI and SLL) in that it does not have a register
  // operand.
  if (Inst->Opc == LUi)
    BuildMI(MBB, II, DL, get(LUi), ATReg).addImm(SignExtend64<16>(Inst->ImmOperand));
  else
    BuildMI(MBB, II, DL, get(Inst->Opc), ATReg).addReg(ZEROReg)
      .addImm(SignExtend64<16>(Inst->ImmOperand));

  // Build the remaining instructions in Seq.
  for (++Inst; Inst != Seq.end() - LastInstrIsADDiu; ++Inst)
    BuildMI(MBB, II, DL, get(Inst->Opc), ATReg).addReg(ATReg)
      .addImm(SignExtend64<16>(Inst->ImmOperand));

  if (LastInstrIsADDiu)
    *NewImm = Inst->ImmOperand;

  return ATReg;
}