
if "%DEBUG_C%" == "" (
  set BT=Release
) else (
  set BT=Debug
)
cmake -GNinja ^
      -DCMAKE_BUILD_TYPE=%BT% ^
      -DCMAKE_VERBOSE_MAKEFILE=ON ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_BIN% ccache.cristianadam
ninja -v install
