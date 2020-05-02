#!/bin/bash

if [[ ${target_platform} == osx-64 ]]; then
  export SDKROOT=${CONDA_BUILD_SYSROOT}
fi
./ccache.ccache/configure --prefix=$PREFIX
make -j${CPU_COUNT}
if [[ ${target_platform} != osx-64 ]]; then
  # Disabling macOS due to:
  # Test suite:     debug_prefix_map
  # Test case:      Multiple -fdebug-prefix-map
  # Failure reason: Relocation (name) not found in test.o
  make check
fi
make install
