//===-- NMXAsmPrinter.h - NMX Assembly Printer ----------------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// NMX assembly printer class.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_NMX_NMXASMPRINTER_H
#define LLVM_LIB_TARGET_NMX_NMXASMPRINTER_H

#include "NMXMachineFunctionInfo.h"
#include "NMXMCInstLower.h"
#include "NMXSubtarget.h"
#include "NMXTargetMachine.h"
#include "llvm/CodeGen/AsmPrinter.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/Support/Compiler.h"
#include "llvm/Target/TargetMachine.h"

namespace llvm {
class MCStreamer;
class MachineInstr;
class MachineBasicBlock;
class Module;
class raw_ostream;

class LLVM_LIBRARY_VISIBILITY NMXAsmPrinter : public AsmPrinter {

  void EmitInstrWithMacroNoAT(const MachineInstr *MI);

private:
  // lowerOperand : Convert a MachineOperand into the equivalent MCOperand
  bool lowerOperand(const MachineOperand &MO, MCOperand &MCOp);

  // tblgen'erated function.
  bool emitPseudoExpansionLowering(MCStreamer &OutStreamer,
                                   const MachineInstr *MI);

  /* bool isLongBranchPseudo(int Opcode) const; */

public:
  const NMXSubtarget *Subtarget;
  const NMXMachineFunctionInfo *NMXMFI;
  NMXMCInstLower MCInstLowering;

  explicit NMXAsmPrinter(TargetMachine &TM,
                          std::unique_ptr<MCStreamer> Streamer)
    : AsmPrinter(TM, std::move(Streamer)),
      MCInstLowering(*this) {
    Subtarget = static_cast<NMXTargetMachine &>(TM).getSubtargetImpl();
  }

  virtual StringRef getPassName() const override {
    return "NMX Assmebly Printer";
  }

  virtual bool runOnMachineFunction(MachineFunction &MF) override;

  // EmitInstruction() must exists or will have run time error
  void EmitInstruction(const MachineInstr *MI) override;
  void printSavedRegsBitmask(raw_ostream &O);
  void printHex32(unsigned int Value, raw_ostream &O);
  void emitFrameDirective();
  const char *getCurrentABIString() const;
  void EmitFunctionEntryLabel() override;
  void EmitFunctionBodyStart() override;
  void EmitFunctionBodyEnd() override;
  void EmitStartOfAsmFile(Module &M) override;
  void PrinterDebugValueComment(const MachineInstr *MI, raw_ostream &OS);

  bool PrintAsmOperand(const MachineInstr *MI, unsigned OpNum,
                       unsigned AsmVariant, const char *ExtraCode,
                       raw_ostream &O) override;
  bool PrintAsmMemoryOperand(const MachineInstr *MI, unsigned OpNum,
                             unsigned AsmVariant, const char *ExtraCode,
                             raw_ostream &O) override;
  void printOperand(const MachineInstr *MI, int opNum, raw_ostream &O);

};
} // end namespace llvm

#endif
