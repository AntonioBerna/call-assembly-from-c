#!/bin/sh

# set -xe

CFLAGS="-Wall -Wextra -Werror"

mkdir -p ./build/

if [ "$1" = "intel" ]; then
    gcc $CFLAGS src/calculator.c src/intel.s -o build/intel-calculator -z noexecstack -I./include/
    echo "Build intel-calculator"
elif [ "$1" = "ATT" ]; then
    gcc $CFLAGS src/calculator.c src/ATT.s -o build/ATT-calculator -z noexecstack -I./include/
    echo "Build ATT-calculator"
elif [ "$1" = "arm" ]; then
    gcc $CFLAGS src/calculator.c src/armv8-a.s -march="armv8-a" -o build/arm-calculator -z noexecstack -I./include/
    echo "Build arm-calculator"
elif [ "$1" = "clean" ]; then
    rm build/*
    echo "Cleaned"
else
    echo "Usage: $0 [intel|ATT|arm]"
    exit 1
fi
