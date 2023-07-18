//===--NMXFixupKinds.h - NMX Specific Fixup Entries ----------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_CPU0_MCTARGETDESC_CPU0FIXUPKINDS_H
#define LLVM_LIB_TARGET_CPU0_MCTARGETDESC_CPU0FIXUPKINDS_H

#include "llvm/MC/MCFixup.h"

namespace llvm {
namespace Cpu0 {
  // Although most of the current fixup types reflect a unique relocation
  // one can have multiple fixup types for a given relocation and thus need
  // to be uniquely named.

  // This table *must* be in the save order of
  // MCFixupKindInfo Infos[Cpu0::NumTargetFixupKinds]
  // in NMXAsmBackend.cpp.
  enum Fixups {
    // Pure upper 32 bit fixup resulting in - R_NMX_32.
    fixup_NMX_32 = FirstTargetFixupKind,

    // Pure upper 16 bit fixup resulting in - R_NMX_HI16.
    fixup_NMX_HI16,

    // Pure lower 16 bit fixup resulting in - R_NMX_LO16.
    fixup_NMX_LO16,

    // 16 bits fixup for GP offset resulting in - R_NMX_GPREL16.
    fixup_NMX_GPREL16,

    // Symbol fixup resulting in - R_NMX0_GOT16.
    fixup_NMX_GOT,

    // resulting in - R_NMX_GOT_HI16.
    fixup_NMX_GOT_HI16,

    // resulting in - R_CPU0_GOT_LO16.
    fixup_NMX_GOT_LO16,

    // PC relative branch fixup resulting in - R_CPU0_PC16.
    fixup_NMX_PC16,

    // PC relative branch fixup resulting in - R_CPU0_PC24.
    fixup_NMX_PC24,

    // resulting in R_CPU0_CALL16
    fixup_NMX_CALL16,

    // Marker
    LastTargetFixupKind,
    NumTargetFixupKinds = LastTargetFixupKind - FirstTargetFixupKind
  };
} // namespace NMX
} // namespace llvm

#endif
