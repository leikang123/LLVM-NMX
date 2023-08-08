//===-- NMXMachineFunctionInfo.cpp - Private data used for NMX -*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// NMX specific subclass of MachineFunctionInfo.
//
//===----------------------------------------------------------------------===//

#include "NMXMachineFunctionInfo.h"

#include "NMXInstrInfo.h"
#include "NMXSubtarget.h"
#include "llvm/IR/Function.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"

using namespace llvm;

bool FixGlobalBaseReg;

NMXMachineFunctionInfo::~NMXMachineFunctionInfo() { }

bool NMXMachineFunctionInfo::globalBaseRegFixed() const {
  return FixGlobalBaseReg;
}

bool NMXMachineFunctionInfo::globalBaseRegSet() const {
  return GlobalBaseReg;
}

unsigned NMXMachineFunctionInfo::getGlobalBaseReg() {
  return GlobalBaseReg = NMX::GP;
}

void NMXMachineFunctionInfo::anchor() { }

MachinePointerInfo NMXMachineFunctionInfo::callPtrInfo(const char *ES) {
  return MachinePointerInfo(MF.getPSVManager().getExternalSymbolCallEntry(ES));
}

MachinePointerInfo NMXMachineFunctionInfo::callPtrInfo(const GlobalValue *GV) {
  return MachinePointerInfo(MF.getPSVManager().getGlobalValueCallEntry(GV));
}

