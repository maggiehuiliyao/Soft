#----------------------------------------------------------------
# Generated CMake target import file for configuration "MinSizeRel".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "SofaLoader" for configuration "MinSizeRel"
set_property(TARGET SofaLoader APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(SofaLoader PROPERTIES
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/lib/libSofaLoader.24.06.00.dylib"
  IMPORTED_SONAME_MINSIZEREL "@rpath/libSofaLoader.24.06.00.dylib"
  )

list(APPEND _cmake_import_check_targets SofaLoader )
list(APPEND _cmake_import_check_files_for_SofaLoader "${_IMPORT_PREFIX}/lib/libSofaLoader.24.06.00.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)