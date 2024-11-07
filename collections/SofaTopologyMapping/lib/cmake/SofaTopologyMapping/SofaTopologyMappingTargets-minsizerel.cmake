#----------------------------------------------------------------
# Generated CMake target import file for configuration "MinSizeRel".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "SofaTopologyMapping" for configuration "MinSizeRel"
set_property(TARGET SofaTopologyMapping APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(SofaTopologyMapping PROPERTIES
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/lib/libSofaTopologyMapping.24.06.00.dylib"
  IMPORTED_SONAME_MINSIZEREL "@rpath/libSofaTopologyMapping.24.06.00.dylib"
  )

list(APPEND _cmake_import_check_targets SofaTopologyMapping )
list(APPEND _cmake_import_check_files_for_SofaTopologyMapping "${_IMPORT_PREFIX}/lib/libSofaTopologyMapping.24.06.00.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
