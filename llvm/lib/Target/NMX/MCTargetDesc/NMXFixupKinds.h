//===-- nmxFixupKinds.h - nmx Specific Fixup Entries ----------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_nmx_MCTARGETDESC_nmxFIXUPKINDS_H
#define LLVM_LIB_TARGET_nmx_MCTARGETDESC_nmxFIXUPKINDS_H

#include "llvm/MC/MCFixup.h"

namespace llvm {
namespace nmx {
  // Although most of the current fixup types reflect a unique relocation
  // one can have multiple fixup types for a given relocation and thus need
  // to be uniquely named.

  // This table *must* be in the save order of
  // MCFixupKindInfo Infos[nmx::NumTargetFixupKinds]
  // in nmxAsmBackend.cpp.
  enum Fixups {
    // Pure upper 32 bit fixup resulting in - R_nmx_32.
    fixup_nmx_32 = FirstTargetFixupKind,

    // Pure upper 16 bit fixup resulting in - R_nmx_HI16.
    fixup_nmx_HI16,

    // Pure lower 16 bit fixup resulting in - R_nmx_LO16.
    fixup_nmx_LO16,

    // 16 bits fixup for GP offset resulting in - R_nmx_GPREL16.
    fixup_nmx_GPREL16,

    // Symbol fixup resulting in - R_nmx_GOT16.
    fixup_nmx_GOT,

    // resulting in - R_nmx_GOT_HI16.
    fixup_nmx_GOT_HI16,

    // resulting in - R_nmx_GOT_LO16.
    fixup_nmx_GOT_LO16,

    // PC relative branch fixup resulting in - R_nmx_PC16.
    fixup_nmx_PC16,

    // PC relative branch fixup resulting in - R_nmx_PC24.
    fixup_nmx_PC24,

    // resulting in R_nmx_CALL16
    fixup_nmx_CALL16,

    // Marker
    LastTargetFixupKind,
    NumTargetFixupKinds = LastTargetFixupKind - FirstTargetFixupKind
  };
} // namespace nmx
} // namespace llvm

#endif
