#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "KronosAPI::KronosAPI" for configuration "Release"
set_property(TARGET KronosAPI::KronosAPI APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(KronosAPI::KronosAPI PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/libKronosAPI.dll.a"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/libKronosAPI.dll"
  )

list(APPEND _cmake_import_check_targets KronosAPI::KronosAPI )
list(APPEND _cmake_import_check_files_for_KronosAPI::KronosAPI "${_IMPORT_PREFIX}/lib/libKronosAPI.dll.a" "${_IMPORT_PREFIX}/bin/libKronosAPI.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
