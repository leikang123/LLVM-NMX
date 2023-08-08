# Install script for directory: /volumes/hello2/nmx/llvm/unittests

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Library/Developer/CommandLineTools/usr/bin/objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/volumes/hello2/nmx/build/unittests/ADT/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/Analysis/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/AsmParser/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/BinaryFormat/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/Bitcode/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/CodeGen/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/DebugInfo/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/Demangle/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/ExecutionEngine/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/FuzzMutate/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/IR/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/LineEditor/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/Linker/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/MC/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/MI/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/Object/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/ObjectYAML/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/Option/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/OptRemarks/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/Passes/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/ProfileData/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/Support/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/TextAPI/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/Target/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/Transforms/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/XRay/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/tools/cmake_install.cmake")

endif()

