# Install script for directory: /volumes/hello2/nmx/llvm

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

if(CMAKE_INSTALL_COMPONENT STREQUAL "llvm-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES
    "/volumes/hello2/nmx/llvm/include/llvm"
    "/volumes/hello2/nmx/llvm/include/llvm-c"
    FILES_MATCHING REGEX "/[^/]*\\.def$" REGEX "/[^/]*\\.h$" REGEX "/[^/]*\\.td$" REGEX "/[^/]*\\.inc$" REGEX "/license\\.txt$" REGEX "/\\.svn$" EXCLUDE)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "llvm-headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES
    "/volumes/hello2/nmx/build/include/llvm"
    "/volumes/hello2/nmx/build/include/llvm-c"
    FILES_MATCHING REGEX "/[^/]*\\.def$" REGEX "/[^/]*\\.h$" REGEX "/[^/]*\\.gen$" REGEX "/[^/]*\\.inc$" REGEX "/cmakefiles$" EXCLUDE REGEX "/config\\.h$" EXCLUDE REGEX "/\\.svn$" EXCLUDE)
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/volumes/hello2/nmx/build/lib/Demangle/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/lib/Support/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/lib/TableGen/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/utils/TableGen/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/include/llvm/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/lib/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/utils/FileCheck/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/utils/PerfectShuffle/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/utils/count/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/utils/not/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/utils/yaml-bench/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/projects/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/tools/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/runtimes/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/examples/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/utils/lit/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/test/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/unittests/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/utils/unittest/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/docs/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/cmake/modules/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/utils/llvm-lit/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/utils/benchmark/cmake_install.cmake")
  include("/volumes/hello2/nmx/build/benchmarks/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/volumes/hello2/nmx/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
