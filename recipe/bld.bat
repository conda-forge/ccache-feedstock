# cp $BUILD_PREFIX/share/gnuconfig/config.* .

mkdir build
cd build

cmake -GNinja ^
    %CMAKE_ARGS% ^
    %SRC_DIR% ^
    -DHIREDIS_FROM_INTERNET=OFF ^
    -DZSTD_FROM_INTERNET=OFF ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DENABLE_TESTING=OFF

ninja
ninja install
