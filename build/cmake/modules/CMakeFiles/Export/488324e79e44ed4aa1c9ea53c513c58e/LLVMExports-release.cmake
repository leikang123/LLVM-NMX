#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "LLVMDemangle" for configuration "Release"
set_property(TARGET LLVMDemangle APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMDemangle PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMDemangle.a"
  )

list(APPEND _cmake_import_check_targets LLVMDemangle )
list(APPEND _cmake_import_check_files_for_LLVMDemangle "${_IMPORT_PREFIX}/lib/libLLVMDemangle.a" )

# Import target "LLVMSupport" for configuration "Release"
set_property(TARGET LLVMSupport APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMSupport PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C;CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMSupport.a"
  )

list(APPEND _cmake_import_check_targets LLVMSupport )
list(APPEND _cmake_import_check_files_for_LLVMSupport "${_IMPORT_PREFIX}/lib/libLLVMSupport.a" )

# Import target "LLVMTableGen" for configuration "Release"
set_property(TARGET LLVMTableGen APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMTableGen PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMTableGen.a"
  )

list(APPEND _cmake_import_check_targets LLVMTableGen )
list(APPEND _cmake_import_check_files_for_LLVMTableGen "${_IMPORT_PREFIX}/lib/libLLVMTableGen.a" )

# Import target "llvm-tblgen" for configuration "Release"
set_property(TARGET llvm-tblgen APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-tblgen PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-tblgen"
  )

list(APPEND _cmake_import_check_targets llvm-tblgen )
list(APPEND _cmake_import_check_files_for_llvm-tblgen "${_IMPORT_PREFIX}/bin/llvm-tblgen" )

# Import target "LLVMCore" for configuration "Release"
set_property(TARGET LLVMCore APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMCore PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMCore.a"
  )

list(APPEND _cmake_import_check_targets LLVMCore )
list(APPEND _cmake_import_check_files_for_LLVMCore "${_IMPORT_PREFIX}/lib/libLLVMCore.a" )

# Import target "LLVMFuzzMutate" for configuration "Release"
set_property(TARGET LLVMFuzzMutate APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMFuzzMutate PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMFuzzMutate.a"
  )

list(APPEND _cmake_import_check_targets LLVMFuzzMutate )
list(APPEND _cmake_import_check_files_for_LLVMFuzzMutate "${_IMPORT_PREFIX}/lib/libLLVMFuzzMutate.a" )

# Import target "LLVMIRReader" for configuration "Release"
set_property(TARGET LLVMIRReader APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMIRReader PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMIRReader.a"
  )

list(APPEND _cmake_import_check_targets LLVMIRReader )
list(APPEND _cmake_import_check_files_for_LLVMIRReader "${_IMPORT_PREFIX}/lib/libLLVMIRReader.a" )

# Import target "LLVMCodeGen" for configuration "Release"
set_property(TARGET LLVMCodeGen APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMCodeGen PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMCodeGen.a"
  )

list(APPEND _cmake_import_check_targets LLVMCodeGen )
list(APPEND _cmake_import_check_files_for_LLVMCodeGen "${_IMPORT_PREFIX}/lib/libLLVMCodeGen.a" )

# Import target "LLVMSelectionDAG" for configuration "Release"
set_property(TARGET LLVMSelectionDAG APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMSelectionDAG PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMSelectionDAG.a"
  )

list(APPEND _cmake_import_check_targets LLVMSelectionDAG )
list(APPEND _cmake_import_check_files_for_LLVMSelectionDAG "${_IMPORT_PREFIX}/lib/libLLVMSelectionDAG.a" )

# Import target "LLVMAsmPrinter" for configuration "Release"
set_property(TARGET LLVMAsmPrinter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMAsmPrinter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMAsmPrinter.a"
  )

list(APPEND _cmake_import_check_targets LLVMAsmPrinter )
list(APPEND _cmake_import_check_files_for_LLVMAsmPrinter "${_IMPORT_PREFIX}/lib/libLLVMAsmPrinter.a" )

# Import target "LLVMMIRParser" for configuration "Release"
set_property(TARGET LLVMMIRParser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMMIRParser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMMIRParser.a"
  )

list(APPEND _cmake_import_check_targets LLVMMIRParser )
list(APPEND _cmake_import_check_files_for_LLVMMIRParser "${_IMPORT_PREFIX}/lib/libLLVMMIRParser.a" )

# Import target "LLVMGlobalISel" for configuration "Release"
set_property(TARGET LLVMGlobalISel APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMGlobalISel PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMGlobalISel.a"
  )

list(APPEND _cmake_import_check_targets LLVMGlobalISel )
list(APPEND _cmake_import_check_files_for_LLVMGlobalISel "${_IMPORT_PREFIX}/lib/libLLVMGlobalISel.a" )

# Import target "LLVMBinaryFormat" for configuration "Release"
set_property(TARGET LLVMBinaryFormat APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMBinaryFormat PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMBinaryFormat.a"
  )

list(APPEND _cmake_import_check_targets LLVMBinaryFormat )
list(APPEND _cmake_import_check_files_for_LLVMBinaryFormat "${_IMPORT_PREFIX}/lib/libLLVMBinaryFormat.a" )

# Import target "LLVMBitReader" for configuration "Release"
set_property(TARGET LLVMBitReader APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMBitReader PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMBitReader.a"
  )

list(APPEND _cmake_import_check_targets LLVMBitReader )
list(APPEND _cmake_import_check_files_for_LLVMBitReader "${_IMPORT_PREFIX}/lib/libLLVMBitReader.a" )

# Import target "LLVMBitWriter" for configuration "Release"
set_property(TARGET LLVMBitWriter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMBitWriter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMBitWriter.a"
  )

list(APPEND _cmake_import_check_targets LLVMBitWriter )
list(APPEND _cmake_import_check_files_for_LLVMBitWriter "${_IMPORT_PREFIX}/lib/libLLVMBitWriter.a" )

# Import target "LLVMTransformUtils" for configuration "Release"
set_property(TARGET LLVMTransformUtils APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMTransformUtils PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMTransformUtils.a"
  )

list(APPEND _cmake_import_check_targets LLVMTransformUtils )
list(APPEND _cmake_import_check_files_for_LLVMTransformUtils "${_IMPORT_PREFIX}/lib/libLLVMTransformUtils.a" )

# Import target "LLVMInstrumentation" for configuration "Release"
set_property(TARGET LLVMInstrumentation APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMInstrumentation PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMInstrumentation.a"
  )

list(APPEND _cmake_import_check_targets LLVMInstrumentation )
list(APPEND _cmake_import_check_files_for_LLVMInstrumentation "${_IMPORT_PREFIX}/lib/libLLVMInstrumentation.a" )

# Import target "LLVMAggressiveInstCombine" for configuration "Release"
set_property(TARGET LLVMAggressiveInstCombine APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMAggressiveInstCombine PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMAggressiveInstCombine.a"
  )

list(APPEND _cmake_import_check_targets LLVMAggressiveInstCombine )
list(APPEND _cmake_import_check_files_for_LLVMAggressiveInstCombine "${_IMPORT_PREFIX}/lib/libLLVMAggressiveInstCombine.a" )

# Import target "LLVMInstCombine" for configuration "Release"
set_property(TARGET LLVMInstCombine APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMInstCombine PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMInstCombine.a"
  )

list(APPEND _cmake_import_check_targets LLVMInstCombine )
list(APPEND _cmake_import_check_files_for_LLVMInstCombine "${_IMPORT_PREFIX}/lib/libLLVMInstCombine.a" )

# Import target "LLVMScalarOpts" for configuration "Release"
set_property(TARGET LLVMScalarOpts APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMScalarOpts PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMScalarOpts.a"
  )

list(APPEND _cmake_import_check_targets LLVMScalarOpts )
list(APPEND _cmake_import_check_files_for_LLVMScalarOpts "${_IMPORT_PREFIX}/lib/libLLVMScalarOpts.a" )

# Import target "LLVMipo" for configuration "Release"
set_property(TARGET LLVMipo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMipo PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMipo.a"
  )

list(APPEND _cmake_import_check_targets LLVMipo )
list(APPEND _cmake_import_check_files_for_LLVMipo "${_IMPORT_PREFIX}/lib/libLLVMipo.a" )

# Import target "LLVMVectorize" for configuration "Release"
set_property(TARGET LLVMVectorize APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMVectorize PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMVectorize.a"
  )

list(APPEND _cmake_import_check_targets LLVMVectorize )
list(APPEND _cmake_import_check_files_for_LLVMVectorize "${_IMPORT_PREFIX}/lib/libLLVMVectorize.a" )

# Import target "LLVMObjCARCOpts" for configuration "Release"
set_property(TARGET LLVMObjCARCOpts APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMObjCARCOpts PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMObjCARCOpts.a"
  )

list(APPEND _cmake_import_check_targets LLVMObjCARCOpts )
list(APPEND _cmake_import_check_files_for_LLVMObjCARCOpts "${_IMPORT_PREFIX}/lib/libLLVMObjCARCOpts.a" )

# Import target "LLVMCoroutines" for configuration "Release"
set_property(TARGET LLVMCoroutines APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMCoroutines PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMCoroutines.a"
  )

list(APPEND _cmake_import_check_targets LLVMCoroutines )
list(APPEND _cmake_import_check_files_for_LLVMCoroutines "${_IMPORT_PREFIX}/lib/libLLVMCoroutines.a" )

# Import target "LLVMLinker" for configuration "Release"
set_property(TARGET LLVMLinker APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMLinker PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMLinker.a"
  )

list(APPEND _cmake_import_check_targets LLVMLinker )
list(APPEND _cmake_import_check_files_for_LLVMLinker "${_IMPORT_PREFIX}/lib/libLLVMLinker.a" )

# Import target "LLVMAnalysis" for configuration "Release"
set_property(TARGET LLVMAnalysis APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMAnalysis PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMAnalysis.a"
  )

list(APPEND _cmake_import_check_targets LLVMAnalysis )
list(APPEND _cmake_import_check_files_for_LLVMAnalysis "${_IMPORT_PREFIX}/lib/libLLVMAnalysis.a" )

