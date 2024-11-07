#----------------------------------------------------------------
# Generated CMake target import file for configuration "MinSizeRel".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "SofaBaseLinearSolver" for configuration "MinSizeRel"
set_property(TARGET SofaBaseLinearSolver APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(SofaBaseLinearSolver PROPERTIES
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/lib/libSofaBaseLinearSolver.24.06.00.dylib"
  IMPORTED_SONAME_MINSIZEREL "@rpath/libSofaBaseLinearSolver.24.06.00.dylib"
  )

list(APPEND _cmake_import_check_targets SofaBaseLinearSolver )
list(APPEND _cmake_import_check_files_for_SofaBaseLinearSolver "${_IMPORT_PREFIX}/lib/libSofaBaseLinearSolver.24.06.00.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
