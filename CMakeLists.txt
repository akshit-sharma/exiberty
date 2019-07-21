cmake_minimum_required(VERSION 3.8)

project(ex-iberty)

include(ExternalProject)
ExternalProject_Add(libiberty
  SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libiberty
  CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/libiberty/configure
  BUILD_COMMAND ${MAKE}
  )

