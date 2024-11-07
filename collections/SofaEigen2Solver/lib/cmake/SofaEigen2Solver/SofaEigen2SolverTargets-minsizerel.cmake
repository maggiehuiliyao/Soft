#----------------------------------------------------------------
# Generated CMake target import file for configuration "MinSizeRel".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "SofaEigen2Solver" for configuration "MinSizeRel"
set_property(TARGET SofaEigen2Solver APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(SofaEigen2Solver PROPERTIES
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/lib/libSofaEigen2Solver.24.06.00.dylib"
  IMPORTED_SONAME_MINSIZEREL "@rpath/libSofaEigen2Solver.24.06.00.dylib"
  )

list(APPEND _cmake_import_check_targets SofaEigen2Solver )
list(APPEND _cmake_import_check_files_for_SofaEigen2Solver "${_IMPORT_PREFIX}/lib/libSofaEigen2Solver.24.06.00.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
