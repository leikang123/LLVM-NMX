//===-- TargetStreamer.h - NMX Taget Streamer -------------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_NMX_NMXTARGETSTREAMER_H
#define LLVM_LIB_TARGET_NMX_NMXTARGETSTREAMER_H

#include "llvm/MC/MCELFStreamer.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCStreamer.h"

namespace llvm {
class NMXTargetStreamer : public MCTargetStreamer {
public:
  NMXTargetStreamer(MCStreamer &S);
};

// This part is for ascii assembly output
class NMXTargetAsmStreamer : public NMXTargetStreamer {
  formatted_raw_ostream &OS;

public:
  NMXTargetAsmStreamer(MCStreamer &S, formatted_raw_ostream &OS);
};

}

#endif
