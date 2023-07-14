
set (LLVM_TARGET_DEFINITIONS NMXAsm.td)
tablegen(LLVM NMXGenAsmMatcher.inc -gen-asm-matcher)

set (LLVM_TARGET_DEFINITIONS NMXOther.td)

# Generate NMXGenRegisterInfo.inc and NMXGenInstrInfo.inc which included by
#  your hand code C++ files.
# NMXGenRegisterInfo.inc came from NMXRegisterInfo.td, NMXGenInstrInfo.inc
#  came from NMXInstrInfo.td.
tablegen(LLVM NMXGenRegisterInfo.inc -gen-register-info)
tablegen(LLVM NMXGenInstrInfo.inc -gen-instr-info)
tablegen(LLVM NMXGenSubtargetInfo.inc -gen-subtarget)
tablegen(LLVM NMXGenMCPseudoLowering.inc -gen-pseudo-lowering)
tablegen(LLVM NMXGenDAGISel.inc -gen-dag-isel)
tablegen(LLVM NMXGenCallingConv.inc -gen-callingconv)
tablegen(LLVM NMXGenCodeEmitter.inc -gen-emitter)
tablegen(LLVM NMXGenMCCodeEmitter.inc -gen-emitter)
tablegen(LLVM NMXGenAsmWriter.inc -gen-asm-writer)
tablegen(LLVM NMXGenDisassemblerTables.inc -gen-disassembler)

# NMXCommonTableGen must be defined
add_public_tablegen_target(NMXCommonTableGen)

# NMXCodeGen should match with LLVMBuild.txt NMXCodeGen
add_llvm_target(NMXCodeGen
  NMXISelDAGToDAG.cpp
  NMXSEISelDAGToDAG.cpp
  NMXTargetMachine.cpp
  NMXInstrInfo.cpp
  NMXISelLowering.cpp
  NMXMachineFunctionInfo.cpp
  NMXRegisterInfo.cpp
  NMXFrameLowering.cpp
  NMXSEFrameLowering.cpp
  NMXSEInstrInfo.cpp
  NMXSEISelLowering.cpp
  NMXSERegisterInfo.cpp
  NMXSubtarget.cpp
  NMXTargetObjectFile.cpp
  NMXAsmPrinter.cpp
  NMXMCInstLower.cpp
  NMXAnalyzeImmediate.cpp
  NMXDelUselessJMP.cpp
  NMXDelaySlotFiller.cpp
  )

add_subdirectory(TargetInfo)
add_subdirectory(MCTargetDesc)
add_subdirectory(InstPrinter)
add_subdirectory(Disassembler)
add_subdirectory(AsmParser)
