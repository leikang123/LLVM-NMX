//===-- nmxAsmBackend.h - nmx Asm Backend ---------------------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file defines the nmxAsmBackend class.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_nmx_MCTARGETDESC_nmxASMBACKEND_H
#define LLVM_LIB_TARGET_nmx_MCTARGETDESC_nmxASMBACKEND_H

#include "MCTargetDesc/nmxFixupKinds.h"
#include "llvm/ADT/Triple.h"
#include "llvm/MC/MCAsmBackend.h"

namespace llvm {
  class MCAssembler;
  struct MCFixupKindInfo;
  class MCObjectWriter;
  class MCRegisterInfo;
  class MCSymbolELF;
  class Target;

  class nmxAsmBackend : public MCAsmBackend {
    Triple TheTriple;

  public:
    nmxAsmBackend(const Target &T, const MCRegisterInfo &MRI, const Triple &TT,
                   StringRef CPU)
        : MCAsmBackend(TT.isLittleEndian() ? support::little : support::big),
          TheTriple(TT) {}

    std::unique_ptr<MCObjectTargetWriter>
    createObjectTargetWriter() const override;

    void applyFixup(const MCAssembler &Asm, const MCFixup &Fixup,
                    const MCValue &Target, MutableArrayRef<char> Data,
                    uint64_t Value, bool IsResolved,
                    const MCSubtargetInfo *STI) const override;

    const MCFixupKindInfo &getFixupKindInfo(MCFixupKind Kind) const override;

    unsigned getNumFixupKinds() const override {
      return nmx::NumTargetFixupKinds;
    }

    /// Target Relaxation Interfaces
    /// @{

    /// Check whether the given instruction may need relaxation
    bool mayNeedRelaxation(const MCInst &Inst,
                           const MCSubtargetInfo &STI) const override {
      return false;
    }

    /// Target specific predicate for whether a given fixup registers
    /// the associated instruction to be relaxed.
    bool fixupNeedsRelaxation(const MCFixup &Fixup, uint64_t Value,
                              const MCRelaxableFragment *DF,
                              const MCAsmLayout &Layout) const override {
    /// FIXME.
    llvm_unreachable("RelaxInstruction() unimplemented");
    return false;
    }

    /// Relax the instruction in the given fragment to the next wider instruction.
    void relaxInstruction(const MCInst &Inst, const MCSubtargetInfo &STI,
                          MCInst &Res) const override {}

    /// @}

    bool writeNopData(raw_ostream &OS, uint64_t Count) const override;
  };  // class nmxAsmBackend

}  // namespace

#endif