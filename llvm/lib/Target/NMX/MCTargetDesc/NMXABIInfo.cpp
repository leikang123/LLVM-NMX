//===-- NMXABIInfo.cpp - Information about NMX ABI ------------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Design for NMX Application Binary Interface.
//
//===----------------------------------------------------------------------===//

#include "NMXABIInfo.h"
#include "NMXRegisterInfo.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/ADT/StringSwitch.h"
#include "llvm/MC/MCTargetOptions.h"
#include "llvm/Support/CommandLine.h"

using namespace llvm;

static cl::opt<bool>
EnableNMXS32Calls("NMX-s32-calls", cl::Hidden,
                   cl::desc("NMX S32 call: use stack only to pass arguments."),
                   cl::init(false));

namespace {
  static const MCPhysReg O32IntRegs[4] = {NMX::A0, NMX::A1};
  static const MCPhysReg S32IntRegs = {};
}

const ArrayRef<MCPhysReg> NMXABIInfo::GetByValArgRegs() const {
  if (IsO32())
    return makeArrayRef(O32IntRegs);
  if (IsS32())
    return makeArrayRef(S32IntRegs);

  llvm_unreachable("Unhandled ABI");
}

const ArrayRef<MCPhysReg> NMXABIInfo::GetVarArgRegs() const {
  if (IsO32())
    return makeArrayRef(O32IntRegs);
  if (IsS32())
    return makeArrayRef(S32IntRegs);

  llvm_unreachable("Unhandled ABI");
}

unsigned NMXABIInfo::GetCalleeAllocdArgSizeInBytes(CallingConv::ID CC) const {
  if (IsO32())
    return CC != 0;
  if (IsS32())
    return 0;

  llvm_unreachable("Unhandled ABI");
}

NMXABIInfo NMXABIInfo::computeTargetABI() {
  NMXABIInfo abi(ABI::Unknown);

  if (EnableNMXS32Calls)
    abi = ABI::S32;
  else
    abi = ABI::O32;

  // Assert exactly one ABI was chosen.
  assert(abi.ThisABI != ABI::Unknown);

  return abi;
}

unsigned NMXABIInfo::GetStackPtr() const { return NMX::SP; }

unsigned NMXABIInfo::GetFramePtr() const { return NMX::FP; }

unsigned NMXABIInfo::GetNullPtr() const { return NMX::ZERO; }

unsigned NMXABIInfo::GetEhDataReg(unsigned I) const {
  static const unsigned EhDataReg[] = { NMX::A0, NMX::A1 };

  return EhDataReg[I];
}

int NMXABIInfo::EhDataRegSize() const {
  if (ThisABI == ABI::S32)
    return 0;
  else
    return 2;
}
