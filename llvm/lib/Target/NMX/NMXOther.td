//===-- nmx.td - Describe the nmx Target Machine ----*- tablegen -*-===//
//
//                  The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
// This is the top level entry point for the nmx target.
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Target-independent interfaces
//===----------------------------------------------------------------------===//

include "llvm/Target/Target.td"

//===----------------------------------------------------------------------===//
// Target-dependent interfaces
//===----------------------------------------------------------------------===//

include "NMXRegisterInfo.td"
include "NMXRegisterINfoGPROutForOther.td" // except AsmParser
include "NMX.td"
