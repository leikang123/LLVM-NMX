# Install script for directory: /volumes/hello2/LLVM-NMX/llvm/tools/llvm-ar

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

if(CMAKE_INSTALL_COMPONENT STREQUAL "llvm-ar" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/volumes/hello2/LLVM-NMX/build/bin/llvm-ar")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/llvm-ar" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/llvm-ar")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/local/opt/llvm/bin/llvm-strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/llvm-ar")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "llvm-ranlib" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/volumes/hello2/LLVM-NMX/llvm/cmake/modules/LLVMInstallSymlink.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "llvm-ranlib" OR NOT CMAKE_INSTALL_COMPONENT)
  install_symlink(llvm-ranlib llvm-ar bin)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "llvm-lib" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/volumes/hello2/LLVM-NMX/llvm/cmake/modules/LLVMInstallSymlink.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "llvm-lib" OR NOT CMAKE_INSTALL_COMPONENT)
  install_symlink(llvm-lib llvm-ar bin)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "llvm-dlltool" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/volumes/hello2/LLVM-NMX/llvm/cmake/modules/LLVMInstallSymlink.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "llvm-dlltool" OR NOT CMAKE_INSTALL_COMPONENT)
  install_symlink(llvm-dlltool llvm-ar bin)
endif()

