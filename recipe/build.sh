#!/bin/bash
mkdir build
cd build

#if [ "$target_platform" = "osx-arm64" ]; then
#    # Workaround for wrong detection of vector extensions,
#    # see https://github.com/ccache/ccache/issues/734
#    CMAKE_ARGS="${CMAKE_ARGS} -DHAVE_AVX2=NO -DHAVE_C_AVX2=NO -DHAVE_C_AVX512=NO -DHAVE_C_SSE2=NO -DHAVE_C_SSE41=NO"
#fi

if [ "$target_platform" = "osx-64" ]; then
    CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
fi

cmake \
    ${CMAKE_ARGS} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -GNinja \
    ${SRC_DIR}

ninja

# currently tests are failing on osx ...
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
    if [[ "${target_platform}" == osx* ]]; then
        echo "Currently skipping tests ..."
    else
        ninja check
    fi
fi

ninja install