# Import target "LLVMLTO" for configuration "Release"
set_property(TARGET LLVMLTO APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMLTO PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMLTO.a"
  )

list(APPEND _cmake_import_check_targets LLVMLTO )
list(APPEND _cmake_import_check_files_for_LLVMLTO "${_IMPORT_PREFIX}/lib/libLLVMLTO.a" )

# Import target "LLVMMC" for configuration "Release"
set_property(TARGET LLVMMC APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMMC PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMMC.a"
  )

list(APPEND _cmake_import_check_targets LLVMMC )
list(APPEND _cmake_import_check_files_for_LLVMMC "${_IMPORT_PREFIX}/lib/libLLVMMC.a" )

# Import target "LLVMMCParser" for configuration "Release"
set_property(TARGET LLVMMCParser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMMCParser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMMCParser.a"
  )

list(APPEND _cmake_import_check_targets LLVMMCParser )
list(APPEND _cmake_import_check_files_for_LLVMMCParser "${_IMPORT_PREFIX}/lib/libLLVMMCParser.a" )

# Import target "LLVMMCDisassembler" for configuration "Release"
set_property(TARGET LLVMMCDisassembler APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMMCDisassembler PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMMCDisassembler.a"
  )

list(APPEND _cmake_import_check_targets LLVMMCDisassembler )
list(APPEND _cmake_import_check_files_for_LLVMMCDisassembler "${_IMPORT_PREFIX}/lib/libLLVMMCDisassembler.a" )

# Import target "LLVMMCA" for configuration "Release"
set_property(TARGET LLVMMCA APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMMCA PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMMCA.a"
  )

list(APPEND _cmake_import_check_targets LLVMMCA )
list(APPEND _cmake_import_check_files_for_LLVMMCA "${_IMPORT_PREFIX}/lib/libLLVMMCA.a" )

# Import target "LLVMObject" for configuration "Release"
set_property(TARGET LLVMObject APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMObject PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMObject.a"
  )

list(APPEND _cmake_import_check_targets LLVMObject )
list(APPEND _cmake_import_check_files_for_LLVMObject "${_IMPORT_PREFIX}/lib/libLLVMObject.a" )

# Import target "LLVMObjectYAML" for configuration "Release"
set_property(TARGET LLVMObjectYAML APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMObjectYAML PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMObjectYAML.a"
  )

list(APPEND _cmake_import_check_targets LLVMObjectYAML )
list(APPEND _cmake_import_check_files_for_LLVMObjectYAML "${_IMPORT_PREFIX}/lib/libLLVMObjectYAML.a" )

# Import target "LLVMOption" for configuration "Release"
set_property(TARGET LLVMOption APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMOption PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMOption.a"
  )

list(APPEND _cmake_import_check_targets LLVMOption )
list(APPEND _cmake_import_check_files_for_LLVMOption "${_IMPORT_PREFIX}/lib/libLLVMOption.a" )

# Import target "LLVMOptRemarks" for configuration "Release"
set_property(TARGET LLVMOptRemarks APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMOptRemarks PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMOptRemarks.a"
  )

list(APPEND _cmake_import_check_targets LLVMOptRemarks )
list(APPEND _cmake_import_check_files_for_LLVMOptRemarks "${_IMPORT_PREFIX}/lib/libLLVMOptRemarks.a" )

# Import target "LLVMDebugInfoDWARF" for configuration "Release"
set_property(TARGET LLVMDebugInfoDWARF APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMDebugInfoDWARF PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMDebugInfoDWARF.a"
  )

list(APPEND _cmake_import_check_targets LLVMDebugInfoDWARF )
list(APPEND _cmake_import_check_files_for_LLVMDebugInfoDWARF "${_IMPORT_PREFIX}/lib/libLLVMDebugInfoDWARF.a" )

# Import target "LLVMDebugInfoMSF" for configuration "Release"
set_property(TARGET LLVMDebugInfoMSF APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMDebugInfoMSF PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMDebugInfoMSF.a"
  )

list(APPEND _cmake_import_check_targets LLVMDebugInfoMSF )
list(APPEND _cmake_import_check_files_for_LLVMDebugInfoMSF "${_IMPORT_PREFIX}/lib/libLLVMDebugInfoMSF.a" )

# Import target "LLVMDebugInfoCodeView" for configuration "Release"
set_property(TARGET LLVMDebugInfoCodeView APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMDebugInfoCodeView PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMDebugInfoCodeView.a"
  )

list(APPEND _cmake_import_check_targets LLVMDebugInfoCodeView )
list(APPEND _cmake_import_check_files_for_LLVMDebugInfoCodeView "${_IMPORT_PREFIX}/lib/libLLVMDebugInfoCodeView.a" )

# Import target "LLVMDebugInfoPDB" for configuration "Release"
set_property(TARGET LLVMDebugInfoPDB APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMDebugInfoPDB PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMDebugInfoPDB.a"
  )

list(APPEND _cmake_import_check_targets LLVMDebugInfoPDB )
list(APPEND _cmake_import_check_files_for_LLVMDebugInfoPDB "${_IMPORT_PREFIX}/lib/libLLVMDebugInfoPDB.a" )

# Import target "LLVMSymbolize" for configuration "Release"
set_property(TARGET LLVMSymbolize APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMSymbolize PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMSymbolize.a"
  )

list(APPEND _cmake_import_check_targets LLVMSymbolize )
list(APPEND _cmake_import_check_files_for_LLVMSymbolize "${_IMPORT_PREFIX}/lib/libLLVMSymbolize.a" )

# Import target "LLVMExecutionEngine" for configuration "Release"
set_property(TARGET LLVMExecutionEngine APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMExecutionEngine PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMExecutionEngine.a"
  )

list(APPEND _cmake_import_check_targets LLVMExecutionEngine )
list(APPEND _cmake_import_check_files_for_LLVMExecutionEngine "${_IMPORT_PREFIX}/lib/libLLVMExecutionEngine.a" )

# Import target "LLVMInterpreter" for configuration "Release"
set_property(TARGET LLVMInterpreter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMInterpreter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMInterpreter.a"
  )

list(APPEND _cmake_import_check_targets LLVMInterpreter )
list(APPEND _cmake_import_check_files_for_LLVMInterpreter "${_IMPORT_PREFIX}/lib/libLLVMInterpreter.a" )

# Import target "LLVMMCJIT" for configuration "Release"
set_property(TARGET LLVMMCJIT APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMMCJIT PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMMCJIT.a"
  )

list(APPEND _cmake_import_check_targets LLVMMCJIT )
list(APPEND _cmake_import_check_files_for_LLVMMCJIT "${_IMPORT_PREFIX}/lib/libLLVMMCJIT.a" )

# Import target "LLVMOrcJIT" for configuration "Release"
set_property(TARGET LLVMOrcJIT APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMOrcJIT PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMOrcJIT.a"
  )

list(APPEND _cmake_import_check_targets LLVMOrcJIT )
list(APPEND _cmake_import_check_files_for_LLVMOrcJIT "${_IMPORT_PREFIX}/lib/libLLVMOrcJIT.a" )

# Import target "LLVMRuntimeDyld" for configuration "Release"
set_property(TARGET LLVMRuntimeDyld APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMRuntimeDyld PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMRuntimeDyld.a"
  )

list(APPEND _cmake_import_check_targets LLVMRuntimeDyld )
list(APPEND _cmake_import_check_files_for_LLVMRuntimeDyld "${_IMPORT_PREFIX}/lib/libLLVMRuntimeDyld.a" )

# Import target "LLVMTarget" for configuration "Release"
set_property(TARGET LLVMTarget APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMTarget PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMTarget.a"
  )

list(APPEND _cmake_import_check_targets LLVMTarget )
list(APPEND _cmake_import_check_files_for_LLVMTarget "${_IMPORT_PREFIX}/lib/libLLVMTarget.a" )

# Import target "LLVMAArch64CodeGen" for configuration "Release"
set_property(TARGET LLVMAArch64CodeGen APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMAArch64CodeGen PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMAArch64CodeGen.a"
  )

list(APPEND _cmake_import_check_targets LLVMAArch64CodeGen )
list(APPEND _cmake_import_check_files_for_LLVMAArch64CodeGen "${_IMPORT_PREFIX}/lib/libLLVMAArch64CodeGen.a" )

# Import target "LLVMAArch64AsmParser" for configuration "Release"
set_property(TARGET LLVMAArch64AsmParser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMAArch64AsmParser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMAArch64AsmParser.a"
  )

list(APPEND _cmake_import_check_targets LLVMAArch64AsmParser )
list(APPEND _cmake_import_check_files_for_LLVMAArch64AsmParser "${_IMPORT_PREFIX}/lib/libLLVMAArch64AsmParser.a" )

# Import target "LLVMAArch64Disassembler" for configuration "Release"
set_property(TARGET LLVMAArch64Disassembler APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMAArch64Disassembler PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMAArch64Disassembler.a"
  )

list(APPEND _cmake_import_check_targets LLVMAArch64Disassembler )
list(APPEND _cmake_import_check_files_for_LLVMAArch64Disassembler "${_IMPORT_PREFIX}/lib/libLLVMAArch64Disassembler.a" )

# Import target "LLVMAArch64AsmPrinter" for configuration "Release"
set_property(TARGET LLVMAArch64AsmPrinter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMAArch64AsmPrinter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMAArch64AsmPrinter.a"
  )

list(APPEND _cmake_import_check_targets LLVMAArch64AsmPrinter )
list(APPEND _cmake_import_check_files_for_LLVMAArch64AsmPrinter "${_IMPORT_PREFIX}/lib/libLLVMAArch64AsmPrinter.a" )

# Import target "LLVMAArch64Desc" for configuration "Release"
set_property(TARGET LLVMAArch64Desc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMAArch64Desc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMAArch64Desc.a"
  )

list(APPEND _cmake_import_check_targets LLVMAArch64Desc )
list(APPEND _cmake_import_check_files_for_LLVMAArch64Desc "${_IMPORT_PREFIX}/lib/libLLVMAArch64Desc.a" )

# Import target "LLVMAArch64Info" for configuration "Release"
set_property(TARGET LLVMAArch64Info APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMAArch64Info PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMAArch64Info.a"
  )

