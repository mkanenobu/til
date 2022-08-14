cmake_minimum_required(VERSION 3.23.2)

set(PROJECT_NAME "example")

project(${PROJECT_NAME})
enable_language(CXX)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(SRCS
        main.cpp
        stack.hpp
        )

add_executable(a.out ${SRCS})
