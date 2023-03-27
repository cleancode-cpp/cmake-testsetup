# CMake Test Setup

Basic project setup for C++17 with CMake and googletest.

You should successfully checkout, setup and test before the training.

## Checkout with submodules

```
git clone --recurse-submodules https://github.com/cleancode-cpp/cmake-testsetup.git
```

If you forgot to use the submodules option on clone you can do

```
git submodule update --init
```

## Validated build and test environments

### Windows Visual Studio 2019 / 2022

* Please update to the latest version (16.11.7)
* Make sure "Desktop development with C++" is selected in the installer

First build:
* Open the folder in Visual Studio
* Select the "msvc-cl16" preset. The "gcc" default will not work
* CMake generator should run fine
* Build the "CMakeLists.txt" on the top folder

Notes:
* The Visual Studio Test Explorer only works in Visual Studio 2022
* You can only run debug builds from Visual Studio
* The "msbuild-vs16-x64" preset also works but compiles slower.

### Windows VSCode

* Install Visual Studio like above
* Install CMake (>= v3.20)
* Install VSCode CMake Tools extension
* Configure the VSCode extension to use the installed CMake tool

First build:
* Open the folder in VSCode
* Select Configuration "msbuild-vs16-x64"
* Build

Notes:
* Ninja preset "msvc-cl16" only work if Windows SDK is in PATH, otherwise CMake will complain that kernel32 could not be linked.

### Linux GCC

* Install a recent GCC with libstdc++
* Install CMake (>= v3.20)
* Use the editor of your choice (none were validated)

First build:
* run build `script/build_cmake.sh`
* run tests `script/test_cmake.sh`

Notes:
* GCC version 10 or 11 should work fine

### Docker Container with GCC

* Install a Docker / Container runner for your system
   * Docker Desktop and CLI work great (check license)
   * Open source alternatives like `nerdctl` or `podman` also work fine
* Use the editor of your choice (none were validated)

First build:
* run shell in container `script/docker_run_cmake_gcc.sh` or `script\docker_run_cmake_gcc.bat`
* run build `script/build_cmake.sh`
* run tests `script/test_cmake.sh`

## Contributions are welcome

If you like the project feel free to leave a star.
If you have issues with your setup, try to find a colleague to help you out.
If something is wrong with this project or you think I might be able to help, feel free to open an issue.
