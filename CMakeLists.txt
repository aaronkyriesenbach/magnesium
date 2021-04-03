cmake_minimum_required(VERSION 3.20)
project(magnesium)
set(CMAKE_CXX_STANDARD 20)

file(GLOB SOURCE_FILES src/**.cpp)

add_executable(mg ${SOURCE_FILES})