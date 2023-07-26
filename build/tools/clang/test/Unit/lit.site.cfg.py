## Autogenerated from /volumes/hello2/nmx/llvm/tools/clang/test/Unit/lit.site.cfg.py.in
## Do not edit!

import sys

config.llvm_src_root = "/volumes/hello2/nmx/llvm"
config.llvm_obj_root = "/volumes/hello2/nmx/build"
config.llvm_tools_dir = "/volumes/hello2/nmx/build/./bin"
config.llvm_libs_dir = "/volumes/hello2/nmx/build/./lib"
config.llvm_build_mode = "."
config.clang_obj_root = "/volumes/hello2/nmx/build/tools/clang"
config.enable_shared = 1
config.shlibdir = "/volumes/hello2/nmx/build/./lib"
config.target_triple = "x86_64-apple-darwin20.6.0"

# Support substitution of the tools_dir, libs_dirs, and build_mode with user
# parameters. This is used when we can't determine the tool dir at
# configuration time.
try:
    config.llvm_tools_dir = config.llvm_tools_dir % lit_config.params
    config.llvm_libs_dir = config.llvm_libs_dir % lit_config.params
    config.llvm_build_mode = config.llvm_build_mode % lit_config.params
except KeyError:
    e = sys.exc_info()[1]
    key, = e.args
    lit_config.fatal("unable to find %r parameter, use '--param=%s=VALUE'" % (key,key))

# Let the main config do the real work.
lit_config.load_config(config, "/volumes/hello2/nmx/llvm/tools/clang/test/Unit/lit.cfg.py")
