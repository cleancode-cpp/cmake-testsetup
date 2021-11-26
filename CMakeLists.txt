cmake_minimum_required(VERSION 3.12.0)
project(BaseSetup
  VERSION 1.0.0
  DESCRIPTION "Basic Setup with Googletest"
  LANGUAGES CXX
)

enable_testing()
set(CMAKE_CXX_STANDARD 17)

add_subdirectory(third_party)
add_subdirectory(src)
