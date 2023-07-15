

#include "NMX.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

Target &llvm::getTheCpu0Target() {
  static Target TheNMXTarget;
  return TheNMXTarget;
}
Target &llvm::getTheNMXelTarget() {
  static Target TheNMXelTarget;
  return TheNMXelTarget;
}

extern "C" void LLVMInitializeCpu0TargetInfo() {
  RegisterTarget<Triple::cpu0, /*HasJIT=*/true> X(getTheCpu0Target(),
                                                  "NMX", "NMX", "NMX");

  RegisterTarget<Triple::cpu0el, /*HasJIT=*/true> Y(getTheCpu0elTarget(),
                                                    "NMXel", "NMXel", "NMX");
}
