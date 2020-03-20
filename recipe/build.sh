#!/bin/bash

./ccache.ccache/configure --prefix=$PREFIX
make -j${CPU_COUNT}
make check
make install
