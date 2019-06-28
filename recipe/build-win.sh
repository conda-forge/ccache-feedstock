#!/usr/bin/env bash
./configure --prefix=$PREFIX \
            LD=link \
            CXXCPP="cl -nologo -EP" \
            CPP="cl -nologo -EP" \
            --build=x86_64-w64-mingw32 \
            --enable-static --disable-shared
EXEEXT=.exe

# build the minimum ccache binary
make ccache$EXEEXT
make install

# hack to force including ccache on the conda environment search path in windows
cp ccache$EXEEXT "${PREFIX}/ccache$EXEEXT"
