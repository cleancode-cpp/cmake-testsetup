@echo off

:: default arguments:
::   script/test_cmake.bat msvc2019 debug
if "%~1"=="" (
  set ConfigPreset=msvc2019
) else (
  set ConfigPreset=%1
)
if "%~2"=="" (
  set Config=debug
) else (
  set Config=%2
)
set "BuildPreset=%ConfigPreset%-%Config%"
set "TestPreset=test-%BuildPreset%"

set "BUILD_PATH=out/build/%ConfigPreset%"

pushd "%~dp0.."
if not exist "%BUILD_PATH%/compile_commands.json" (
  cmake -S . --preset "%ConfigPreset%"
)
cmake --build --preset "%BuildPreset%"

set GTEST_COLOR=1
ctest --preset "%TestPreset%"

popd
