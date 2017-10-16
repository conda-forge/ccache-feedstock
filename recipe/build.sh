#!/usr/bin/env bash
if [[ $(uname -o) == "Msys" ]]; then
  ./configure --prefix=$PREFIX \
              LD=link \
              CXXCPP="cl -nologo -EP" \
              CPP="cl -nologo -EP" \
              --build=x86_64-w64-mingw32 \
              --enable-static --disable-shared
  EXEEXT=.exe
else
  ./configure --prefix="${PREFIX}" --includedir="${PREFIX}/include"
  EXEEXT=
fi

# build the minimum ccache binary
make ccache$EXEEXT
make install

# hack to force including ccache on the conda environment search path in windows
cp ccache$EXEEXT "${PREFIX}/ccache$EXEEXT"
