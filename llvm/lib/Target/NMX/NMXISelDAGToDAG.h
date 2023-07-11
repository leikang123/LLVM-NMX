//===-- NMXISelDAGToDAG.h - A DAG to DAG Inst Selector for NMX -*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file defines an instruction selector for the NMX target.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_NMX_NMXISELDAGTODAG_H
#define LLVM_LIB_TARGET_NMX_NMXISELDAGTODAG_H

#include "NMX.h"
#include "NMXSubtarget.h"
#include "NMXTargetMachine.h"

#include "llvm/CodeGen/SelectionDAGISel.h"
#include "llvm/IR/Type.h"
#include "llvm/Support/Debug.h"

//===----------------------------------------------------------------------===//
// Instruction Selector Implementation
//===----------------------------------------------------------------------===//
namespace llvm {
class NMXDAGToDAGISel : public SelectionDAGISel {
public:
  explicit NMXDAGToDAGISel(NMXTargetMachine &TM, CodeGenOpt::Level OL)
      : SelectionDAGISel(TM, OL), Subtarget(nullptr) { }

  StringRef getPassName() const override {
    return "NMX DAG to DAG Pattern Instruction Selection";
  }

  bool runOnMachineFunction(MachineFunction &MF) override;

protected:

  // Keep a pointer to the NMXSubtarget around so that we can make the right
  // decision when generating code for different targets.
  const NMXSubtarget *Subtarget;

  SDNode *getGlobalBaseReg();

private:
  // Include the pieces autogenerated from the target description.
  #include "NMXGenDAGISel.inc"

  // Return a reference to the TargetMachine, casted to the target-specific type.
  const NMXTargetMachine &getTargetMachine() {
    return static_cast<const NMXTargetMachine &>(TM);
  }

  void Select(SDNode *N) override;

  virtual bool trySelect(SDNode *Node) = 0;

  // Complex Pattern
  bool SelectAddr(SDNode *Parent, SDValue N, SDValue &Base, SDValue &Offset);

  bool SelectInlineAsmMemoryOperand(const SDValue &Op, unsigned ConstraintID,
                                    std::vector<SDValue> &OutOps) override;
  // Return a target constant with the specified value.
  inline SDValue getImm(const SDNode *Node, unsigned Imm) {
    return CurDAG->getTargetConstant(Imm, SDLoc(Node), Node->getValueType(0));
  }

  virtual void processFunctionAfterISel(MachineFunction &MF) = 0;

};

} // end of llvm namespace

#endif
