#----------------------------------------------------------------
# Generated CMake target import file for configuration "MinSizeRel".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "SofaFramework" for configuration "MinSizeRel"
set_property(TARGET SofaFramework APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(SofaFramework PROPERTIES
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/lib/libSofaFramework.24.06.00.dylib"
  IMPORTED_SONAME_MINSIZEREL "@rpath/libSofaFramework.24.06.00.dylib"
  )

list(APPEND _cmake_import_check_targets SofaFramework )
list(APPEND _cmake_import_check_files_for_SofaFramework "${_IMPORT_PREFIX}/lib/libSofaFramework.24.06.00.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