list(APPEND _cmake_import_check_targets LLVMAArch64Info )
list(APPEND _cmake_import_check_files_for_LLVMAArch64Info "${_IMPORT_PREFIX}/lib/libLLVMAArch64Info.a" )

# Import target "LLVMAArch64Utils" for configuration "Release"
set_property(TARGET LLVMAArch64Utils APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMAArch64Utils PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMAArch64Utils.a"
  )

list(APPEND _cmake_import_check_targets LLVMAArch64Utils )
list(APPEND _cmake_import_check_files_for_LLVMAArch64Utils "${_IMPORT_PREFIX}/lib/libLLVMAArch64Utils.a" )

# Import target "LLVMAMDGPUCodeGen" for configuration "Release"
set_property(TARGET LLVMAMDGPUCodeGen APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMAMDGPUCodeGen PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMAMDGPUCodeGen.a"
  )

list(APPEND _cmake_import_check_targets LLVMAMDGPUCodeGen )
list(APPEND _cmake_import_check_files_for_LLVMAMDGPUCodeGen "${_IMPORT_PREFIX}/lib/libLLVMAMDGPUCodeGen.a" )

# Import target "LLVMAMDGPUAsmParser" for configuration "Release"
set_property(TARGET LLVMAMDGPUAsmParser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMAMDGPUAsmParser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMAMDGPUAsmParser.a"
  )

list(APPEND _cmake_import_check_targets LLVMAMDGPUAsmParser )
list(APPEND _cmake_import_check_files_for_LLVMAMDGPUAsmParser "${_IMPORT_PREFIX}/lib/libLLVMAMDGPUAsmParser.a" )

# Import target "LLVMAMDGPUDisassembler" for configuration "Release"
set_property(TARGET LLVMAMDGPUDisassembler APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMAMDGPUDisassembler PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMAMDGPUDisassembler.a"
  )

list(APPEND _cmake_import_check_targets LLVMAMDGPUDisassembler )
list(APPEND _cmake_import_check_files_for_LLVMAMDGPUDisassembler "${_IMPORT_PREFIX}/lib/libLLVMAMDGPUDisassembler.a" )

# Import target "LLVMAMDGPUAsmPrinter" for configuration "Release"
set_property(TARGET LLVMAMDGPUAsmPrinter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMAMDGPUAsmPrinter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMAMDGPUAsmPrinter.a"
  )

list(APPEND _cmake_import_check_targets LLVMAMDGPUAsmPrinter )
list(APPEND _cmake_import_check_files_for_LLVMAMDGPUAsmPrinter "${_IMPORT_PREFIX}/lib/libLLVMAMDGPUAsmPrinter.a" )

# Import target "LLVMAMDGPUDesc" for configuration "Release"
set_property(TARGET LLVMAMDGPUDesc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMAMDGPUDesc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMAMDGPUDesc.a"
  )

list(APPEND _cmake_import_check_targets LLVMAMDGPUDesc )
list(APPEND _cmake_import_check_files_for_LLVMAMDGPUDesc "${_IMPORT_PREFIX}/lib/libLLVMAMDGPUDesc.a" )

# Import target "LLVMAMDGPUInfo" for configuration "Release"
set_property(TARGET LLVMAMDGPUInfo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMAMDGPUInfo PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMAMDGPUInfo.a"
  )

list(APPEND _cmake_import_check_targets LLVMAMDGPUInfo )
list(APPEND _cmake_import_check_files_for_LLVMAMDGPUInfo "${_IMPORT_PREFIX}/lib/libLLVMAMDGPUInfo.a" )

# Import target "LLVMAMDGPUUtils" for configuration "Release"
set_property(TARGET LLVMAMDGPUUtils APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMAMDGPUUtils PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMAMDGPUUtils.a"
  )

list(APPEND _cmake_import_check_targets LLVMAMDGPUUtils )
list(APPEND _cmake_import_check_files_for_LLVMAMDGPUUtils "${_IMPORT_PREFIX}/lib/libLLVMAMDGPUUtils.a" )

# Import target "LLVMARMCodeGen" for configuration "Release"
set_property(TARGET LLVMARMCodeGen APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMARMCodeGen PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMARMCodeGen.a"
  )

list(APPEND _cmake_import_check_targets LLVMARMCodeGen )
list(APPEND _cmake_import_check_files_for_LLVMARMCodeGen "${_IMPORT_PREFIX}/lib/libLLVMARMCodeGen.a" )

# Import target "LLVMARMAsmParser" for configuration "Release"
set_property(TARGET LLVMARMAsmParser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMARMAsmParser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMARMAsmParser.a"
  )

list(APPEND _cmake_import_check_targets LLVMARMAsmParser )
list(APPEND _cmake_import_check_files_for_LLVMARMAsmParser "${_IMPORT_PREFIX}/lib/libLLVMARMAsmParser.a" )

# Import target "LLVMARMDisassembler" for configuration "Release"
set_property(TARGET LLVMARMDisassembler APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMARMDisassembler PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMARMDisassembler.a"
  )

list(APPEND _cmake_import_check_targets LLVMARMDisassembler )
list(APPEND _cmake_import_check_files_for_LLVMARMDisassembler "${_IMPORT_PREFIX}/lib/libLLVMARMDisassembler.a" )

# Import target "LLVMARMAsmPrinter" for configuration "Release"
set_property(TARGET LLVMARMAsmPrinter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMARMAsmPrinter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMARMAsmPrinter.a"
  )

list(APPEND _cmake_import_check_targets LLVMARMAsmPrinter )
list(APPEND _cmake_import_check_files_for_LLVMARMAsmPrinter "${_IMPORT_PREFIX}/lib/libLLVMARMAsmPrinter.a" )

# Import target "LLVMARMDesc" for configuration "Release"
set_property(TARGET LLVMARMDesc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMARMDesc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMARMDesc.a"
  )

list(APPEND _cmake_import_check_targets LLVMARMDesc )
list(APPEND _cmake_import_check_files_for_LLVMARMDesc "${_IMPORT_PREFIX}/lib/libLLVMARMDesc.a" )

# Import target "LLVMARMInfo" for configuration "Release"
set_property(TARGET LLVMARMInfo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMARMInfo PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMARMInfo.a"
  )

list(APPEND _cmake_import_check_targets LLVMARMInfo )
list(APPEND _cmake_import_check_files_for_LLVMARMInfo "${_IMPORT_PREFIX}/lib/libLLVMARMInfo.a" )

# Import target "LLVMARMUtils" for configuration "Release"
set_property(TARGET LLVMARMUtils APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMARMUtils PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMARMUtils.a"
  )

list(APPEND _cmake_import_check_targets LLVMARMUtils )
list(APPEND _cmake_import_check_files_for_LLVMARMUtils "${_IMPORT_PREFIX}/lib/libLLVMARMUtils.a" )

# Import target "LLVMBPFCodeGen" for configuration "Release"
set_property(TARGET LLVMBPFCodeGen APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMBPFCodeGen PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMBPFCodeGen.a"
  )

list(APPEND _cmake_import_check_targets LLVMBPFCodeGen )
list(APPEND _cmake_import_check_files_for_LLVMBPFCodeGen "${_IMPORT_PREFIX}/lib/libLLVMBPFCodeGen.a" )

# Import target "LLVMBPFAsmParser" for configuration "Release"
set_property(TARGET LLVMBPFAsmParser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMBPFAsmParser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMBPFAsmParser.a"
  )

list(APPEND _cmake_import_check_targets LLVMBPFAsmParser )
list(APPEND _cmake_import_check_files_for_LLVMBPFAsmParser "${_IMPORT_PREFIX}/lib/libLLVMBPFAsmParser.a" )

# Import target "LLVMBPFDisassembler" for configuration "Release"
set_property(TARGET LLVMBPFDisassembler APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMBPFDisassembler PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMBPFDisassembler.a"
  )

list(APPEND _cmake_import_check_targets LLVMBPFDisassembler )
list(APPEND _cmake_import_check_files_for_LLVMBPFDisassembler "${_IMPORT_PREFIX}/lib/libLLVMBPFDisassembler.a" )

# Import target "LLVMBPFAsmPrinter" for configuration "Release"
set_property(TARGET LLVMBPFAsmPrinter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMBPFAsmPrinter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMBPFAsmPrinter.a"
  )

list(APPEND _cmake_import_check_targets LLVMBPFAsmPrinter )
list(APPEND _cmake_import_check_files_for_LLVMBPFAsmPrinter "${_IMPORT_PREFIX}/lib/libLLVMBPFAsmPrinter.a" )

# Import target "LLVMBPFDesc" for configuration "Release"
set_property(TARGET LLVMBPFDesc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMBPFDesc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMBPFDesc.a"
  )

list(APPEND _cmake_import_check_targets LLVMBPFDesc )
list(APPEND _cmake_import_check_files_for_LLVMBPFDesc "${_IMPORT_PREFIX}/lib/libLLVMBPFDesc.a" )

# Import target "LLVMBPFInfo" for configuration "Release"
set_property(TARGET LLVMBPFInfo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMBPFInfo PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMBPFInfo.a"
  )

list(APPEND _cmake_import_check_targets LLVMBPFInfo )
list(APPEND _cmake_import_check_files_for_LLVMBPFInfo "${_IMPORT_PREFIX}/lib/libLLVMBPFInfo.a" )

# Import target "LLVMHexagonCodeGen" for configuration "Release"
set_property(TARGET LLVMHexagonCodeGen APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMHexagonCodeGen PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMHexagonCodeGen.a"
  )

list(APPEND _cmake_import_check_targets LLVMHexagonCodeGen )
list(APPEND _cmake_import_check_files_for_LLVMHexagonCodeGen "${_IMPORT_PREFIX}/lib/libLLVMHexagonCodeGen.a" )

# Import target "LLVMHexagonAsmParser" for configuration "Release"
set_property(TARGET LLVMHexagonAsmParser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMHexagonAsmParser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMHexagonAsmParser.a"
  )

list(APPEND _cmake_import_check_targets LLVMHexagonAsmParser )
list(APPEND _cmake_import_check_files_for_LLVMHexagonAsmParser "${_IMPORT_PREFIX}/lib/libLLVMHexagonAsmParser.a" )

