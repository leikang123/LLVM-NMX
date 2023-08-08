//===-- nmxMCAsmInfo.h - nmx Asm Info -------------------------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the declaration of the nmxMCAsmInfo class.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_nmx_MCTARGETDESC_nmxMCASMINFO_H
#define LLVM_LIB_TARGET_nmx_MCTARGETDESC_nmxMCASMINFO_H

#include "llvm/MC/MCAsmInfoELF.h"

namespace llvm {
  class Triple;

  class nmxMCAsmInfo : public MCAsmInfoELF {
    void anchor() override;
  public:
    explicit nmxMCAsmInfo(const Triple &TheTriple);
  };

} // end namespace llvm

#endif
