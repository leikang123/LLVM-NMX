#include <iostream>
#include "llvm/Transforms/CountIR.h"
#include "llvm/ADT/Statistic.h"
#include "Support/Debug.h"

using namespace llvm;

#define DEBUG_TYPE "countir"
STATISTIC(NumOfInst,"Number of instructions.");
STATISTIC(NumOfBB,"Number of basic blocks.");

PreservedAnalyses CountIRPass::run(Function &F,FunctionAnalysisManager &AM){
    for(BasicBlock &BB :F){
        ++NumOBB;
        for(Instruction &I :BB){
            (void)I;
            ++NumOfInst;
        }
    }
    return PreservedAnalyses::all();
    
}