# Install script for directory: /volumes/hello2/LLVM-NMX/llvm/tools/clang

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
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
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
  set(CMAKE_OBJDUMP "/usr/local/opt/llvm/bin/llvm-objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES
    "/volumes/hello2/LLVM-NMX/llvm/tools/clang/include/clang"
    "/volumes/hello2/LLVM-NMX/llvm/tools/clang/include/clang-c"
    FILES_MATCHING REGEX "/[^/]*\\.def$" REGEX "/[^/]*\\.h$" REGEX "/config\\.h$" EXCLUDE REGEX "/\\.svn$" EXCLUDE)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/volumes/hello2/LLVM-NMX/build/tools/clang/include/clang" FILES_MATCHING REGEX "/cmakefiles$" EXCLUDE REGEX "/[^/]*\\.inc$" REGEX "/[^/]*\\.h$")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/clang" TYPE PROGRAM FILES "/volumes/hello2/LLVM-NMX/llvm/tools/clang/utils/bash-autocomplete.sh")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/volumes/hello2/LLVM-NMX/build/tools/clang/utils/TableGen/cmake_install.cmake")
  include("/volumes/hello2/LLVM-NMX/build/tools/clang/include/cmake_install.cmake")
  include("/volumes/hello2/LLVM-NMX/build/tools/clang/lib/cmake_install.cmake")
  include("/volumes/hello2/LLVM-NMX/build/tools/clang/tools/cmake_install.cmake")
  include("/volumes/hello2/LLVM-NMX/build/tools/clang/runtime/cmake_install.cmake")
  include("/volumes/hello2/LLVM-NMX/build/tools/clang/unittests/cmake_install.cmake")
  include("/volumes/hello2/LLVM-NMX/build/tools/clang/test/cmake_install.cmake")
  include("/volumes/hello2/LLVM-NMX/build/tools/clang/bindings/python/tests/cmake_install.cmake")
  include("/volumes/hello2/LLVM-NMX/build/tools/clang/utils/perf-training/cmake_install.cmake")
  include("/volumes/hello2/LLVM-NMX/build/tools/clang/docs/cmake_install.cmake")
  include("/volumes/hello2/LLVM-NMX/build/tools/clang/cmake/modules/cmake_install.cmake")
  include("/volumes/hello2/LLVM-NMX/build/tools/clang/utils/hmaptool/cmake_install.cmake")

endif()

