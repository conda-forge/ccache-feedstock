# cp $BUILD_PREFIX/share/gnuconfig/config.* .

mkdir build
cd build

cmake -GNinja ^
    %CMAKE_ARGS% ^
    %SRC_DIR% ^
    -DHAVE_CXX_ATOMICS64_WITHOUT_LIB=True ^
    -DHAVE_CXX_ATOMICS_WITHOUT_LIB=True

ninja
ninja install
