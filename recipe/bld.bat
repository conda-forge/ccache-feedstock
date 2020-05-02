
:: if "%DEBUG_C%" == "" (
::   set BT=Release
:: ) else (
::   set BT=Debug
:: )
:: cmake -GNinja ^
::       -DCMAKE_BUILD_TYPE=%BT% ^
::       -DCMAKE_VERBOSE_MAKEFILE=ON ^
::       -DCMAKE_INSTALL_PREFIX=%LIBRARY_BIN% ccache.christianadam
:: ninja -v install

copy "%RECIPE_DIR%\build.sh" .
FOR /F "delims=" %%i IN ('cygpath.exe -u "%LIBRARY_PREFIX%"') DO set "LIBRARY_PREFIX=%%i"
FOR /F "delims=" %%i IN ('cygpath.exe -u "%PREFIX%"') DO set "PREFIX=%%i"
FOR /F "delims=" %%i IN ('cygpath.exe -u "%PYTHON%"') DO set "PYTHON=%%i"
FOR /F "delims=" %%i IN ('cygpath.exe -u "%RECIPE_DIR%"') DO set "RECIPE_DIR=%%i"
FOR /F "delims=" %%i IN ('cygpath.exe -u "%SP_DIR%"') DO set "SP_DIR=%%i"
FOR /F "delims=" %%i IN ('cygpath.exe -u "%SRC_DIR%"') DO set "SRC_DIR=%%i"
FOR /F "delims=" %%i IN ('cygpath.exe -u "%STDLIB_DIR%"') DO set "STDLIB_DIR=%%i"
set MSYSTEM=MINGW%ARCH%
set MSYS2_PATH_TYPE=inherit
set CHERE_INVOKING=1
bash -lc ./build.sh
if errorlevel 1 exit 1
exit 0
