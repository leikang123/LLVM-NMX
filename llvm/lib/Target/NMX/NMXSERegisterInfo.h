//===-- NMXSERegisterInfo.h - NMX32 Register Information ------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the NMX32/64 implementation of the TargetRegisterInfo
// class.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_NMX_NMXSEREGISTERINFO_H
#define LLVM_LIB_TARGET_NMX_NMXSEREGISTERINFO_H

#include "NMXRegisterInfo.h"

namespace llvm {
class NMXSEInstrInfo;

class NMXSERegisterInfo : public NMXRegisterInfo {
public:
  NMXSERegisterInfo(const NMXSubtarget &Subtarget);

  const TargetRegisterClass *intRegClass(unsigned Size) const override;
};

} // end namespace llvm

#endif
