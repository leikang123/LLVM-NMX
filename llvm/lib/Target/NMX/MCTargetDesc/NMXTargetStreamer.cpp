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
// 定义了一个叫 Cpu0TargetStreamer 的类，继承自 MCTargetStreamer 类。

// 定义了一个叫 Cpu0TargetAsmStreamer 的类，继承自 Cpu0TargetStreamer 类，
// 这个类用来完成汇编器 Streamer 的功能。AsmStreamer 对象会注册到后端模块中。
//
nmxTargetStreamer::nmxTargetStreamer(MCStreamer &S)
    : MCTargetStreamer(S) {}

nmxTargetAsmStreamer::nmxTargetAsmStreamer(MCStreamer &S,
                                             formatted_raw_ostream &OS)
    : nmxTargetStreamer(S), OS(OS) {}