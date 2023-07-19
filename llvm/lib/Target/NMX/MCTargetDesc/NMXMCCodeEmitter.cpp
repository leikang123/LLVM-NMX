//===-- nmxMCCodeEmitter.cpp - Convert nmx Code to Machine Code -*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements the nmxMCCodeEmitter class.
//
//===----------------------------------------------------------------------===//

#include "nmxMCCodeEmitter.h"

#include "MCTargetDesc/nmxBaseInfo.h"
#include "MCTargetDesc/nmxFixupKinds.h"
#include "MCTargetDesc/nmxMCExpr.h"
#include "MCTargetDesc/nmxMCTargetDesc.h"

#include "llvm/ADT/APFloat.h"
#include "llvm/MC/MCCodeEmitter.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCFixup.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCInstrDesc.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/Support/raw_ostream.h"

#define DEBUG_TYPE "mccodeemitter"

#define GET_INSTRMAP_INFO
#include "nmxGenInstrInfo.inc"
#undef GET_INSTRMAP_INFO

namespace llvm {
MCCodeEmitter *createnmxMCCodeEmitterEB(const MCInstrInfo &MCII,
                                               const MCRegisterInfo &MRI,
                                               MCContext &Ctx) {
  return new nmxMCCodeEmitter(MCII, Ctx, false);
}

MCCodeEmitter *createnmxMCCodeEmitterEL(const MCInstrInfo &MCII,
                                               const MCRegisterInfo &MRI,
                                               MCContext &Ctx) {
  return new nmxMCCodeEmitter(MCII, Ctx, true);
}
} // namespace llvm

void nmxMCCodeEmitter::EmitByte(unsigned char C, raw_ostream &OS) const {
  OS << (char)C;
}

void nmxMCCodeEmitter::EmitInstruction(uint64_t Val, unsigned Size,
                                        raw_ostream &OS) const {
  // Output the instruction encoding in little endian byte order.
  for (unsigned i = 0; i < Size; ++i) {
    unsigned Shift = IsLittleEndian ? i*8 : (Size - 1 - i) * 8;
    EmitByte((Val >> Shift) & 0xff, OS);
  }
}

// Emit the instruction.
// Size the instruction (currently only 4 bytes)
void nmxMCCodeEmitter::encodeInstruction(const MCInst &MI, raw_ostream &OS,
                                          SmallVectorImpl<MCFixup> &Fixups,
                                          const MCSubtargetInfo &STI) const {
  uint32_t Binary = getBinaryCodeForInstr(MI, Fixups, STI);

  // Check for unimplemented opcodes.
  unsigned Opcode = MI.getOpcode();
  if ((Opcode != nmx::NOP) && !Binary)
    llvm_unreachable("unimplemented opcode in encodeInstruction()");

  const MCInstrDesc &Desc = MCII.get(MI.getOpcode());
  uint64_t TSFlags = Desc.TSFlags;

  // Pseudo instruction don't get encoded
  // and shouldn't be here in the first place.
  if ((TSFlags & nmxII::FrmMask) == nmxII::Pseudo)
    llvm_unreachable("Pseudo opcode found in encodeInstruction()");

  // For now all instruction are 4 bytes
  int Size = 4; // FIXME: Have Desc.getSize() return the correct value

  EmitInstruction(Binary, Size, OS);
}

/// getBranch16TargetOpValue - Return binary encoding of the branch 24bits
/// target operand. If the machine operand requires relocation,
/// record the relocation and return zero.
unsigned nmxMCCodeEmitter::
getBranch16TargetOpValue(const MCInst &MI, unsigned OpNo,
                         SmallVectorImpl<MCFixup> &Fixups,
                         const MCSubtargetInfo &STI) const {
  const MCOperand &MO = MI.getOperand(OpNo);

  // If the destination is an immediate, we have nothing to do.
  if (MO.isImm()) return MO.getImm();
  assert(MO.isExpr() && "getBranch16TargetOpValue expects only expressions");

  const MCExpr *Expr = MO.getExpr();
  Fixups.push_back(MCFixup::create(0, Expr,
                                   MCFixupKind(nmx::fixup_nmx_PC16)));
  return 0;
}

/// getBranch24TargetOpValue - Return binary encoding of the branch 24bits
/// target operand. If the machine operand requires relocation,
/// record the relocation and return zero.
unsigned nmxMCCodeEmitter::
getBranch24TargetOpValue(const MCInst &MI, unsigned OpNo,
                         SmallVectorImpl<MCFixup> &Fixups,
                         const MCSubtargetInfo &STI) const {
  const MCOperand &MO = MI.getOperand(OpNo);

  // If the destination is an immediate, we have nothing to do.
  if (MO.isImm()) return MO.getImm();
  assert(MO.isExpr() && "getBranch24TargetOpValue expects only expressions");

  const MCExpr *Expr = MO.getExpr();
  Fixups.push_back(MCFixup::create(0, Expr,
                                   MCFixupKind(nmx::fixup_nmx_PC24)));
  return 0;
}

