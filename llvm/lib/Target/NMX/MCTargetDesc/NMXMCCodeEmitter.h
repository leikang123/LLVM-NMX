//===-- nmxMCCodeEmitter.h - Convert nmx Code to Machine Code -*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file defines the nmxMCCodeEmitter class.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_nmx_MCTARGETDESC_nmxMCCOEEMITTER_H
#define LLVM_LIB_TARGET_nmx_MCTARGETDESC_nmxMCCOEEMITTER_H

#include "llvm/MC/MCCodeEmitter.h"
#include <cstdint>

using namespace llvm;

namespace llvm {

class MCContext;
class MCExpr;
class MCInst;
class MCInstrInfo;
class MCFixup;
class MCOperand;
class MCSubtargetInfo;
class raw_ostream;

class nmxMCCodeEmitter : public MCCodeEmitter {
  const MCInstrInfo &MCII;
  MCContext &Ctx;
  bool IsLittleEndian;

public:
  nmxMCCodeEmitter(const MCInstrInfo &mcii, MCContext &Ctx_, bool IsLittle)
      : MCII(mcii), Ctx(Ctx_), IsLittleEndian(IsLittle) {}
  nmxMCCodeEmitter(const nmxMCCodeEmitter &) = delete;
  nmxMCCodeEmitter &operator=(const nmxMCCodeEmitter &) = delete;
  ~nmxMCCodeEmitter() override = default;

  void EmitByte(unsigned char C, raw_ostream &OS) const;

  void EmitInstruction(uint64_t Val, unsigned Size, raw_ostream &OS) const;

  void encodeInstruction(const MCInst &MI, raw_ostream &OS,
                         SmallVectorImpl<MCFixup> &Fixups,
                         const MCSubtargetInfo &STI) const override;

  // TableGen'erated function for getting the binary encoding
  // for an instruction.
  uint64_t getBinaryCodeForInstr(const MCInst &MI,
                                 SmallVectorImpl<MCFixup> &Fixups,
                                 const MCSubtargetInfo &STI) const;

  // Return binary encoding of the branch target operand,
  // such as BEQ, BNE. If the machine operand requires relocation,
  // record the relocation and return zero.
  unsigned getBranch16TargetOpValue(const MCInst &MI, unsigned OpNo,
                                    SmallVectorImpl<MCFixup> &Fixups,
                                    const MCSubtargetInfo &STI) const;

  // Return binary encoding of the branch target operand,
  // such as JMP. If the machine operand requires relocation,
  // record the relocation and return zero.
  unsigned getBranch24TargetOpValue(const MCInst &MI, unsigned OpNo,
                                    SmallVectorImpl<MCFixup> &Fixups,
                                    const MCSubtargetInfo &STI) const;

  // Return binary encoding of the jump target operand,
  // such as JSUB #function_addr. If the machine operand requires relocation,
  // record the relocation and return zero.
  unsigned getJumpTargetOpValue(const MCInst &MI, unsigned OpNo,
                                SmallVectorImpl<MCFixup> &FIxups,
                                const MCSubtargetInfo &STI) const;

  // Return binary encoding of operand.
  // If the machine operand requires relocation,
  // record the relocation and return zero.
  unsigned getMachineOpValue(const MCInst &MI, const MCOperand &MO,
                             SmallVectorImpl<MCFixup> &Fixups,
                             const MCSubtargetInfo &STI) const;

  unsigned getMemEncoding(const MCInst &MI, unsigned OpNo,
                          SmallVectorImpl<MCFixup> &Fixups,
                          const MCSubtargetInfo &STI) const;

  unsigned getExprOpValue(const MCExpr *Expr, SmallVectorImpl<MCFixup> &Fixups,
                          const MCSubtargetInfo &STI) const;
}; // class nmxMCCodeEmitter
} // namespace llvm

#endif
