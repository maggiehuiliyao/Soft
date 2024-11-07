#----------------------------------------------------------------
# Generated CMake target import file for configuration "MinSizeRel".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "SofaOpenglVisual" for configuration "MinSizeRel"
set_property(TARGET SofaOpenglVisual APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(SofaOpenglVisual PROPERTIES
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/lib/libSofaOpenglVisual.24.06.00.dylib"
  IMPORTED_SONAME_MINSIZEREL "@rpath/libSofaOpenglVisual.24.06.00.dylib"
  )

list(APPEND _cmake_import_check_targets SofaOpenglVisual )
list(APPEND _cmake_import_check_files_for_SofaOpenglVisual "${_IMPORT_PREFIX}/lib/libSofaOpenglVisual.24.06.00.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
