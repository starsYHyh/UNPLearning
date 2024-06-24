cmake_minimum_required(VERSION 2.8.3)

project(INTRO)

aux_source_directory(../lib LIBSRC)

include_directories(../lib)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

set(SRC ${PROJECT_SOURCE_DIR}/src)

set(CMAKE_BUILD_TYPE "Debug")

add_executable(DAYTIMECPCLI
    ${LIBSRC}
    ${SRC}/daytimetcpcli.c
)