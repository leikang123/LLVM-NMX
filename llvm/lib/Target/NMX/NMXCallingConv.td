//===-- NMXCallingConv.td - Calling Conventions for NMX --*- tablegen -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This describes the calling conventions for nmx architecture.
//
//===----------------------------------------------------------------------===//

// Match if the current subtarget has a feature F.
class CCIfSubtarget<string F, CCAction A>
  : CCIf<!strconcat("State.getTarget().getSubtarget<NMXSubtarget>().", F), A>;

def CSR_O32 : CalleeSavedRegs<(add LR, FP, (sequence "S%u", 1, 0))>;

def RetCC_NMXEABI : CallingConv<[
  // i32 are returned in registers V0, V1, A0, A1
  CCIfType<[i32], CCAssignToReg<[V0, V1, A0, A1]>>
]>;

def RetCC_NMX : CallingConv<[
  CCDelegateTo<RetCC_NMXEABI>
]>;
