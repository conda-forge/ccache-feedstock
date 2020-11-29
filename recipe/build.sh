#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .

mkdir build
cd build

if [ "$target_platform" = "osx-arm64" ]; then
    # Workaround for wrong detection of vector extensions,
    # see https://github.com/ccache/ccache/issues/734
    CMAKE_ARGS="${CMAKE_ARGS} -DHAVE_AVX2=NO -DHAVE_C_AVX2=NO -DHAVE_C_AVX512=NO -DHAVE_C_SSE2=NO -DHAVE_C_SSE41=NO"
fi

cmake \
    ${CMAKE_ARGS} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    ${SRC_DIR}

make -j${CPU_COUNT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
    make check
fi
make install
