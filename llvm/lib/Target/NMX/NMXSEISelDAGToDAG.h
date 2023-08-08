//===-- NMXSEISelDAGToDAG.h - A DAG to DAG Inst Selector for NMXSE -*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Subclass of NMXDAGToDAGISel specialized for NMX32.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_NMX_NMXSEISELDAGTODAG_H
#define LLVM_LIB_TARGET_NMX_NMXSEISELDAGTODAG_H

#include "NMXISelDAGToDAG.h"

namespace llvm {

class NMXSEDAGToDAGISel : public NMXDAGToDAGISel {
public:
  explicit NMXSEDAGToDAGISel(NMXTargetMachine &TM, CodeGenOpt::Level OL)
      : NMXDAGToDAGISel(TM, OL) { }

private:

  bool runOnMachineFunction(MachineFunction &MF) override;

  void selectAddESubE(unsigned MOp, SDValue InFlag, SDValue CmpLHS,
                      const SDLoc &DL, SDNode *Node) const;

  bool trySelect(SDNode *Node) override;

  void processFunctionAfterISel(MachineFunction &MF) override;

  std::pair<SDNode *, SDNode *> selectMULT(SDNode *N, unsigned Opc,
                                           const SDLoc &DL, EVT Ty,
                                           bool HasLo, bool HasHi);
};

// Create new instr selector, called in NMXTargetMachine.cpp for registrary pass
FunctionPass *createNMXSEISelDAG(NMXTargetMachine &TM,
                                  CodeGenOpt::Level OptLevel);

} // end of llvm namespace

#endif
