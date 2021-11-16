@echo off

set "PROJECT=basesetup"
set "IMAGE=arbmind/cmake-gcc11:latest"
set "BUILD_VOLUME=%PROJECT%-cmake-build"

pushd "%~dp0.."
docker run -it --rm --mount src="%cd%",target=/project,type=bind -w /project --mount src=%BUILD_VOLUME%,target=/project/out/build,type=volume %IMAGE% %*
popd
