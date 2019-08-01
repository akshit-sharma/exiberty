cmake_minimum_required(VERSION 3.11)

project(ex-iberty)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include(ExternalProject)
ExternalProject_Add(libiberty
  SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libiberty
  CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/libiberty/configure --prefix=${CMAKE_CURRENT_BINARY_DIR}/libiberty
  BUILD_COMMAND ${MAKE}
  )

add_executable(ex-iberty src/main.cpp)

target_include_directories(ex-iberty PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_link_libraries(ex-iberty PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/libiberty-prefix/src/libiberty-build/libiberty.a)


