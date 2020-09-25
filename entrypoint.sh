#!/bin/bash -xe

. /opt/raspberrypi/cc-selector.sh $1

export CC_target=$CC
export CXX_target=$CXX

echo "Compiling with GCC $gcc_version"

$CC --version
JOBS=$(getconf _NPROCESSORS_ONLN)

JOBS=$JOBS CONFIG_FLAGS="$CONFIG_FLAGS --dest-cpu=arm" make build-ci -j$JOBS
