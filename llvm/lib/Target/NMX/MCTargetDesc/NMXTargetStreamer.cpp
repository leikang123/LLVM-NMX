//===-- nmxTargetStreamer.cpp - nmx Target Streamer Methods ---*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file provides nmx specific target streamer methods.
//
//===----------------------------------------------------------------------===//

#include "nmxTargetStreamer.h"
#include "InstPrinter/nmxInstPrinter.h"
#include "nmxELFStreamer.h"
#include "nmxMCTargetDesc.h"
#include "nmxTargetObjectFile.h"
#include "nmxTargetStreamer.h"
#include "llvm/BinaryFormat/ELF.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/MC/MCSymbolELF.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/FormattedStream.h"

using namespace llvm;

nmxTargetStreamer::nmxTargetStreamer(MCStreamer &S)
    : MCTargetStreamer(S) {}

nmxTargetAsmStreamer::nmxTargetAsmStreamer(MCStreamer &S,
                                             formatted_raw_ostream &OS)
    : nmxTargetStreamer(S), OS(OS) {}