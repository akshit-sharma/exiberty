cmake_minimum_required(VERSION 3.11)

project(GCC_EXTRACTED.IBERTY 
  VERSION 0.1.0 
  DESCRIPTION "Iberty library extracted from gcc"
  LANGUAGES CXX
  )

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# add_executable(GCC_EXTRACTED.IBERTY IMPORTED)
#
# set_property(TARGET GCC_EXTRACTED.IBERTY PROPERTY IMPORTED ${CMAKE_CURRENT_BINARY_DIR}/libiberty-prefix/src/libiberty-build/libiberty.a)

# set(GENERATED_SRC ${CMAKE_CURRENT_BINARY_DIR}/libiberty/dummy.cpp)
# add_custom_command(
#   OUTPUT ${GENERATED_SRC}
#   COMMAND 
#   )

include(ExternalProject)
ExternalProject_Add(libiberty
  SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libiberty
  CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/libiberty/configure --prefix=${CMAKE_CURRENT_BINARY_DIR}/libiberty
  BUILD_COMMAND ${MAKE}
  )

add_library(GCC_EXTRACTED.IBERTY STATIC IMPORTED)

set_property(TARGET GCC_EXTRACTED.IBERTY PROPERTY IMPORTED_LOCATION ${CMAKE_CURRENT_BINARY_DIR}/libiberty-prefix/src/libiberty-build/libiberty.a)

set_target_properties(GCC_EXTRACTED.IBERTY PROPERTIES IMPORTED_GLOBAL TRUE)

add_library(GCC_EXTRACTED::IBERTY ALIAS GCC_EXTRACTED.IBERTY)

#
# add_library(GCC_EXTRACTED.IBERTY OBJECT)
#
# target_sources(GCC_EXTRACTED.IBERTY PRIVATE libiberty/dummy.cpp )
#
# target_include_directories(GCC_EXTRACTED.IBERTY SYSTEM PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
# target_link_libraries(GCC_EXTRACTED.IBERTY PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/libiberty-prefix/src/libiberty-build/libiberty.a)
#
# # set_target_properties(GCC_EXTRACTED.IBERTY PROPERTIES IMPORTED_ TRUE)
#
# add_custom_command(TARGET GCC_EXTRACTED.IBERTY
#   PRE_BUILD
#   COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/libiberty/configure --prefix=${CMAKE_CURRENT_BINARY_DIR}/libiberty)
#
# add_custom_command(TARGET GCC_EXTRACTED.IBERTY
#   PRE_LINK
#   COMMAND ${MAKE})
#
#
# add_library(GCC_EXTRACTED::IBERTY ALIAS GCC_EXTRACTED.IBERTY)

