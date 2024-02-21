
add_library(mylib STATIC
    "mylib/MyClass.cpp"
    "mylib/MyClass.h"
)
target_include_directories(mylib PUBLIC .)

# unit tests
add_executable(mylib_tests
    "mylib/MyClass.test.cpp"
    "mylib/MyClass.h"
)
target_link_libraries(mylib_tests
    PRIVATE gtest_main mylib
)
add_test(NAME mylib COMMAND mylib_tests)
