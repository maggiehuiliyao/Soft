#----------------------------------------------------------------
# Generated CMake target import file for configuration "MinSizeRel".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "SofaEulerianFluid" for configuration "MinSizeRel"
set_property(TARGET SofaEulerianFluid APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(SofaEulerianFluid PROPERTIES
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/lib/libSofaEulerianFluid.1.0.dylib"
  IMPORTED_SONAME_MINSIZEREL "@rpath/libSofaEulerianFluid.1.0.dylib"
  )

list(APPEND _cmake_import_check_targets SofaEulerianFluid )
list(APPEND _cmake_import_check_files_for_SofaEulerianFluid "${_IMPORT_PREFIX}/lib/libSofaEulerianFluid.1.0.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)