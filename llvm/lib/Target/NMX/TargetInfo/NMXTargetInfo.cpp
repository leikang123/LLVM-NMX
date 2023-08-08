//===-- NMXTargetInfo.cpp - NMX Target Implementation ---------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "NMX.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

Target &llvm::getTheNMXTarget() {
  static Target TheNMXTarget;
  return TheNMXTarget;
}
Target &llvm::getTheNMXelTarget() {
  static Target TheNMXelTarget;
  return TheNMXelTarget;
}

extern "C" void LLVMInitializeNMXTargetInfo() {
  RegisterTarget<Triple::NMX, /*HasJIT=*/true> X(getTheNMXTarget(),
                                                  "NMX", "NMX", "NMX");

  RegisterTarget<Triple::NMXel, /*HasJIT=*/true> Y(getTheNMXelTarget(),
                                                    "NMXel", "NMXel", "NMX");
}