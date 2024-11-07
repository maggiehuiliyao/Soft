#----------------------------------------------------------------
# Generated CMake target import file for configuration "MinSizeRel".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "SofaDefaultType" for configuration "MinSizeRel"
set_property(TARGET SofaDefaultType APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(SofaDefaultType PROPERTIES
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/lib/libSofaDefaultType.24.06.00.dylib"
  IMPORTED_SONAME_MINSIZEREL "@rpath/libSofaDefaultType.24.06.00.dylib"
  )

list(APPEND _cmake_import_check_targets SofaDefaultType )
list(APPEND _cmake_import_check_files_for_SofaDefaultType "${_IMPORT_PREFIX}/lib/libSofaDefaultType.24.06.00.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
