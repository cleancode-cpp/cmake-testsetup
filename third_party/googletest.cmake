include(GoogleTest)

find_package(Threads REQUIRED)
set(THREADS_PREFER_PTHREAD_FLAG ON)

if(IS_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/googletest/googletest") # prefer git submodule if available
    message("using submodule googletest")
    set(gtest_SOURCE_DIR "googletest/googletest")
else() # fallback to checkout if submodule is missing
    message("fetching googletest from github.com")
    include(FetchContent)
    FetchContent_Declare(
        googletest
        GIT_REPOSITORY https://github.com/google/googletest.git
        GIT_TAG        release-1.10.0
    )
    FetchContent_GetProperties(googletest)
    if(NOT googletest_POPULATED)
        FetchContent_Populate(googletest)

        set(gtest_SOURCE_DIR "${googletest_SOURCE_DIR}/googletest")
    endif()
endif()

add_library(gtest STATIC
    "${gtest_SOURCE_DIR}/src/gtest-all.cc"
)
target_include_directories(gtest
    PRIVATE "${gtest_SOURCE_DIR}"
    PUBLIC "${gtest_SOURCE_DIR}/include"
)
if(NOT ${CMAKE_USE_PTHREADS_INIT})
    target_compile_definitions(gtest PUBLIC GTEST_HAS_PTHREAD=0)
else()
    target_link_libraries(gtest PRIVATE Threads::Threads)
endif()

add_library(gtest_main STATIC
    "${gtest_SOURCE_DIR}/src/gtest_main.cc"
)
target_link_libraries(gtest_main
    PUBLIC gtest
)
