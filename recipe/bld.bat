# cp $BUILD_PREFIX/share/gnuconfig/config.* .

mkdir build
cd build

cmake -GNinja ^
    %CMAKE_ARGS% ^
    %SRC_DIR%

ninja
ninja install