# Import target "LLVMHexagonDisassembler" for configuration "Release"
set_property(TARGET LLVMHexagonDisassembler APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMHexagonDisassembler PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMHexagonDisassembler.a"
  )

list(APPEND _cmake_import_check_targets LLVMHexagonDisassembler )
list(APPEND _cmake_import_check_files_for_LLVMHexagonDisassembler "${_IMPORT_PREFIX}/lib/libLLVMHexagonDisassembler.a" )

# Import target "LLVMHexagonDesc" for configuration "Release"
set_property(TARGET LLVMHexagonDesc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMHexagonDesc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMHexagonDesc.a"
  )

list(APPEND _cmake_import_check_targets LLVMHexagonDesc )
list(APPEND _cmake_import_check_files_for_LLVMHexagonDesc "${_IMPORT_PREFIX}/lib/libLLVMHexagonDesc.a" )

# Import target "LLVMHexagonInfo" for configuration "Release"
set_property(TARGET LLVMHexagonInfo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMHexagonInfo PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMHexagonInfo.a"
  )

list(APPEND _cmake_import_check_targets LLVMHexagonInfo )
list(APPEND _cmake_import_check_files_for_LLVMHexagonInfo "${_IMPORT_PREFIX}/lib/libLLVMHexagonInfo.a" )

# Import target "LLVMLanaiCodeGen" for configuration "Release"
set_property(TARGET LLVMLanaiCodeGen APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMLanaiCodeGen PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMLanaiCodeGen.a"
  )

list(APPEND _cmake_import_check_targets LLVMLanaiCodeGen )
list(APPEND _cmake_import_check_files_for_LLVMLanaiCodeGen "${_IMPORT_PREFIX}/lib/libLLVMLanaiCodeGen.a" )

# Import target "LLVMLanaiAsmParser" for configuration "Release"
set_property(TARGET LLVMLanaiAsmParser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMLanaiAsmParser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMLanaiAsmParser.a"
  )

list(APPEND _cmake_import_check_targets LLVMLanaiAsmParser )
list(APPEND _cmake_import_check_files_for_LLVMLanaiAsmParser "${_IMPORT_PREFIX}/lib/libLLVMLanaiAsmParser.a" )

# Import target "LLVMLanaiDisassembler" for configuration "Release"
set_property(TARGET LLVMLanaiDisassembler APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMLanaiDisassembler PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMLanaiDisassembler.a"
  )

list(APPEND _cmake_import_check_targets LLVMLanaiDisassembler )
list(APPEND _cmake_import_check_files_for_LLVMLanaiDisassembler "${_IMPORT_PREFIX}/lib/libLLVMLanaiDisassembler.a" )

# Import target "LLVMLanaiAsmPrinter" for configuration "Release"
set_property(TARGET LLVMLanaiAsmPrinter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMLanaiAsmPrinter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMLanaiAsmPrinter.a"
  )

list(APPEND _cmake_import_check_targets LLVMLanaiAsmPrinter )
list(APPEND _cmake_import_check_files_for_LLVMLanaiAsmPrinter "${_IMPORT_PREFIX}/lib/libLLVMLanaiAsmPrinter.a" )

# Import target "LLVMLanaiDesc" for configuration "Release"
set_property(TARGET LLVMLanaiDesc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMLanaiDesc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMLanaiDesc.a"
  )

list(APPEND _cmake_import_check_targets LLVMLanaiDesc )
list(APPEND _cmake_import_check_files_for_LLVMLanaiDesc "${_IMPORT_PREFIX}/lib/libLLVMLanaiDesc.a" )

# Import target "LLVMLanaiInfo" for configuration "Release"
set_property(TARGET LLVMLanaiInfo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMLanaiInfo PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMLanaiInfo.a"
  )

list(APPEND _cmake_import_check_targets LLVMLanaiInfo )
list(APPEND _cmake_import_check_files_for_LLVMLanaiInfo "${_IMPORT_PREFIX}/lib/libLLVMLanaiInfo.a" )

# Import target "LLVMMipsCodeGen" for configuration "Release"
set_property(TARGET LLVMMipsCodeGen APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMMipsCodeGen PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMMipsCodeGen.a"
  )

list(APPEND _cmake_import_check_targets LLVMMipsCodeGen )
list(APPEND _cmake_import_check_files_for_LLVMMipsCodeGen "${_IMPORT_PREFIX}/lib/libLLVMMipsCodeGen.a" )

# Import target "LLVMMipsAsmParser" for configuration "Release"
set_property(TARGET LLVMMipsAsmParser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMMipsAsmParser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMMipsAsmParser.a"
  )

list(APPEND _cmake_import_check_targets LLVMMipsAsmParser )
list(APPEND _cmake_import_check_files_for_LLVMMipsAsmParser "${_IMPORT_PREFIX}/lib/libLLVMMipsAsmParser.a" )

# Import target "LLVMMipsDisassembler" for configuration "Release"
set_property(TARGET LLVMMipsDisassembler APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMMipsDisassembler PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMMipsDisassembler.a"
  )

list(APPEND _cmake_import_check_targets LLVMMipsDisassembler )
list(APPEND _cmake_import_check_files_for_LLVMMipsDisassembler "${_IMPORT_PREFIX}/lib/libLLVMMipsDisassembler.a" )

# Import target "LLVMMipsAsmPrinter" for configuration "Release"
set_property(TARGET LLVMMipsAsmPrinter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMMipsAsmPrinter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMMipsAsmPrinter.a"
  )

list(APPEND _cmake_import_check_targets LLVMMipsAsmPrinter )
list(APPEND _cmake_import_check_files_for_LLVMMipsAsmPrinter "${_IMPORT_PREFIX}/lib/libLLVMMipsAsmPrinter.a" )

# Import target "LLVMMipsDesc" for configuration "Release"
set_property(TARGET LLVMMipsDesc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMMipsDesc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMMipsDesc.a"
  )

list(APPEND _cmake_import_check_targets LLVMMipsDesc )
list(APPEND _cmake_import_check_files_for_LLVMMipsDesc "${_IMPORT_PREFIX}/lib/libLLVMMipsDesc.a" )

# Import target "LLVMMipsInfo" for configuration "Release"
set_property(TARGET LLVMMipsInfo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMMipsInfo PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMMipsInfo.a"
  )

list(APPEND _cmake_import_check_targets LLVMMipsInfo )
list(APPEND _cmake_import_check_files_for_LLVMMipsInfo "${_IMPORT_PREFIX}/lib/libLLVMMipsInfo.a" )

# Import target "LLVMMSP430CodeGen" for configuration "Release"
set_property(TARGET LLVMMSP430CodeGen APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMMSP430CodeGen PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMMSP430CodeGen.a"
  )

list(APPEND _cmake_import_check_targets LLVMMSP430CodeGen )
list(APPEND _cmake_import_check_files_for_LLVMMSP430CodeGen "${_IMPORT_PREFIX}/lib/libLLVMMSP430CodeGen.a" )

# Import target "LLVMMSP430AsmPrinter" for configuration "Release"
set_property(TARGET LLVMMSP430AsmPrinter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMMSP430AsmPrinter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMMSP430AsmPrinter.a"
  )

list(APPEND _cmake_import_check_targets LLVMMSP430AsmPrinter )
list(APPEND _cmake_import_check_files_for_LLVMMSP430AsmPrinter "${_IMPORT_PREFIX}/lib/libLLVMMSP430AsmPrinter.a" )

# Import target "LLVMMSP430Desc" for configuration "Release"
set_property(TARGET LLVMMSP430Desc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMMSP430Desc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMMSP430Desc.a"
  )

list(APPEND _cmake_import_check_targets LLVMMSP430Desc )
list(APPEND _cmake_import_check_files_for_LLVMMSP430Desc "${_IMPORT_PREFIX}/lib/libLLVMMSP430Desc.a" )

# Import target "LLVMMSP430Info" for configuration "Release"
set_property(TARGET LLVMMSP430Info APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMMSP430Info PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMMSP430Info.a"
  )

list(APPEND _cmake_import_check_targets LLVMMSP430Info )
list(APPEND _cmake_import_check_files_for_LLVMMSP430Info "${_IMPORT_PREFIX}/lib/libLLVMMSP430Info.a" )

# Import target "LLVMMSP430AsmParser" for configuration "Release"
set_property(TARGET LLVMMSP430AsmParser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMMSP430AsmParser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMMSP430AsmParser.a"
  )

list(APPEND _cmake_import_check_targets LLVMMSP430AsmParser )
list(APPEND _cmake_import_check_files_for_LLVMMSP430AsmParser "${_IMPORT_PREFIX}/lib/libLLVMMSP430AsmParser.a" )

# Import target "LLVMMSP430Disassembler" for configuration "Release"
set_property(TARGET LLVMMSP430Disassembler APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMMSP430Disassembler PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMMSP430Disassembler.a"
  )

list(APPEND _cmake_import_check_targets LLVMMSP430Disassembler )
list(APPEND _cmake_import_check_files_for_LLVMMSP430Disassembler "${_IMPORT_PREFIX}/lib/libLLVMMSP430Disassembler.a" )

# Import target "LLVMNVPTXCodeGen" for configuration "Release"
set_property(TARGET LLVMNVPTXCodeGen APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMNVPTXCodeGen PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMNVPTXCodeGen.a"
  )

list(APPEND _cmake_import_check_targets LLVMNVPTXCodeGen )
list(APPEND _cmake_import_check_files_for_LLVMNVPTXCodeGen "${_IMPORT_PREFIX}/lib/libLLVMNVPTXCodeGen.a" )

# Import target "LLVMNVPTXAsmPrinter" for configuration "Release"
set_property(TARGET LLVMNVPTXAsmPrinter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMNVPTXAsmPrinter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMNVPTXAsmPrinter.a"
  )

list(APPEND _cmake_import_check_targets LLVMNVPTXAsmPrinter )
list(APPEND _cmake_import_check_files_for_LLVMNVPTXAsmPrinter "${_IMPORT_PREFIX}/lib/libLLVMNVPTXAsmPrinter.a" )

# Import target "LLVMNVPTXDesc" for configuration "Release"
set_property(TARGET LLVMNVPTXDesc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMNVPTXDesc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMNVPTXDesc.a"
  )

