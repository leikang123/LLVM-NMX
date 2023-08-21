//===-- nmxELFStreamer.h - nmx ELF Object Output --------------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This is a custom MCELFStreamer which allows us to insert some hooks before
// emitting data into an actual object file.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_nmx_MCTARGETDESC_nmxELFSTREAMER_H
#define LLVM_LIB_TARGET_nmx_MCTARGETDESC_nmxELFSTREAMER_H

#include "llvm/ADT/SmallVector.h"
#include "llvm/MC/MCELFStreamer.h"

#include <memory>


/**]
 * 定义了一个叫 Cpu0ELFStreamer 的类，继承自 MCELFStreamer 类。另外定义了这个类的工厂函数 `
 * createCpu0ELFStreamer()`，用来返回其对象。ELFStreamer 对象会注册到后端模块中。

TargetStreamer 和 ELFStreamer 在生成 ELF 文件中同时起作用，ELFStreamer 是我们自定义的一个类，
在其中可以做一些钩子来调整输出内容。
*/
namespace llvm {

class MCAsmBackend;
class MCCodeEmitter;
class MCContext;
class MCSubtargetInfo;

class nmxELFStreamer : public MCELFStreamer {

public:
  nmxELFStreamer(MCContext &Context, std::unique_ptr<MCAsmBackend> MAB,
                  std::unique_ptr<MCObjectWriter> OW,
                  std::unique_ptr<MCCodeEmitter> Emitter);
};

MCELFStreamer *createnmxELFStreamer(MCContext &Context,
                                     std::unique_ptr<MCAsmBackend> MAB,
                                     std::unique_ptr<MCObjectWriter> OW,
                                     std::unique_ptr<MCCodeEmitter> Emitter,
                                     bool RelaxAll);
} // namespace llvm

#endif