/// getJumpTargetOpValue - Return binary encoding of the jump
/// target operand, such as JSUB..
/// If the machine operand requires relocation,
/// record the relocation and return zero.
unsigned nmxMCCodeEmitter::
getJumpTargetOpValue(const MCInst &MI, unsigned OpNo,
                     SmallVectorImpl<MCFixup> &Fixups,
                     const MCSubtargetInfo &STI) const {
  unsigned Opcode = MI.getOpcode();
  const MCOperand &MO = MI.getOperand(OpNo);
  // If the destination is an immediate, we have nothing to do.
  if (MO.isImm()) return MO.getImm();
  assert(MO.isExpr() && "getJumpTargetOpValue expects only expressions");

  const MCExpr *Expr = MO.getExpr();
  if (Opcode == nmx::JMP || Opcode == nmx::JSUB)
    Fixups.push_back(MCFixup::create(0, Expr,
                                     MCFixupKind(nmx::fixup_nmx_PC24)));
  else
    llvm_unreachable("unexpect opcode in getJumpAbsoluteTargetOpValue()");
  return 0;
}

unsigned nmxMCCodeEmitter::getExprOpValue(const MCExpr *Expr,
                                           SmallVectorImpl<MCFixup> &Fixups,
                                           const MCSubtargetInfo &STI) const {
  MCExpr::ExprKind Kind = Expr->getKind();
  if (Kind == MCExpr::Constant) {
    return cast<MCConstantExpr>(Expr)->getValue();
  }

  if (Kind == MCExpr::Binary) {
    unsigned Res = getExprOpValue(cast<MCBinaryExpr>(Expr)->getLHS(), Fixups, STI);
    Res += getExprOpValue(cast<MCBinaryExpr>(Expr)->getRHS(), Fixups, STI);
    return Res;
  }

  if (Kind == MCExpr::Target) {
    const nmxMCExpr *nmxExpr = cast<nmxMCExpr>(Expr);

    nmx::Fixups FixupKind = nmx::Fixups(0);
    switch(nmxExpr->getKind()) {
    default: llvm_unreachable("Unsupported fixup kind for target expression!");
    case nmxMCExpr::CEK_GPREL:
      FixupKind = nmx::fixup_nmx_GPREL16;
      break;
    case nmxMCExpr::CEK_GOT_CALL:
      FixupKind = nmx::fixup_nmx_CALL16;
      break;
    case nmxMCExpr::CEK_GOT:
      FixupKind = nmx::fixup_nmx_GOT;
      break;
    case nmxMCExpr::CEK_ABS_HI:
      FixupKind = nmx::fixup_nmx_HI16;
      break;
    case nmxMCExpr::CEK_ABS_LO:
      FixupKind = nmx::fixup_nmx_LO16;
      break;
    case nmxMCExpr::CEK_GOT_HI16:
      FixupKind = nmx::fixup_nmx_GOT_HI16;
      break;
    case nmxMCExpr::CEK_GOT_LO16:
      FixupKind = nmx::fixup_nmx_GOT_LO16;
      break;
    }
    Fixups.push_back(MCFixup::create(0, nmxExpr, MCFixupKind(FixupKind)));
    return 0;
  }

  // All of the information is in the fixup.
  return 0;
}

unsigned nmxMCCodeEmitter::
getMachineOpValue(const MCInst &MI, const MCOperand &MO,
                  SmallVectorImpl<MCFixup> &Fixups,
                  const MCSubtargetInfo &STI) const {
  if (MO.isReg()) {
    unsigned Reg = MO.getReg();
    unsigned RegNo = Ctx.getRegisterInfo()->getEncodingValue(Reg);
    return RegNo;
  } else if (MO.isImm()) {
    return static_cast<unsigned>(MO.getImm());
  } else if (MO.isFPImm()) {
    return static_cast<unsigned>(APFloat(MO.getFPImm())
          .bitcastToAPInt().getHiBits(32).getLimitedValue());
  }

  // MO must be an Expr.
  assert(MO.isExpr());
  return getExprOpValue(MO.getExpr(), Fixups, STI);
}

unsigned nmxMCCodeEmitter::getMemEncoding(const MCInst &MI, unsigned OpNo,
                                           SmallVectorImpl<MCFixup> &Fixups,
                                           const MCSubtargetInfo &STI) const {
  // Base register is encoded in bits 20-16, offset is encoded in bits 15-0.
  assert(MI.getOperand(OpNo).isReg());
  unsigned RegBits = getMachineOpValue(MI, MI.getOperand(OpNo), Fixups, STI) << 16;
  unsigned OffBits = getMachineOpValue(MI, MI.getOperand(OpNo+1), Fixups, STI);

  return (OffBits & 0xFFFF) | RegBits;
}

#include "nmxGenMCCodeEmitter.inc"