list(APPEND _cmake_import_check_targets LLVMNVPTXDesc )
list(APPEND _cmake_import_check_files_for_LLVMNVPTXDesc "${_IMPORT_PREFIX}/lib/libLLVMNVPTXDesc.a" )

# Import target "LLVMNVPTXInfo" for configuration "Release"
set_property(TARGET LLVMNVPTXInfo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMNVPTXInfo PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMNVPTXInfo.a"
  )

list(APPEND _cmake_import_check_targets LLVMNVPTXInfo )
list(APPEND _cmake_import_check_files_for_LLVMNVPTXInfo "${_IMPORT_PREFIX}/lib/libLLVMNVPTXInfo.a" )

# Import target "LLVMPowerPCCodeGen" for configuration "Release"
set_property(TARGET LLVMPowerPCCodeGen APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMPowerPCCodeGen PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMPowerPCCodeGen.a"
  )

list(APPEND _cmake_import_check_targets LLVMPowerPCCodeGen )
list(APPEND _cmake_import_check_files_for_LLVMPowerPCCodeGen "${_IMPORT_PREFIX}/lib/libLLVMPowerPCCodeGen.a" )

# Import target "LLVMPowerPCAsmParser" for configuration "Release"
set_property(TARGET LLVMPowerPCAsmParser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMPowerPCAsmParser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMPowerPCAsmParser.a"
  )

list(APPEND _cmake_import_check_targets LLVMPowerPCAsmParser )
list(APPEND _cmake_import_check_files_for_LLVMPowerPCAsmParser "${_IMPORT_PREFIX}/lib/libLLVMPowerPCAsmParser.a" )

# Import target "LLVMPowerPCDisassembler" for configuration "Release"
set_property(TARGET LLVMPowerPCDisassembler APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMPowerPCDisassembler PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMPowerPCDisassembler.a"
  )

list(APPEND _cmake_import_check_targets LLVMPowerPCDisassembler )
list(APPEND _cmake_import_check_files_for_LLVMPowerPCDisassembler "${_IMPORT_PREFIX}/lib/libLLVMPowerPCDisassembler.a" )

# Import target "LLVMPowerPCAsmPrinter" for configuration "Release"
set_property(TARGET LLVMPowerPCAsmPrinter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMPowerPCAsmPrinter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMPowerPCAsmPrinter.a"
  )

list(APPEND _cmake_import_check_targets LLVMPowerPCAsmPrinter )
list(APPEND _cmake_import_check_files_for_LLVMPowerPCAsmPrinter "${_IMPORT_PREFIX}/lib/libLLVMPowerPCAsmPrinter.a" )

# Import target "LLVMPowerPCDesc" for configuration "Release"
set_property(TARGET LLVMPowerPCDesc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMPowerPCDesc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMPowerPCDesc.a"
  )

list(APPEND _cmake_import_check_targets LLVMPowerPCDesc )
list(APPEND _cmake_import_check_files_for_LLVMPowerPCDesc "${_IMPORT_PREFIX}/lib/libLLVMPowerPCDesc.a" )

# Import target "LLVMPowerPCInfo" for configuration "Release"
set_property(TARGET LLVMPowerPCInfo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMPowerPCInfo PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMPowerPCInfo.a"
  )

list(APPEND _cmake_import_check_targets LLVMPowerPCInfo )
list(APPEND _cmake_import_check_files_for_LLVMPowerPCInfo "${_IMPORT_PREFIX}/lib/libLLVMPowerPCInfo.a" )

# Import target "LLVMSparcCodeGen" for configuration "Release"
set_property(TARGET LLVMSparcCodeGen APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMSparcCodeGen PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMSparcCodeGen.a"
  )

list(APPEND _cmake_import_check_targets LLVMSparcCodeGen )
list(APPEND _cmake_import_check_files_for_LLVMSparcCodeGen "${_IMPORT_PREFIX}/lib/libLLVMSparcCodeGen.a" )

# Import target "LLVMSparcAsmParser" for configuration "Release"
set_property(TARGET LLVMSparcAsmParser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMSparcAsmParser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMSparcAsmParser.a"
  )

list(APPEND _cmake_import_check_targets LLVMSparcAsmParser )
list(APPEND _cmake_import_check_files_for_LLVMSparcAsmParser "${_IMPORT_PREFIX}/lib/libLLVMSparcAsmParser.a" )

# Import target "LLVMSparcDisassembler" for configuration "Release"
set_property(TARGET LLVMSparcDisassembler APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMSparcDisassembler PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMSparcDisassembler.a"
  )

list(APPEND _cmake_import_check_targets LLVMSparcDisassembler )
list(APPEND _cmake_import_check_files_for_LLVMSparcDisassembler "${_IMPORT_PREFIX}/lib/libLLVMSparcDisassembler.a" )

# Import target "LLVMSparcAsmPrinter" for configuration "Release"
set_property(TARGET LLVMSparcAsmPrinter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMSparcAsmPrinter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMSparcAsmPrinter.a"
  )

list(APPEND _cmake_import_check_targets LLVMSparcAsmPrinter )
list(APPEND _cmake_import_check_files_for_LLVMSparcAsmPrinter "${_IMPORT_PREFIX}/lib/libLLVMSparcAsmPrinter.a" )

# Import target "LLVMSparcDesc" for configuration "Release"
set_property(TARGET LLVMSparcDesc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMSparcDesc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMSparcDesc.a"
  )

list(APPEND _cmake_import_check_targets LLVMSparcDesc )
list(APPEND _cmake_import_check_files_for_LLVMSparcDesc "${_IMPORT_PREFIX}/lib/libLLVMSparcDesc.a" )

# Import target "LLVMSparcInfo" for configuration "Release"
set_property(TARGET LLVMSparcInfo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMSparcInfo PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMSparcInfo.a"
  )

list(APPEND _cmake_import_check_targets LLVMSparcInfo )
list(APPEND _cmake_import_check_files_for_LLVMSparcInfo "${_IMPORT_PREFIX}/lib/libLLVMSparcInfo.a" )

# Import target "LLVMSystemZCodeGen" for configuration "Release"
set_property(TARGET LLVMSystemZCodeGen APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMSystemZCodeGen PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMSystemZCodeGen.a"
  )

list(APPEND _cmake_import_check_targets LLVMSystemZCodeGen )
list(APPEND _cmake_import_check_files_for_LLVMSystemZCodeGen "${_IMPORT_PREFIX}/lib/libLLVMSystemZCodeGen.a" )

# Import target "LLVMSystemZAsmParser" for configuration "Release"
set_property(TARGET LLVMSystemZAsmParser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMSystemZAsmParser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMSystemZAsmParser.a"
  )

list(APPEND _cmake_import_check_targets LLVMSystemZAsmParser )
list(APPEND _cmake_import_check_files_for_LLVMSystemZAsmParser "${_IMPORT_PREFIX}/lib/libLLVMSystemZAsmParser.a" )

# Import target "LLVMSystemZDisassembler" for configuration "Release"
set_property(TARGET LLVMSystemZDisassembler APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMSystemZDisassembler PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMSystemZDisassembler.a"
  )

list(APPEND _cmake_import_check_targets LLVMSystemZDisassembler )
list(APPEND _cmake_import_check_files_for_LLVMSystemZDisassembler "${_IMPORT_PREFIX}/lib/libLLVMSystemZDisassembler.a" )

# Import target "LLVMSystemZAsmPrinter" for configuration "Release"
set_property(TARGET LLVMSystemZAsmPrinter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMSystemZAsmPrinter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMSystemZAsmPrinter.a"
  )

list(APPEND _cmake_import_check_targets LLVMSystemZAsmPrinter )
list(APPEND _cmake_import_check_files_for_LLVMSystemZAsmPrinter "${_IMPORT_PREFIX}/lib/libLLVMSystemZAsmPrinter.a" )

# Import target "LLVMSystemZDesc" for configuration "Release"
set_property(TARGET LLVMSystemZDesc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMSystemZDesc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMSystemZDesc.a"
  )

list(APPEND _cmake_import_check_targets LLVMSystemZDesc )
list(APPEND _cmake_import_check_files_for_LLVMSystemZDesc "${_IMPORT_PREFIX}/lib/libLLVMSystemZDesc.a" )

# Import target "LLVMSystemZInfo" for configuration "Release"
set_property(TARGET LLVMSystemZInfo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMSystemZInfo PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMSystemZInfo.a"
  )

list(APPEND _cmake_import_check_targets LLVMSystemZInfo )
list(APPEND _cmake_import_check_files_for_LLVMSystemZInfo "${_IMPORT_PREFIX}/lib/libLLVMSystemZInfo.a" )

# Import target "LLVMWebAssemblyCodeGen" for configuration "Release"
set_property(TARGET LLVMWebAssemblyCodeGen APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMWebAssemblyCodeGen PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMWebAssemblyCodeGen.a"
  )

list(APPEND _cmake_import_check_targets LLVMWebAssemblyCodeGen )
list(APPEND _cmake_import_check_files_for_LLVMWebAssemblyCodeGen "${_IMPORT_PREFIX}/lib/libLLVMWebAssemblyCodeGen.a" )

# Import target "LLVMWebAssemblyAsmParser" for configuration "Release"
set_property(TARGET LLVMWebAssemblyAsmParser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMWebAssemblyAsmParser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMWebAssemblyAsmParser.a"
  )

list(APPEND _cmake_import_check_targets LLVMWebAssemblyAsmParser )
list(APPEND _cmake_import_check_files_for_LLVMWebAssemblyAsmParser "${_IMPORT_PREFIX}/lib/libLLVMWebAssemblyAsmParser.a" )

# Import target "LLVMWebAssemblyDisassembler" for configuration "Release"
set_property(TARGET LLVMWebAssemblyDisassembler APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMWebAssemblyDisassembler PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMWebAssemblyDisassembler.a"
  )

list(APPEND _cmake_import_check_targets LLVMWebAssemblyDisassembler )
list(APPEND _cmake_import_check_files_for_LLVMWebAssemblyDisassembler "${_IMPORT_PREFIX}/lib/libLLVMWebAssemblyDisassembler.a" )

