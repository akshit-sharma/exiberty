cmake_minimum_required(VERSION 3.11)

project(GCC_EXTRACTED)

include(ExternalProject)
ExternalProject_Add(GCC_EXTRACTED_IBERTY
  SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libiberty 
  CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/libiberty/configure --prefix=${CMAKE_CURRENT_BINARY_DIR}/libiberty
  BUILD_COMMAND ${MAKE}
) 

