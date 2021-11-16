@echo off

PROJECT=basesetup
IMAGE="arbmind/cmake-gcc11:latest"
BUILD_VOLUME="${PROJECT}-cmake-build"

pushd "$(dirname "${BASH_SOURCE[0]}")/.." > /dev/null

docker run -it --rm --mount src="$(pwd)",target=/project,type=bind -w /project --mount src=${BUILD_VOLUME},target=/project/out/build,type=volume ${IMAGE} $*

popd >/dev/null