# Import target "LLVMWebAssemblyAsmPrinter" for configuration "Release"
set_property(TARGET LLVMWebAssemblyAsmPrinter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMWebAssemblyAsmPrinter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMWebAssemblyAsmPrinter.a"
  )

list(APPEND _cmake_import_check_targets LLVMWebAssemblyAsmPrinter )
list(APPEND _cmake_import_check_files_for_LLVMWebAssemblyAsmPrinter "${_IMPORT_PREFIX}/lib/libLLVMWebAssemblyAsmPrinter.a" )

# Import target "LLVMWebAssemblyDesc" for configuration "Release"
set_property(TARGET LLVMWebAssemblyDesc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMWebAssemblyDesc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMWebAssemblyDesc.a"
  )

list(APPEND _cmake_import_check_targets LLVMWebAssemblyDesc )
list(APPEND _cmake_import_check_files_for_LLVMWebAssemblyDesc "${_IMPORT_PREFIX}/lib/libLLVMWebAssemblyDesc.a" )

# Import target "LLVMWebAssemblyInfo" for configuration "Release"
set_property(TARGET LLVMWebAssemblyInfo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMWebAssemblyInfo PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMWebAssemblyInfo.a"
  )

list(APPEND _cmake_import_check_targets LLVMWebAssemblyInfo )
list(APPEND _cmake_import_check_files_for_LLVMWebAssemblyInfo "${_IMPORT_PREFIX}/lib/libLLVMWebAssemblyInfo.a" )

# Import target "LLVMX86CodeGen" for configuration "Release"
set_property(TARGET LLVMX86CodeGen APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMX86CodeGen PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMX86CodeGen.a"
  )

list(APPEND _cmake_import_check_targets LLVMX86CodeGen )
list(APPEND _cmake_import_check_files_for_LLVMX86CodeGen "${_IMPORT_PREFIX}/lib/libLLVMX86CodeGen.a" )

# Import target "LLVMX86AsmParser" for configuration "Release"
set_property(TARGET LLVMX86AsmParser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMX86AsmParser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMX86AsmParser.a"
  )

list(APPEND _cmake_import_check_targets LLVMX86AsmParser )
list(APPEND _cmake_import_check_files_for_LLVMX86AsmParser "${_IMPORT_PREFIX}/lib/libLLVMX86AsmParser.a" )

# Import target "LLVMX86Disassembler" for configuration "Release"
set_property(TARGET LLVMX86Disassembler APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMX86Disassembler PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMX86Disassembler.a"
  )

list(APPEND _cmake_import_check_targets LLVMX86Disassembler )
list(APPEND _cmake_import_check_files_for_LLVMX86Disassembler "${_IMPORT_PREFIX}/lib/libLLVMX86Disassembler.a" )

# Import target "LLVMX86AsmPrinter" for configuration "Release"
set_property(TARGET LLVMX86AsmPrinter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMX86AsmPrinter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMX86AsmPrinter.a"
  )

list(APPEND _cmake_import_check_targets LLVMX86AsmPrinter )
list(APPEND _cmake_import_check_files_for_LLVMX86AsmPrinter "${_IMPORT_PREFIX}/lib/libLLVMX86AsmPrinter.a" )

# Import target "LLVMX86Desc" for configuration "Release"
set_property(TARGET LLVMX86Desc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMX86Desc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMX86Desc.a"
  )

list(APPEND _cmake_import_check_targets LLVMX86Desc )
list(APPEND _cmake_import_check_files_for_LLVMX86Desc "${_IMPORT_PREFIX}/lib/libLLVMX86Desc.a" )

# Import target "LLVMX86Info" for configuration "Release"
set_property(TARGET LLVMX86Info APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMX86Info PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMX86Info.a"
  )

list(APPEND _cmake_import_check_targets LLVMX86Info )
list(APPEND _cmake_import_check_files_for_LLVMX86Info "${_IMPORT_PREFIX}/lib/libLLVMX86Info.a" )

# Import target "LLVMX86Utils" for configuration "Release"
set_property(TARGET LLVMX86Utils APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMX86Utils PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMX86Utils.a"
  )

list(APPEND _cmake_import_check_targets LLVMX86Utils )
list(APPEND _cmake_import_check_files_for_LLVMX86Utils "${_IMPORT_PREFIX}/lib/libLLVMX86Utils.a" )

# Import target "LLVMXCoreCodeGen" for configuration "Release"
set_property(TARGET LLVMXCoreCodeGen APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMXCoreCodeGen PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMXCoreCodeGen.a"
  )

list(APPEND _cmake_import_check_targets LLVMXCoreCodeGen )
list(APPEND _cmake_import_check_files_for_LLVMXCoreCodeGen "${_IMPORT_PREFIX}/lib/libLLVMXCoreCodeGen.a" )

# Import target "LLVMXCoreDisassembler" for configuration "Release"
set_property(TARGET LLVMXCoreDisassembler APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMXCoreDisassembler PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMXCoreDisassembler.a"
  )

list(APPEND _cmake_import_check_targets LLVMXCoreDisassembler )
list(APPEND _cmake_import_check_files_for_LLVMXCoreDisassembler "${_IMPORT_PREFIX}/lib/libLLVMXCoreDisassembler.a" )

# Import target "LLVMXCoreAsmPrinter" for configuration "Release"
set_property(TARGET LLVMXCoreAsmPrinter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMXCoreAsmPrinter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMXCoreAsmPrinter.a"
  )

list(APPEND _cmake_import_check_targets LLVMXCoreAsmPrinter )
list(APPEND _cmake_import_check_files_for_LLVMXCoreAsmPrinter "${_IMPORT_PREFIX}/lib/libLLVMXCoreAsmPrinter.a" )

# Import target "LLVMXCoreDesc" for configuration "Release"
set_property(TARGET LLVMXCoreDesc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMXCoreDesc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMXCoreDesc.a"
  )

list(APPEND _cmake_import_check_targets LLVMXCoreDesc )
list(APPEND _cmake_import_check_files_for_LLVMXCoreDesc "${_IMPORT_PREFIX}/lib/libLLVMXCoreDesc.a" )

# Import target "LLVMXCoreInfo" for configuration "Release"
set_property(TARGET LLVMXCoreInfo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMXCoreInfo PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMXCoreInfo.a"
  )

list(APPEND _cmake_import_check_targets LLVMXCoreInfo )
list(APPEND _cmake_import_check_files_for_LLVMXCoreInfo "${_IMPORT_PREFIX}/lib/libLLVMXCoreInfo.a" )

# Import target "LLVMNMXCodeGen" for configuration "Release"
set_property(TARGET LLVMNMXCodeGen APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMNMXCodeGen PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMNMXCodeGen.a"
  )

list(APPEND _cmake_import_check_targets LLVMNMXCodeGen )
list(APPEND _cmake_import_check_files_for_LLVMNMXCodeGen "${_IMPORT_PREFIX}/lib/libLLVMNMXCodeGen.a" )

# Import target "LLVMNMXInfo" for configuration "Release"
set_property(TARGET LLVMNMXInfo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMNMXInfo PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMNMXInfo.a"
  )

list(APPEND _cmake_import_check_targets LLVMNMXInfo )
list(APPEND _cmake_import_check_files_for_LLVMNMXInfo "${_IMPORT_PREFIX}/lib/libLLVMNMXInfo.a" )

# Import target "LLVMNMXDesc" for configuration "Release"
set_property(TARGET LLVMNMXDesc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMNMXDesc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMNMXDesc.a"
  )

list(APPEND _cmake_import_check_targets LLVMNMXDesc )
list(APPEND _cmake_import_check_files_for_LLVMNMXDesc "${_IMPORT_PREFIX}/lib/libLLVMNMXDesc.a" )

# Import target "LLVMNMXAsmPrinter" for configuration "Release"
set_property(TARGET LLVMNMXAsmPrinter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMNMXAsmPrinter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMNMXAsmPrinter.a"
  )

list(APPEND _cmake_import_check_targets LLVMNMXAsmPrinter )
list(APPEND _cmake_import_check_files_for_LLVMNMXAsmPrinter "${_IMPORT_PREFIX}/lib/libLLVMNMXAsmPrinter.a" )

# Import target "LLVMNMXDisassembler" for configuration "Release"
set_property(TARGET LLVMNMXDisassembler APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMNMXDisassembler PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMNMXDisassembler.a"
  )

list(APPEND _cmake_import_check_targets LLVMNMXDisassembler )
list(APPEND _cmake_import_check_files_for_LLVMNMXDisassembler "${_IMPORT_PREFIX}/lib/libLLVMNMXDisassembler.a" )

# Import target "LLVMNMXAsmParser" for configuration "Release"
set_property(TARGET LLVMNMXAsmParser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMNMXAsmParser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMNMXAsmParser.a"
  )

list(APPEND _cmake_import_check_targets LLVMNMXAsmParser )
list(APPEND _cmake_import_check_files_for_LLVMNMXAsmParser "${_IMPORT_PREFIX}/lib/libLLVMNMXAsmParser.a" )

# Import target "LLVMAsmParser" for configuration "Release"
set_property(TARGET LLVMAsmParser APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMAsmParser PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMAsmParser.a"
  )

list(APPEND _cmake_import_check_targets LLVMAsmParser )
list(APPEND _cmake_import_check_files_for_LLVMAsmParser "${_IMPORT_PREFIX}/lib/libLLVMAsmParser.a" )

# Import target "LLVMLineEditor" for configuration "Release"
set_property(TARGET LLVMLineEditor APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMLineEditor PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMLineEditor.a"
  )

list(APPEND _cmake_import_check_targets LLVMLineEditor )
list(APPEND _cmake_import_check_files_for_LLVMLineEditor "${_IMPORT_PREFIX}/lib/libLLVMLineEditor.a" )

# Import target "LLVMProfileData" for configuration "Release"
set_property(TARGET LLVMProfileData APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMProfileData PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMProfileData.a"
  )

list(APPEND _cmake_import_check_targets LLVMProfileData )
list(APPEND _cmake_import_check_files_for_LLVMProfileData "${_IMPORT_PREFIX}/lib/libLLVMProfileData.a" )

# Import target "LLVMCoverage" for configuration "Release"
set_property(TARGET LLVMCoverage APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMCoverage PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMCoverage.a"
  )

