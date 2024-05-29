#!/bin/sh

# set -xe

CFLAGS="-Wall -Wextra -Werror"

if [ "$1" = "intel" ]; then
    gcc $CFLAGS src/calculator.c src/intel.s -o build/intel-calculator -z noexecstack -I./include/
    echo "Build intel-calculator"
elif [ "$1" = "ATT" ]; then
    gcc $CFLAGS src/calculator.c src/ATT.s -o build/ATT-calculator -z noexecstack -I./include/
    echo "Build ATT-calculator"
elif [ "$1" = "clean" ]; then
    rm build/*
    echo "Cleaned"
else
    echo "Usage: $0 [intel|ATT]"
    exit 1
fi
