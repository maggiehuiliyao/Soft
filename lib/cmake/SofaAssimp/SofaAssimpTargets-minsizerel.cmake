#----------------------------------------------------------------
# Generated CMake target import file for configuration "MinSizeRel".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "SofaAssimp" for configuration "MinSizeRel"
set_property(TARGET SofaAssimp APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(SofaAssimp PROPERTIES
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/lib/libSofaAssimp.0.2.dylib"
  IMPORTED_SONAME_MINSIZEREL "@rpath/libSofaAssimp.0.2.dylib"
  )

list(APPEND _cmake_import_check_targets SofaAssimp )
list(APPEND _cmake_import_check_files_for_SofaAssimp "${_IMPORT_PREFIX}/lib/libSofaAssimp.0.2.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
