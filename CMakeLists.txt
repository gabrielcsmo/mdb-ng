cmake_minimum_required(VERSION 3.12)
project(MDB-NG VERSION 0.1.0)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_BUILD_TYPE RELEASE)
set(TARGET mdb-ng)

set(PRJ_CFLAGS "-Wno-write-strings -W -Wall -Wextra -O3 -std=c++20 -fpermissive")
set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g3 ${PRJ_CFLAGS}")
set(CMAKE_CXX_FLAGS_RELEASE "-O3 ${PRJ_CFLAGS}")


include_directories(inc)
file(GLOB SOURCES "src/*.cpp")
    
add_executable(mdb-ng ${SOURCES})

if (UNIX)
    target_sources(${TARGET} PRIVATE "src/linux/dbg.cpp")
    target_link_libraries(${TARGET} "udev")
endif(UNIX)

if (WIN32)
    target_sources(${TARGET} PRIVATE "src/windows/dbg.cpp")
    target_link_libraries(${TARGET} "hid")
    target_link_libraries(${TARGET} "winusb")
    target_link_libraries(${TARGET} "setupapi")
endif(WIN32)

if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    target_sources(${TARGET} PRIVATE "src/osx/dbg.cpp")
    target_link_libraries(${TARGET} "-framework IOKit")
    target_link_libraries(${TARGET} "-framework Foundation")
    target_link_libraries(${TARGET} "-framework CoreFoundation")
    target_link_libraries(${TARGET} "-framework Cocoa")
endif()