//===-- NMXABIInfo.h - Information about NMX ABI --------------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_NMX_MCTARGETDESC_NMXABIINFO_H
#define LLVM_LIB_TARGET_NMX_MCTARGETDESC_NMXABIINFO_H

#include "llvm/ADT/ArrayRef.h"
#include "llvm/ADT/Triple.h"
#include "llvm/IR/CallingConv.h"
#include "llvm/MC/MCRegisterInfo.h"

namespace llvm {

class MCTargetOptions;
class StringRef;
class TargetRegisterClass;

class NMXABIInfo {
public:
  enum class ABI { Unknown, O32, S32 };

protected:
  ABI ThisABI;

public:
  NMXABIInfo(ABI ThisABI) : ThisABI(ThisABI) { }

  static NMXABIInfo Unknown() { return NMXABIInfo(ABI::Unknown); }
  static NMXABIInfo O32() { return NMXABIInfo(ABI::O32); }
  static NMXABIInfo S32() { return NMXABIInfo(ABI::S32); }
  static NMXABIInfo computeTargetABI();

  bool IsKnown() const { return ThisABI != ABI::Unknown; }
  bool IsO32() const { return ThisABI == ABI::O32; }
  bool IsS32() const { return ThisABI == ABI::S32; }
  ABI GetEnumValue() const { return ThisABI; }

  // The registers to use for byval arguments
  const ArrayRef<MCPhysReg> GetByValArgRegs() const;

  // The registers to use for variable argument list
  const ArrayRef<MCPhysReg> GetVarArgRegs() const;

  // Obtain the size of the area allocated by the callee for arguments
  // CallingConv::FastCall affects the value for O32
  unsigned GetCalleeAllocdArgSizeInBytes(CallingConv::ID CC) const;

  // NMXGenSubtargetInfo.inc will use this to resolve conflicts when given
  // multiple ABI options
  bool operator<(const NMXABIInfo Other) const {
    return ThisABI < Other.GetEnumValue();
  }

  unsigned GetStackPtr() const;
  unsigned GetFramePtr() const;
  unsigned GetNullPtr() const;

  unsigned GetEhDataReg(unsigned I) const;
  int EhDataRegSize() const;
};
} // End llvm namespace

#endif
