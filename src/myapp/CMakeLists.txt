
add_executable(myapp
  "MyApp.cpp"
)
target_link_libraries(myapp
  PRIVATE mylib
)
target_compile_definitions(myapp
  PRIVATE VERSION="${PROJECT_VERSION}"
)
