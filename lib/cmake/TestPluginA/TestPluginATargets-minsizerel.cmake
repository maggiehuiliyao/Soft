#----------------------------------------------------------------
# Generated CMake target import file for configuration "MinSizeRel".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "TestPluginA" for configuration "MinSizeRel"
set_property(TARGET TestPluginA APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(TestPluginA PROPERTIES
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/lib/libTestPluginA.0.7.dylib"
  IMPORTED_SONAME_MINSIZEREL "@rpath/libTestPluginA.0.7.dylib"
  )

list(APPEND _cmake_import_check_targets TestPluginA )
list(APPEND _cmake_import_check_files_for_TestPluginA "${_IMPORT_PREFIX}/lib/libTestPluginA.0.7.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)