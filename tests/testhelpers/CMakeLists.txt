cmake_minimum_required (VERSION 3.30)
project(testhelpers)
#set(CMAKE_VERBOSE_MAKEFILE ON)
#set(CMAKE_BUILD_TYPE Debug)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
set(CMAKE_MACOSX_RPATH TRUE)
set(CMAKE_CXX_STANDARD 20)
set(CXX_STANDARD_REQUIRED 20)
cmake_policy(SET CMP0167 NEW)
cmake_policy(SET CMP0148 OLD)  # New policy gives error when cannot find shared libs

set(TESTHELPERS_PYTHON_MODULE WorkspaceCreationHelper)
set(TESTHELPERS_PACKAGE_NAME testhelpers)

if (DEFINED ENV{CONDA_PREFIX})
    message(STATUS "Searching $ENV{CONDA_PREFIX} for Boost, Eigen and GMock")
    file(GLOB boost_search $ENV{CONDA_PREFIX}/lib/cmake/Boost-*/BoostConfig.cmake)
    if (NOT boost_search STREQUAL "")
        cmake_path(GET boost_search PARENT_PATH Boost_DIR)
        string(REGEX MATCH "-[0-9]\.[0-9\.]*" boost_version ${Boost_DIR})
        string(CONCAT boost_headers_DIR "$ENV{CONDA_PREFIX}/lib/cmake/boost_headers" ${boost_version})
    endif()
    file(GLOB eigen_search $ENV{CONDA_PREFIX}/share/eigen3/cmake/Eigen3Config.cmake)
    if (NOT eigen_search STREQUAL "")
        cmake_path(GET eigen_search PARENT_PATH Eigen3_DIR)
    endif()
    file(GLOB gtest_search $ENV{CONDA_PREFIX}/include/gmock/gmock.h)
    if (NOT gtest_search STREQUAL "")
        cmake_path(GET gtest_search PARENT_PATH gmock_path)
        cmake_path(GET gmock_path PARENT_PATH GTEST_INCLUDE_DIRS)
    endif()
endif()

if (EMSCRIPTEN)
    message(STATUS "Emscripten detected - setting Boost::Python to use static")
    set(Boost_USE_STATIC_LIBS ON)
    set(Boost_USE_MULTITHREADED OFF)
endif()

find_package(Python COMPONENTS NumPy)
find_package(Boost COMPONENTS python REQUIRED)
find_package(Eigen3)
find_package(GTest)

if (EMSCRIPTEN)
    # We can't use the provided Boost::python label as it uses dynamic linking
    file(GLOB BOOSTPYTHON $ENV{EMSDK}/upstream/emscripten/cache/sysroot/lib/libboost_python*.a)
    if (BOOSTPYTHON STREQUAL "")
        message(FATAL_ERROR "libboost_python.a not found - please build and install Boost::Python")
    endif()
else()
    set(BOOSTPYTHON Boost::python)
endif()

# Need to link to the main Mantid Framework libraries, so get it from the wheel
file(GLOB MAINWHEEL ../../dist/micromantid-*whl)
add_custom_target(FrameworkLib
    COMMAND ${CMAKE_COMMAND}
        -D MAINWHEEL=${MAINWHEEL}
        -D CURRENT_BINARY_DIR=${CMAKE_CURRENT_BINARY_DIR}
        -P ${CMAKE_CURRENT_SOURCE_DIR}/extract_framework.cmake
)

# Add the source files
set(TESTHELP_DIR ../../mantid/Framework/PythonInterface/test/testhelpers)
set(FRAMEWORK_DIR ../../mantid/Framework)
set(SRC_FILES
    ${TESTHELP_DIR}/WorkspaceCreationHelper/WorkspaceCreationHelperModule.cpp
    ${FRAMEWORK_DIR}/TestHelpers/src/ComponentCreationHelper.cpp
    ${FRAMEWORK_DIR}/TestHelpers/src/MDEventsTestHelper.cpp
    ${FRAMEWORK_DIR}/TestHelpers/src/InstrumentCreationHelper.cpp
    ${FRAMEWORK_DIR}/TestHelpers/src/WorkspaceCreationHelper.cpp
)
set(INC_FILES ${FRAMEWORK_DIR}/TestHelpers/inc/MantidFrameworkTestHelpers/WorkspaceCreationHelper.h)

# Adds the bindings library module
add_library(${TESTHELPERS_PYTHON_MODULE} MODULE ${SRC_FILES} ${INC_FILES})
set_target_properties(${TESTHELPERS_PYTHON_MODULE} PROPERTIES
    PREFIX ""
    POSITION_INDEPENDENT_CODE ON
)
add_dependencies(${TESTHELPERS_PYTHON_MODULE} FrameworkLib)
target_include_directories(${TESTHELPERS_PYTHON_MODULE} PUBLIC
    ../../inc
    ${FRAMEWORK_DIR}/TestHelpers/inc
    ${FRAMEWORK_DIR}/API/inc
    ${FRAMEWORK_DIR}/DataObjects/inc
    ${FRAMEWORK_DIR}/Kernel/inc
    ${FRAMEWORK_DIR}/Geometry/inc
    ${FRAMEWORK_DIR}/HistogramData/inc
    ${FRAMEWORK_DIR}/Indexing/inc
    ${FRAMEWORK_DIR}/Nexus/inc
    ${FRAMEWORK_DIR}/Types/inc
    ${FRAMEWORK_DIR}/PythonInterface/core/inc
    ${EIGEN3_INCLUDE_DIR}
    ${Boost_INCLUDE_DIRS}
    ${Python_INCLUDE_DIRS}
    ${Python_NumPy_INCLUDE_DIRS}
    ${GTEST_INCLUDE_DIRS}
)
target_link_libraries(${TESTHELPERS_PYTHON_MODULE} PUBLIC
    ${BOOSTPYTHON}
    ${CMAKE_CURRENT_BINARY_DIR}/_micromantid.so
)

# Destination name must match name of project in pyproject.toml
install(TARGETS ${TESTHELPERS_PYTHON_MODULE} DESTINATION ${TESTHELPERS_PACKAGE_NAME})

# Copies the Python files needed for the wheel
install(FILES
    ${TESTHELP_DIR}/__init__.py
    ${TESTHELP_DIR}/algorithm_decorator.py
    ${TESTHELP_DIR}/illhelpers.py
    ${TESTHELP_DIR}/mlzhelpers.py
    ${TESTHELP_DIR}/tempfile_wrapper.py
    ${TESTHELP_DIR}/testrunner.py
    DESTINATION ${TESTHELPERS_PACKAGE_NAME}
)
