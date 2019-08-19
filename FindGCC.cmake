if (TARGET GCC::iberty)
  return()
endif()

include(FindPackageHandleStandardArgs)
find_path(GCC_IBERTY_INCLUDE_DIRS include/libiberty.h)
find_library(GCC_IBERTY_LIBRARY iberty) # ${CMAKE_CURRENT_BINARY_DIR}/.../src/.../libiberty.a)
find_package_handle_standard_args(GCC::iberty
  REQUIRED_VARS GCC_IBERTY_DIRS GCC_IBERTY_LIBRARY)
add_library(GCC::iberty UNKOWN IMPORTED)
set_target_properties(GCC::iberty PROPERTIES
  IMPORTED_LOCATION             ${GCC_IBERTY_LIBRARY}
  INTERFACE_INCLUDE_DIRECTORIES ${GCC_IBERTY_INCLUDE_DIRS})

