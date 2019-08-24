cmake_minimum_required(VERSION 3.11)

project(GCC_EXTRACT)

message(STATUS "value is ${CMAKE_CURRENT_BINARY_DIR}/libiberty") 

if (TARGET GCC_EXTRACT::iberty)
  return()
endif()

# execute_process(
#   COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/libiberty/configure --prefix=${CMAKE_CURRENT_BINARY_DIR}/libiberty
#   WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
#   RESULT_VARIABLE CONFIG_RESULT
#   )
#
# if (NOT CONFIG_RESULT EQUAL "0")
#   message(FATAL_ERROR "${CMAKE_CURRENT_SOURCE_DIR}/libiberty/configure --prefix=${CMAKE_CURRENT_BINARY_DIR}/libiberty in WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR} failed with ${CONFIG_RESULT}")
# endif()
#
# execute_process(COMMAND make
#   WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
#   RESULT_VARIABLE MAKE_RESULT
#   )
#
# if (NOT MAKE_RESULT EQUAL "0")
#   message(FATAL_ERROR "make in WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR} failed with ${CONFIG_RESULT}")
# endif()


include(ExternalProject)
ExternalProject_Add(GCC_EXTRACTED_IBERTY
  SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}
  BINARY_DIR ${CMAKE_CURRENT_SOURCE_DIR}
  CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/build.sh
  # UPDATE_COMMAND echo "1" #  ${CMAKE_CURRENT_SOURCE_DIR}/libiberty/configure --prefix=${CMAKE_CURRENT_BINARY_DIR}/libiberty
  # CONFIGURE_COMMAND echo "hello" # ${MAKE} -C ${CMAKE_CURRENT_BINARY_DIR}
  # CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/libiberty/configure --prefix=${CMAKE_CURRENT_BINARY_DIR}/libiberty
  # BUILD_COMMAND ${MAKE} -C ${CMAKE_CURRENT_BINARY_DIR}
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
) 

# add_library(GCC_EXTRACT::iberty UNKNOWN IMPORTED)
# add_executable(GCC_EXTRACT libiberty/dummy.cpp)
#
# add_dependencies(GCC_EXTRACT GCC_EXTRACTED_IBERTY)
#
# include(FindPackageHandleStandardArgs)
# find_path(GCC_IBERTY_INCLUDE_DIRS libiberty.h
#   HINTS ${CMAKE_CURRENT_SOURCE_DIR}/include)
# find_library(GCC_IBERTY_LIBRARY iberty
#   HINTS ${CMAKE_CURRENT_BINARY_DIR}) # ${CMAKE_CURRENT_BINARY_DIR}/.../src/.../libiberty.a)
# find_package_handle_standard_args(GCC_EXTRACT::iberty
#   REQUIRED_VARS GCC_IBERTY_INCLUDE_DIRS GCC_IBERTY_LIBRARY)
#
# message(STATUS "Value of include and libs ${GCC_IBERTY_INCLUDE_DIRS} and ${GCC_IBERTY_LIBRARY} " )
#
#
# set_target_properties(GCC_EXTRACT::iberty PROPERTIES
#   IMPORTED_LOCATION             ${GCC_IBERTY_LIBRARY}
#   INTERFACE_INCLUDE_DIRECTORIES ${GCC_IBERTY_INCLUDE_DIRS})


