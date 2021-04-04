cmake_minimum_required(VERSION 3.17.5)
project(magnesium)
set(EXECUTABLE_NAME mg)
set(CMAKE_CXX_STANDARD 20)

file(GLOB_RECURSE SOURCE_FILES src/**)

add_executable(${EXECUTABLE_NAME} ${SOURCE_FILES})