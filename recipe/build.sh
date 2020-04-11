#!/bin/bash

if [[ ${target_platform} == osx-64 ]]; then
  export SDKROOT=${CONDA_BUILD_SYSROOT}
fi
./ccache.ccache/configure --prefix=$PREFIX
make -j${CPU_COUNT}
if [[ ${target_platform} != osx-64 ]]; then
  # Broken on macOS currently
  make check
fi
make install
