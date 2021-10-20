# cp $BUILD_PREFIX/share/gnuconfig/config.* .

mkdir build
cd build

cmake -GNinja ^
    %CMAKE_ARGS% ^
    %SRC_DIR% ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%

ninja
ninja check
ninja install
