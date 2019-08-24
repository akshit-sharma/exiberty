# This is just for getting iberty module from GCC

if (TARGET GCC_EXTRACT::iberty)
  return()
endif()

include(FindPackageHandleStandardArgs)
find_path(GCC_IBERTY_INCLUDE_DIRS libiberty.h
  HINTS ${CMAKE_CURRENT_SOURCE_DIR}/../include 
  )
find_library(GCC_IBERTY_LIBRARY iberty
  HINTS ${CMAKE_CURRENT_SOURCE_DIR}/../libiberty
  ) # ${CMAKE_CURRENT_BINARY_DIR}/.../src/.../libiberty.a)
find_package_handle_standard_args(GCC_EXTRACT::iberty
  REQUIRED_VARS GCC_IBERTY_DIRS GCC_IBERTY_LIBRARY)
add_library(GCC_EXTRACT::iberty UNKOWN IMPORTED)
set_target_properties(GCC_EXTRACT::iberty PROPERTIES
  IMPORTED_LOCATION             ${GCC_IBERTY_LIBRARY}
  INTERFACE_INCLUDE_DIRECTORIES ${GCC_IBERTY_INCLUDE_DIRS})

