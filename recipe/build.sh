#!/bin/bash

mkdir build
cd build

if [ "$target_platform" = "osx-arm64" ]; then
    # Workaround for wrong detection of vector extensions,
    # see https://github.com/ccache/ccache/issues/734
    CMAKE_ARGS="${CMAKE_ARGS} -DHAVE_AVX2=NO -DHAVE_C_AVX2=NO -DHAVE_C_AVX512=NO -DHAVE_C_SSE2=NO -DHAVE_C_SSE41=NO"
fi

cmake -GNinja \
    ${CMAKE_ARGS} \
    ${SRC_DIR}

ninja
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
    ninja check
fi
ninja install