list(APPEND _cmake_import_check_targets LLVMCoverage )
list(APPEND _cmake_import_check_files_for_LLVMCoverage "${_IMPORT_PREFIX}/lib/libLLVMCoverage.a" )

# Import target "LLVMPasses" for configuration "Release"
set_property(TARGET LLVMPasses APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMPasses PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMPasses.a"
  )

list(APPEND _cmake_import_check_targets LLVMPasses )
list(APPEND _cmake_import_check_files_for_LLVMPasses "${_IMPORT_PREFIX}/lib/libLLVMPasses.a" )

# Import target "LLVMTextAPI" for configuration "Release"
set_property(TARGET LLVMTextAPI APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMTextAPI PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMTextAPI.a"
  )

list(APPEND _cmake_import_check_targets LLVMTextAPI )
list(APPEND _cmake_import_check_files_for_LLVMTextAPI "${_IMPORT_PREFIX}/lib/libLLVMTextAPI.a" )

# Import target "LLVMDlltoolDriver" for configuration "Release"
set_property(TARGET LLVMDlltoolDriver APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMDlltoolDriver PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMDlltoolDriver.a"
  )

list(APPEND _cmake_import_check_targets LLVMDlltoolDriver )
list(APPEND _cmake_import_check_files_for_LLVMDlltoolDriver "${_IMPORT_PREFIX}/lib/libLLVMDlltoolDriver.a" )

# Import target "LLVMLibDriver" for configuration "Release"
set_property(TARGET LLVMLibDriver APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMLibDriver PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMLibDriver.a"
  )

list(APPEND _cmake_import_check_targets LLVMLibDriver )
list(APPEND _cmake_import_check_files_for_LLVMLibDriver "${_IMPORT_PREFIX}/lib/libLLVMLibDriver.a" )

# Import target "LLVMXRay" for configuration "Release"
set_property(TARGET LLVMXRay APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMXRay PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMXRay.a"
  )

list(APPEND _cmake_import_check_targets LLVMXRay )
list(APPEND _cmake_import_check_files_for_LLVMXRay "${_IMPORT_PREFIX}/lib/libLLVMXRay.a" )

# Import target "LLVMWindowsManifest" for configuration "Release"
set_property(TARGET LLVMWindowsManifest APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LLVMWindowsManifest PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLLVMWindowsManifest.a"
  )

list(APPEND _cmake_import_check_targets LLVMWindowsManifest )
list(APPEND _cmake_import_check_files_for_LLVMWindowsManifest "${_IMPORT_PREFIX}/lib/libLLVMWindowsManifest.a" )

# Import target "LTO" for configuration "Release"
set_property(TARGET LTO APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LTO PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLTO.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libLTO.dylib"
  )

list(APPEND _cmake_import_check_targets LTO )
list(APPEND _cmake_import_check_files_for_LTO "${_IMPORT_PREFIX}/lib/libLTO.dylib" )

# Import target "llvm-ar" for configuration "Release"
set_property(TARGET llvm-ar APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-ar PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-ar"
  )

list(APPEND _cmake_import_check_targets llvm-ar )
list(APPEND _cmake_import_check_files_for_llvm-ar "${_IMPORT_PREFIX}/bin/llvm-ar" )

# Import target "llvm-config" for configuration "Release"
set_property(TARGET llvm-config APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-config PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-config"
  )

list(APPEND _cmake_import_check_targets llvm-config )
list(APPEND _cmake_import_check_files_for_llvm-config "${_IMPORT_PREFIX}/bin/llvm-config" )

# Import target "llvm-lto" for configuration "Release"
set_property(TARGET llvm-lto APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-lto PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-lto"
  )

list(APPEND _cmake_import_check_targets llvm-lto )
list(APPEND _cmake_import_check_files_for_llvm-lto "${_IMPORT_PREFIX}/bin/llvm-lto" )

# Import target "llvm-profdata" for configuration "Release"
set_property(TARGET llvm-profdata APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-profdata PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-profdata"
  )

list(APPEND _cmake_import_check_targets llvm-profdata )
list(APPEND _cmake_import_check_files_for_llvm-profdata "${_IMPORT_PREFIX}/bin/llvm-profdata" )

