//===-- NMXSERegisterInfo.cpp - NMX Register Information ------== -------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the NMX implementation of the TargetRegisterInfo
// class.
//
//===----------------------------------------------------------------------===//

#include "NMXSERegisterInfo.h"

using namespace llvm;

#define DEBUG_TYPE "NMX-reg-info"

NMXSERegisterInfo::NMXSERegisterInfo(const NMXSubtarget &ST)
  : NMXRegisterInfo(ST) {}

const TargetRegisterClass *
NMXSERegisterInfo::intRegClass(unsigned Size) const {
  return &NMX::CPURegsRegClass;
}
