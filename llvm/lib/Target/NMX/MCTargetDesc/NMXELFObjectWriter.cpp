//===-- nmxELFObjectWriter.cpp - nmx ELF Writer ----------------------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "MCTargetDesc/nmxBaseInfo.h"
#include "MCTargetDesc/nmxFixupKinds.h"
#include "MCTargetDesc/nmxMCTargetDesc.h"

#include "llvm/BinaryFormat/ELF.h"
#include "llvm/MC/MCAssembler.h"
#include "llvm/MC/MCELFObjectWriter.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCSection.h"
#include "llvm/MC/MCValue.h"
#include "llvm/Support/ErrorHandling.h"
#include <list>

using namespace llvm;

namespace {
  class nmxELFObjectWriter : public MCELFObjectTargetWriter {
  public:
    nmxELFObjectWriter(uint8_t OSABI);

    ~nmxELFObjectWriter() override;

    unsigned getRelocType(MCContext &Ctx, const MCValue &Target,
                          const MCFixup &Fixup, bool IsPCRel) const override;
    bool needsRelocateWithSymbol(const MCSymbol &Sym,
                                 unsigned Type) const override;
  };
}

nmxELFObjectWriter::nmxELFObjectWriter(uint8_t OSABI)
  : MCELFObjectTargetWriter(/*_is64Bit=false*/false, OSABI, ELF::EM_nmx,
                            /*HasRelocationAddend*/false) {}

nmxELFObjectWriter::~nmxELFObjectWriter() {}

unsigned nmxELFObjectWriter::getRelocType(MCContext &Ctx,
                                           const MCValue &Target,
                                           const MCFixup &Fixup,
                                           bool IsPCRel) const {
  // determine the type of the relocation
  unsigned Type = (unsigned)ELF::R_nmx_NONE;
  unsigned Kind = (unsigned)Fixup.getKind();

  switch(Kind) {
  default:
    llvm_unreachable("invalid fixup kind!");
  case FK_Data_4:
    Type = ELF::R_nmx_32;
    break;
  case FK_GPRel_4:
    Type = ELF::R_nmx_GPREL32;
    break;
  case nmx::fixup_nmx_32:
    Type = ELF::R_nmx_32;
    break;
  case nmx::fixup_nmx_GPREL16:
    Type = ELF::R_nmx_GPREL16;
    break;
  case nmx::fixup_nmx_GOT:
    Type = ELF::R_nmx_GOT16;
    break;
  case nmx::fixup_nmx_HI16:
    Type = ELF::R_nmx_HI16;
    break;
  case nmx::fixup_nmx_LO16:
    Type = ELF::R_nmx_LO16;
    break;
  case nmx::fixup_nmx_GOT_HI16:
    Type = ELF::R_nmx_GOT_HI16;
    break;
  case nmx::fixup_nmx_GOT_LO16:
    Type = ELF::R_nmx_GOT_LO16;
    break;
  case nmx::fixup_nmx_PC16:
    Type = ELF::R_nmx_PC16;
    break;
  case nmx::fixup_nmx_PC24:
    Type = ELF::R_nmx_PC24;
    break;
  case nmx::fixup_nmx_CALL16:
    Type = ELF::R_nmx_CALL16;
    break;
  }

  return Type;
}

bool nmxELFObjectWriter::needsRelocateWithSymbol(const MCSymbol &Sym,
                                                  unsigned Type) const {
  // FIXME: This is extremely conservative. This really needs to use a
  // whitelist with a clear explanation for why each realocation needs to
  // point to the symbol, not to the section.
  switch (Type) {
  default:
    return true;

  case ELF::R_nmx_GOT16:
    return true;

  // These relocations might be paired with another relocation. The pairing is
  // done by the static linker by matching the symbol. Since we only see one
  // relocation at a time, we have to force them to relocation with a symbol to
  // avoid ending up with a pair where one points to a section and another
  // points to a symbol.
  case ELF::R_nmx_HI16:
  case ELF::R_nmx_LO16:
  case ELF::R_nmx_32:
    return true;

  case ELF::R_nmx_GPREL16:
    return false;
  }
}

std::unique_ptr<MCObjectTargetWriter>
llvm::createnmxELFObjectWriter(const Triple &TT) {
  uint8_t OSABI = MCELFObjectTargetWriter::getOSABI(TT.getOS());
  return llvm::make_unique<nmxELFObjectWriter>(OSABI);
}
