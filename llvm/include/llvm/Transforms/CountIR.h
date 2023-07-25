#define LLVM_TRANSFORMS_COUNTIR_COUNTIR_H
#define LLVM_TRANSFORMS_COUNTIR_COUNTIR_H

#include "llvm/IR/PassManager.h"

namespace llvm {
    class CountIRPass : public PassInfoMixin<CountIRPass>{
        public :
        PreservedAnalyses run(Function &F,FunctionAnalysisManager &AM);
    };

} // namespace llvm 
#endif
