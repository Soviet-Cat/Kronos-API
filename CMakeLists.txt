# Define CMake minimum version
cmake_minimum_required(VERSION 3.20)

# Define project
project(KronosAPI
    LANGUAGES CXX
    VERSION 1.0
)

# Define language standards
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Define library
add_library(KronosAPI SHARED
    ${CMAKE_CURRENT_SOURCE_DIR}/src/test.cpp
)
set_target_properties(KronosAPI
    PROPERTIES
        OUTPUT_NAME "KronosAPI"
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin
        LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/lib
        ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/lib
)
target_compile_definitions(KronosAPI
    PRIVATE
        KAPI_EXPORT
)
target_include_directories(KronosAPI
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src
)

# Define build installation rules
install(
    TARGETS KronosAPI
    EXPORT KronosAPITargets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)

# Define header installation rules
install(
    DIRECTORY include/
    DESTINATION include/KronosAPI
    FILES_MATCHING PATTERN "*.hpp"
)

# Include CMake config helpers
include(
    CMakePackageConfigHelpers
)

# Generate version config file
write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/KronosAPIConfigVersion.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
)

# Generate package config file
configure_package_config_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/Config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/KronosAPIConfig.cmake
    INSTALL_DESTINATION lib/cmake/KronosAPI
)

# Install config files
install(
    FILES
    ${CMAKE_CURRENT_BINARY_DIR}/KronosAPIConfig.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/KronosAPIConfigVersion.cmake
    DESTINATION lib/cmake/KronosAPI
)

# Export targets
install(
    EXPORT KronosAPITargets
    FILE KronosAPITargets.cmake
    NAMESPACE KronosAPI::
    DESTINATION lib/cmake/KronosAPI
)

# Cache necessary variables
set(PROJECT_VERSION ${PROJECT_VERSION} CACHE STRING "Project version")
set(CMAKE_SYSTEM_NAME ${CMAKE_SYSTEM_NAME} CACHE STRING "CMake system name")
set(CMAKE_SYSTEM_PROCESSOR ${CMAKE_SYSTEM_PROCESSOR} CACHE STRING "CMake system processor")
set(CMAKE_BUILD_TYPE ${CMAKE_BUILD_TYPE} CACHE STRING "CMake build type")