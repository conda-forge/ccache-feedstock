#!/usr/bin/env bash
./autogen.sh
./configure --prefix=$PREFIX \
            LD=link \
            CXXCPP="cl -nologo -EP" \
            CPP="cl -nologo -EP" \
            --build=x86_64-w64-mingw32 \
            --enable-static --disable-shared EXEEXT=.exe

# build the minimum ccache binary
make ccache.exe
make install

# hack to force including ccache on the conda environment search path in windows
cp ccache.exe "${PREFIX}/ccache.exe"
