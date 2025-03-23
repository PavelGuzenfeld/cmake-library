cmake_minimum_required(VERSION 3.20)
project(cmake-library)

# Handle "Manually-specified variables were not used by the project" warning.
unset(CATKIN_INSTALL_INTO_PREFIX_ROOT)

# Include helper functions for package configuration.
include(CMakePackageConfigHelpers)

# Configure the package configuration file from the template.
configure_package_config_file(
  "${CMAKE_CURRENT_SOURCE_DIR}/cmake-libraryConfig.cmake.in"  # input template
  "${CMAKE_CURRENT_BINARY_DIR}/cmake-libraryConfig.cmake"      # output file
  INSTALL_DESTINATION lib/cmake/cmake-library                  # install destination
  NO_SET_AND_CHECK_MACRO
  NO_CHECK_REQUIRED_COMPONENTS_MACRO
)

# Install the module and the generated configuration files.
install(
  FILES
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake-library.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/cmake-libraryConfig.cmake"
  DESTINATION lib/cmake/cmake-library
)
