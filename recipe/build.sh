#!/bin/bash
mkdir build
cd build

if [ "$target_platform" = "osx-64" ]; then
    CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
fi

cmake \
    ${CMAKE_ARGS} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DENABLE_TESTING=OFF \
    -GNinja \
    ${SRC_DIR}

ninja
ninja install
