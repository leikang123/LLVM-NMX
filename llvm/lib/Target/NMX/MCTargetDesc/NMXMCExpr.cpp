//===-- nmxMCExpr.cpp - nmx specific MC expression classes ----*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "nmx.h"

#include "nmxMCExpr.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCAssembler.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCObjectStreamer.h"
#include "llvm/MC/MCSymbolELF.h"
#include "llvm/BinaryFormat/ELF.h"

using namespace llvm;

#define DEBUG_TYPE "nmxmcexpr"

const nmxMCExpr *nmxMCExpr::create(nmxMCExpr::nmxExprKind Kind,
                                     const MCExpr *Expr, MCContext &Ctx) {
  return new (Ctx)nmxMCExpr(Kind, Expr);
}

const nmxMCExpr *nmxMCExpr::create(const MCSymbol *Symbol,
                                     nmxMCExpr::nmxExprKind Kind,
                                     MCContext &Ctx) {
  const MCSymbolRefExpr *MCSym =
      MCSymbolRefExpr::create(Symbol, MCSymbolRefExpr::VK_None, Ctx);
  return new (Ctx)nmxMCExpr(Kind, MCSym);
}

const nmxMCExpr *nmxMCExpr::createGpOff(nmxMCExpr::nmxExprKind Kind,
                                          const MCExpr *Expr, MCContext &Ctx) {
  return create(Kind, create(CEK_None, create(CEK_GPREL, Expr, Ctx), Ctx), Ctx);
}

void nmxMCExpr::printImpl(raw_ostream &OS, const MCAsmInfo *MAI) const {
  int64_t AbsVal;

  switch (Kind) {
  case CEK_None:
  case CEK_Special:
    llvm_unreachable("CEK_None and CEK_Special are invalid");
    break;
  case CEK_CALL_HI16:
    OS << "%call_hi";
    break;
  case CEK_CALL_LO16:
    OS << "%call_lo";
    break;
  case CEK_DTP_HI:
    OS << "%dtp_hi";
    break;
  case CEK_DTP_LO:
    OS << "%dtp_lo";
    break;
  case CEK_GOT:
    OS << "%got";
    break;
  case CEK_GOTTPREL:
    OS << "%gottprel";
    break;
  case CEK_GOT_CALL:
    OS << "%call16";
    break;
  case CEK_GOT_DISP:
    OS << "%got_disp";
    break;
  case CEK_GOT_HI16:
    OS << "%got_hi";
    break;
  case CEK_GOT_LO16:
    OS << "%got_lo";
    break;
  case CEK_GPREL:
    OS << "%gp_rel";
    break;
  case CEK_ABS_HI:
    OS << "%hi";
    break;
  case CEK_ABS_LO:
    OS << "%lo";
    break;
  case CEK_TLSLDM:
    OS << "%tlsldm";
    break;
  case CEK_TP_HI:
    OS << "%tp_hi";
    break;
  case CEK_TP_LO:
    OS << "%tp_lo";
    break;
  }

  OS << '(';
  if (Expr->evaluateAsAbsolute(AbsVal))
    OS << AbsVal;
  else
    Expr->print(OS, MAI, true);
  OS << ')';
}

bool nmxMCExpr::evaluateAsRelocatableImpl(MCValue &Res,
                                           const MCAsmLayout *Layout,
                                           const MCFixup *Fixup) const {
  return getSubExpr()->evaluateAsRelocatable(Res, Layout, Fixup);
}

void nmxMCExpr::visitUsedExpr(MCStreamer &Streamer) const {
  Streamer.visitUsedExpr(*getSubExpr());
}

void nmxMCExpr::fixELFSymbolsInTLSFixups(MCAssembler &Asm) const {
  switch (getKind()) {
  case CEK_None:
  case CEK_Special:
    llvm_unreachable("CEK_None and CEK_Special are invalid");
    break;
  case CEK_CALL_HI16:
  case CEK_CALL_LO16:
    break;
  }
}

bool nmxMCExpr::isGpOff(nmxExprKind &Kind) const {
  if (const nmxMCExpr *S1 = dyn_cast<const nmxMCExpr>(getSubExpr())) {
    if (const nmxMCExpr *S2 = dyn_cast<const nmxMCExpr>(S1->getSubExpr())) {
      if (S1->getKind() == CEK_None && S2->getKind() == CEK_GPREL) {
        Kind = getKind();
        return true;
      }
    }
  }
  return false;
}