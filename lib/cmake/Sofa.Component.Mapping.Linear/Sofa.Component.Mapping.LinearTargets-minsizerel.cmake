#----------------------------------------------------------------
# Generated CMake target import file for configuration "MinSizeRel".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Sofa.Component.Mapping.Linear" for configuration "MinSizeRel"
set_property(TARGET Sofa.Component.Mapping.Linear APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(Sofa.Component.Mapping.Linear PROPERTIES
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/lib/libSofa.Component.Mapping.Linear.24.06.00.dylib"
  IMPORTED_SONAME_MINSIZEREL "@rpath/libSofa.Component.Mapping.Linear.24.06.00.dylib"
  )

list(APPEND _cmake_import_check_targets Sofa.Component.Mapping.Linear )
list(APPEND _cmake_import_check_files_for_Sofa.Component.Mapping.Linear "${_IMPORT_PREFIX}/lib/libSofa.Component.Mapping.Linear.24.06.00.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
