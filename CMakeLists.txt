cmake_minimum_required(VERSION 3.20)
project(magnesium)
set(EXECUTABLE_NAME mg)
set(CMAKE_CXX_STANDARD 20)

file(GLOB SOURCE_FILES src/**)

add_executable(${EXECUTABLE_NAME} ${SOURCE_FILES})