# Import target "bugpoint" for configuration "Release"
set_property(TARGET bugpoint APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(bugpoint PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/bugpoint"
  )

list(APPEND _cmake_import_check_targets bugpoint )
list(APPEND _cmake_import_check_files_for_bugpoint "${_IMPORT_PREFIX}/bin/bugpoint" )

# Import target "dsymutil" for configuration "Release"
set_property(TARGET dsymutil APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(dsymutil PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/dsymutil"
  )

list(APPEND _cmake_import_check_targets dsymutil )
list(APPEND _cmake_import_check_files_for_dsymutil "${_IMPORT_PREFIX}/bin/dsymutil" )

# Import target "llc" for configuration "Release"
set_property(TARGET llc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llc PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llc"
  )

list(APPEND _cmake_import_check_targets llc )
list(APPEND _cmake_import_check_files_for_llc "${_IMPORT_PREFIX}/bin/llc" )

# Import target "lli" for configuration "Release"
set_property(TARGET lli APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(lli PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/lli"
  )

list(APPEND _cmake_import_check_targets lli )
list(APPEND _cmake_import_check_files_for_lli "${_IMPORT_PREFIX}/bin/lli" )

# Import target "llvm-as" for configuration "Release"
set_property(TARGET llvm-as APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-as PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-as"
  )

list(APPEND _cmake_import_check_targets llvm-as )
list(APPEND _cmake_import_check_files_for_llvm-as "${_IMPORT_PREFIX}/bin/llvm-as" )

# Import target "llvm-bcanalyzer" for configuration "Release"
set_property(TARGET llvm-bcanalyzer APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-bcanalyzer PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-bcanalyzer"
  )

list(APPEND _cmake_import_check_targets llvm-bcanalyzer )
list(APPEND _cmake_import_check_files_for_llvm-bcanalyzer "${_IMPORT_PREFIX}/bin/llvm-bcanalyzer" )

# Import target "llvm-c-test" for configuration "Release"
set_property(TARGET llvm-c-test APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-c-test PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-c-test"
  )

list(APPEND _cmake_import_check_targets llvm-c-test )
list(APPEND _cmake_import_check_files_for_llvm-c-test "${_IMPORT_PREFIX}/bin/llvm-c-test" )

# Import target "llvm-cat" for configuration "Release"
set_property(TARGET llvm-cat APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-cat PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-cat"
  )

list(APPEND _cmake_import_check_targets llvm-cat )
list(APPEND _cmake_import_check_files_for_llvm-cat "${_IMPORT_PREFIX}/bin/llvm-cat" )

# Import target "llvm-cfi-verify" for configuration "Release"
set_property(TARGET llvm-cfi-verify APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-cfi-verify PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-cfi-verify"
  )

list(APPEND _cmake_import_check_targets llvm-cfi-verify )
list(APPEND _cmake_import_check_files_for_llvm-cfi-verify "${_IMPORT_PREFIX}/bin/llvm-cfi-verify" )

# Import target "llvm-cov" for configuration "Release"
set_property(TARGET llvm-cov APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-cov PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-cov"
  )

list(APPEND _cmake_import_check_targets llvm-cov )
list(APPEND _cmake_import_check_files_for_llvm-cov "${_IMPORT_PREFIX}/bin/llvm-cov" )

# Import target "llvm-cvtres" for configuration "Release"
set_property(TARGET llvm-cvtres APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-cvtres PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-cvtres"
  )

list(APPEND _cmake_import_check_targets llvm-cvtres )
list(APPEND _cmake_import_check_files_for_llvm-cvtres "${_IMPORT_PREFIX}/bin/llvm-cvtres" )

# Import target "llvm-cxxdump" for configuration "Release"
set_property(TARGET llvm-cxxdump APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-cxxdump PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-cxxdump"
  )

list(APPEND _cmake_import_check_targets llvm-cxxdump )
list(APPEND _cmake_import_check_files_for_llvm-cxxdump "${_IMPORT_PREFIX}/bin/llvm-cxxdump" )

# Import target "llvm-cxxfilt" for configuration "Release"
set_property(TARGET llvm-cxxfilt APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-cxxfilt PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-cxxfilt"
  )

list(APPEND _cmake_import_check_targets llvm-cxxfilt )
list(APPEND _cmake_import_check_files_for_llvm-cxxfilt "${_IMPORT_PREFIX}/bin/llvm-cxxfilt" )

# Import target "llvm-cxxmap" for configuration "Release"
set_property(TARGET llvm-cxxmap APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-cxxmap PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-cxxmap"
  )

list(APPEND _cmake_import_check_targets llvm-cxxmap )
list(APPEND _cmake_import_check_files_for_llvm-cxxmap "${_IMPORT_PREFIX}/bin/llvm-cxxmap" )

# Import target "llvm-diff" for configuration "Release"
set_property(TARGET llvm-diff APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-diff PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-diff"
  )

list(APPEND _cmake_import_check_targets llvm-diff )
list(APPEND _cmake_import_check_files_for_llvm-diff "${_IMPORT_PREFIX}/bin/llvm-diff" )

# Import target "llvm-dis" for configuration "Release"
set_property(TARGET llvm-dis APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-dis PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-dis"
  )

list(APPEND _cmake_import_check_targets llvm-dis )
list(APPEND _cmake_import_check_files_for_llvm-dis "${_IMPORT_PREFIX}/bin/llvm-dis" )

# Import target "llvm-dwarfdump" for configuration "Release"
set_property(TARGET llvm-dwarfdump APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-dwarfdump PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-dwarfdump"
  )

list(APPEND _cmake_import_check_targets llvm-dwarfdump )
list(APPEND _cmake_import_check_files_for_llvm-dwarfdump "${_IMPORT_PREFIX}/bin/llvm-dwarfdump" )

# Import target "llvm-dwp" for configuration "Release"
set_property(TARGET llvm-dwp APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-dwp PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-dwp"
  )

list(APPEND _cmake_import_check_targets llvm-dwp )
list(APPEND _cmake_import_check_files_for_llvm-dwp "${_IMPORT_PREFIX}/bin/llvm-dwp" )

# Import target "llvm-elfabi" for configuration "Release"
set_property(TARGET llvm-elfabi APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-elfabi PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-elfabi"
  )

list(APPEND _cmake_import_check_targets llvm-elfabi )
list(APPEND _cmake_import_check_files_for_llvm-elfabi "${_IMPORT_PREFIX}/bin/llvm-elfabi" )

# Import target "llvm-exegesis" for configuration "Release"
set_property(TARGET llvm-exegesis APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-exegesis PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-exegesis"
  )

list(APPEND _cmake_import_check_targets llvm-exegesis )
list(APPEND _cmake_import_check_files_for_llvm-exegesis "${_IMPORT_PREFIX}/bin/llvm-exegesis" )

# Import target "llvm-extract" for configuration "Release"
set_property(TARGET llvm-extract APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-extract PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-extract"
  )

list(APPEND _cmake_import_check_targets llvm-extract )
list(APPEND _cmake_import_check_files_for_llvm-extract "${_IMPORT_PREFIX}/bin/llvm-extract" )

# Import target "llvm-link" for configuration "Release"
set_property(TARGET llvm-link APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-link PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-link"
  )

list(APPEND _cmake_import_check_targets llvm-link )
list(APPEND _cmake_import_check_files_for_llvm-link "${_IMPORT_PREFIX}/bin/llvm-link" )

# Import target "llvm-lto2" for configuration "Release"
set_property(TARGET llvm-lto2 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-lto2 PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-lto2"
  )

list(APPEND _cmake_import_check_targets llvm-lto2 )
list(APPEND _cmake_import_check_files_for_llvm-lto2 "${_IMPORT_PREFIX}/bin/llvm-lto2" )

# Import target "llvm-mc" for configuration "Release"
set_property(TARGET llvm-mc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-mc PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-mc"
  )

list(APPEND _cmake_import_check_targets llvm-mc )
list(APPEND _cmake_import_check_files_for_llvm-mc "${_IMPORT_PREFIX}/bin/llvm-mc" )

# Import target "llvm-mca" for configuration "Release"
set_property(TARGET llvm-mca APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-mca PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-mca"
  )

list(APPEND _cmake_import_check_targets llvm-mca )
list(APPEND _cmake_import_check_files_for_llvm-mca "${_IMPORT_PREFIX}/bin/llvm-mca" )

# Import target "llvm-modextract" for configuration "Release"
set_property(TARGET llvm-modextract APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-modextract PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-modextract"
  )

list(APPEND _cmake_import_check_targets llvm-modextract )
list(APPEND _cmake_import_check_files_for_llvm-modextract "${_IMPORT_PREFIX}/bin/llvm-modextract" )

# Import target "llvm-mt" for configuration "Release"
set_property(TARGET llvm-mt APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-mt PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-mt"
  )

list(APPEND _cmake_import_check_targets llvm-mt )
list(APPEND _cmake_import_check_files_for_llvm-mt "${_IMPORT_PREFIX}/bin/llvm-mt" )

# Import target "llvm-nm" for configuration "Release"
set_property(TARGET llvm-nm APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-nm PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-nm"
  )

list(APPEND _cmake_import_check_targets llvm-nm )
list(APPEND _cmake_import_check_files_for_llvm-nm "${_IMPORT_PREFIX}/bin/llvm-nm" )

# Import target "llvm-objcopy" for configuration "Release"
set_property(TARGET llvm-objcopy APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-objcopy PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-objcopy"
  )

list(APPEND _cmake_import_check_targets llvm-objcopy )
list(APPEND _cmake_import_check_files_for_llvm-objcopy "${_IMPORT_PREFIX}/bin/llvm-objcopy" )

# Import target "llvm-objdump" for configuration "Release"
set_property(TARGET llvm-objdump APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-objdump PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-objdump"
  )

list(APPEND _cmake_import_check_targets llvm-objdump )
list(APPEND _cmake_import_check_files_for_llvm-objdump "${_IMPORT_PREFIX}/bin/llvm-objdump" )

# Import target "llvm-opt-report" for configuration "Release"
set_property(TARGET llvm-opt-report APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-opt-report PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-opt-report"
  )

list(APPEND _cmake_import_check_targets llvm-opt-report )
list(APPEND _cmake_import_check_files_for_llvm-opt-report "${_IMPORT_PREFIX}/bin/llvm-opt-report" )

# Import target "llvm-pdbutil" for configuration "Release"
set_property(TARGET llvm-pdbutil APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-pdbutil PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-pdbutil"
  )

list(APPEND _cmake_import_check_targets llvm-pdbutil )
list(APPEND _cmake_import_check_files_for_llvm-pdbutil "${_IMPORT_PREFIX}/bin/llvm-pdbutil" )

# Import target "llvm-rc" for configuration "Release"
set_property(TARGET llvm-rc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-rc PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-rc"
  )

list(APPEND _cmake_import_check_targets llvm-rc )
list(APPEND _cmake_import_check_files_for_llvm-rc "${_IMPORT_PREFIX}/bin/llvm-rc" )

# Import target "llvm-readobj" for configuration "Release"
set_property(TARGET llvm-readobj APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-readobj PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-readobj"
  )

list(APPEND _cmake_import_check_targets llvm-readobj )
list(APPEND _cmake_import_check_files_for_llvm-readobj "${_IMPORT_PREFIX}/bin/llvm-readobj" )

# Import target "llvm-rtdyld" for configuration "Release"
set_property(TARGET llvm-rtdyld APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-rtdyld PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-rtdyld"
  )

list(APPEND _cmake_import_check_targets llvm-rtdyld )
list(APPEND _cmake_import_check_files_for_llvm-rtdyld "${_IMPORT_PREFIX}/bin/llvm-rtdyld" )

# Import target "llvm-size" for configuration "Release"
set_property(TARGET llvm-size APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-size PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-size"
  )

list(APPEND _cmake_import_check_targets llvm-size )
list(APPEND _cmake_import_check_files_for_llvm-size "${_IMPORT_PREFIX}/bin/llvm-size" )

# Import target "llvm-split" for configuration "Release"
set_property(TARGET llvm-split APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-split PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-split"
  )

list(APPEND _cmake_import_check_targets llvm-split )
list(APPEND _cmake_import_check_files_for_llvm-split "${_IMPORT_PREFIX}/bin/llvm-split" )

# Import target "llvm-stress" for configuration "Release"
set_property(TARGET llvm-stress APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-stress PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-stress"
  )

list(APPEND _cmake_import_check_targets llvm-stress )
list(APPEND _cmake_import_check_files_for_llvm-stress "${_IMPORT_PREFIX}/bin/llvm-stress" )

# Import target "llvm-strings" for configuration "Release"
set_property(TARGET llvm-strings APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-strings PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-strings"
  )

list(APPEND _cmake_import_check_targets llvm-strings )
list(APPEND _cmake_import_check_files_for_llvm-strings "${_IMPORT_PREFIX}/bin/llvm-strings" )

# Import target "llvm-symbolizer" for configuration "Release"
set_property(TARGET llvm-symbolizer APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-symbolizer PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-symbolizer"
  )

list(APPEND _cmake_import_check_targets llvm-symbolizer )
list(APPEND _cmake_import_check_files_for_llvm-symbolizer "${_IMPORT_PREFIX}/bin/llvm-symbolizer" )

# Import target "llvm-undname" for configuration "Release"
set_property(TARGET llvm-undname APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-undname PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-undname"
  )

list(APPEND _cmake_import_check_targets llvm-undname )
list(APPEND _cmake_import_check_files_for_llvm-undname "${_IMPORT_PREFIX}/bin/llvm-undname" )

# Import target "llvm-xray" for configuration "Release"
set_property(TARGET llvm-xray APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(llvm-xray PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/llvm-xray"
  )

list(APPEND _cmake_import_check_targets llvm-xray )
list(APPEND _cmake_import_check_files_for_llvm-xray "${_IMPORT_PREFIX}/bin/llvm-xray" )

# Import target "obj2yaml" for configuration "Release"
set_property(TARGET obj2yaml APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(obj2yaml PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/obj2yaml"
  )

list(APPEND _cmake_import_check_targets obj2yaml )
list(APPEND _cmake_import_check_files_for_obj2yaml "${_IMPORT_PREFIX}/bin/obj2yaml" )

# Import target "opt" for configuration "Release"
set_property(TARGET opt APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(opt PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/opt"
  )

list(APPEND _cmake_import_check_targets opt )
list(APPEND _cmake_import_check_files_for_opt "${_IMPORT_PREFIX}/bin/opt" )

# Import target "OptRemarks" for configuration "Release"
set_property(TARGET OptRemarks APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(OptRemarks PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libOptRemarks.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libOptRemarks.dylib"
  )

list(APPEND _cmake_import_check_targets OptRemarks )
list(APPEND _cmake_import_check_files_for_OptRemarks "${_IMPORT_PREFIX}/lib/libOptRemarks.dylib" )

# Import target "sancov" for configuration "Release"
set_property(TARGET sancov APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(sancov PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/sancov"
  )

list(APPEND _cmake_import_check_targets sancov )
list(APPEND _cmake_import_check_files_for_sancov "${_IMPORT_PREFIX}/bin/sancov" )

# Import target "sanstats" for configuration "Release"
set_property(TARGET sanstats APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(sanstats PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/sanstats"
  )

list(APPEND _cmake_import_check_targets sanstats )
list(APPEND _cmake_import_check_files_for_sanstats "${_IMPORT_PREFIX}/bin/sanstats" )

# Import target "verify-uselistorder" for configuration "Release"
set_property(TARGET verify-uselistorder APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(verify-uselistorder PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/verify-uselistorder"
  )

list(APPEND _cmake_import_check_targets verify-uselistorder )
list(APPEND _cmake_import_check_files_for_verify-uselistorder "${_IMPORT_PREFIX}/bin/verify-uselistorder" )

# Import target "yaml2obj" for configuration "Release"
set_property(TARGET yaml2obj APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(yaml2obj PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/yaml2obj"
  )

list(APPEND _cmake_import_check_targets yaml2obj )
list(APPEND _cmake_import_check_files_for_yaml2obj "${_IMPORT_PREFIX}/bin/yaml2obj" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
