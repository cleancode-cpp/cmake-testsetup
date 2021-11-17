#!/bin/bash
set -e # stop on first error

# default arguments:
#   script/test_cmake.sh gcc debug
ConfigPreset=${1:-gcc}
Config=${2:-debug}
BuildPreset="${ConfigPreset}-${Config}"
TestPreset="test-${BuildPreset}"

BUILD_PATH="build/${ConfigPreset}"

pushd "$(dirname "${BASH_SOURCE[0]}")/.." > /dev/null

if [ ! -f "${BUILD_PATH}/compile_commands.json" ] ; then
  cmake -S . --preset "${ConfigPreset}"
fi
cmake --build --preset "${BuildPreset}"
GTEST_COLOR=1 ctest --preset "${TestPreset}"

popd >/dev/null
