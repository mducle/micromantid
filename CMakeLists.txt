cmake_minimum_required (VERSION 3.30)
project(micromantid)
#set(CMAKE_VERBOSE_MAKEFILE ON)
#set(CMAKE_BUILD_TYPE Debug)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
set(CMAKE_MACOSX_RPATH TRUE)
set(CMAKE_CXX_STANDARD 20)
set(CXX_STANDARD_REQUIRED 20)
cmake_policy(SET CMP0167 NEW)
cmake_policy(SET CMP0148 OLD)  # New policy gives error when cannot find shared libs

set(MICROMANTID_PYTHON_MODULE _micromantid)
set(MICROMANTID_PACKAGE_NAME micromantid)

if (DEFINED ENV{CONDA_PREFIX})
    message(STATUS "Searching $ENV{CONDA_PREFIX} for Pybind11, Boost and Eigen")
    file(GLOB pybind11_search $ENV{CONDA_PREFIX}/share/cmake/pybind11/pybind11Config.cmake)
    if (NOT pybind11_search STREQUAL "")
        cmake_path(GET pybind11_search PARENT_PATH pybind11_DIR)
    endif()
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
endif()

if (EMSCRIPTEN)
    message(STATUS "Emscripten detected - setting Pybind to use cross-compiler")
    set(PYBIND11_USE_CROSSCOMPILING TRUE)
    #set(Boost_USE_STATIC_LIBS ON)
    set(Boost_USE_MULTITHREADED OFF)
endif()

find_package(Python COMPONENTS NumPy)
find_package(pybind11 CONFIG)
find_package(Boost COMPONENTS python REQUIRED)
find_package(Poco REQUIRED Foundation XML Util)
find_package(jsoncpp)
find_package(ZLIB)
find_package(HDF5 COMPONENTS C CXX)
find_package(Eigen3)
find_package(muparser)

if (EMSCRIPTEN)
    # We can't use the provided Poco::Foundation label as it uses dynamic linking
    file(GLOB poco_search ${Poco_DIR}/../../libPocoFoundation.so.110)
    if (poco_search STREQUAL "")
        message(FATAL_ERROR "libPocoFoundation.a not found - please build and install Poco")
    endif()
    set(POCOLIBS
        ${Poco_DIR}/../../libPocoFoundation.so.110
        ${Poco_DIR}/../../libPocoXML.so.110
        ${Poco_DIR}/../../libPocoUtil.so.110
        ${Poco_DIR}/../../libPocoJSON.so.110
    )
    set(JSON_LIBS $ENV{EMSDK}/upstream/emscripten/cache/sysroot/lib/libjsoncpp.a)
    set(MUPARSER_LIBS $ENV{EMSDK}/upstream/emscripten/cache/sysroot/lib/libmuparser.a)
    set(GSL_LIBS
        $ENV{EMSDK}/upstream/emscripten/cache/sysroot/lib/libgsl.a
        $ENV{EMSDK}/upstream/emscripten/cache/sysroot/lib/libgslcblas.a)
    file(GLOB LIBBOOSTPYTHON $ENV{EMSDK}/upstream/emscripten/cache/sysroot/lib/libboost_python*.so.*)
    if (LIBBOOSTPYTHON STREQUAL "")
        message(FATAL_ERROR "libboost_python.so not found - please build and install Boost::Python")
    endif()
else()
    set(POCOLIBS Poco::Foundation Poco::XML Poco::Util)
    set(JSON_LIBS jsoncpp)
    set(MUPARSER_LIBS muparser)
    set(GSL_LIBS gsl)
endif()

# Add the Mantid source files
add_subdirectory(src)

# Adds the bindings library module
add_library(${MICROMANTID_PYTHON_MODULE} MODULE micromantid.cpp)
set_target_properties(${MICROMANTID_PYTHON_MODULE} PROPERTIES
    PREFIX ""
    POSITION_INDEPENDENT_CODE ON
)
target_include_directories(${MICROMANTID_PYTHON_MODULE} PUBLIC
    ${Boost_INCLUDE_DIRS}
    ${Python_INCLUDE_DIRS}
    ${Python_NumPy_INCLUDE_DIRS}
)
target_link_libraries(${MICROMANTID_PYTHON_MODULE} PUBLIC
    ${MICROMANTID_CXX_LIBRARIES}
    Boost::python
    ${POCOLIBS}
    ${HDF5_LIBRARIES}
    ${JSON_LIBS}
    ${MUPARSER_LIBS}
    ${GSL_LIBS}
)

# Destination name must match name of project in pyproject.toml
install(TARGETS ${MICROMANTID_PYTHON_MODULE} DESTINATION ${MICROMANTID_PACKAGE_NAME})

# Copies Python source files to make wheel
install(FILES 
    ${CMAKE_CURRENT_SOURCE_DIR}/mantid/instrument/Facilities.xml
    ${CMAKE_CURRENT_SOURCE_DIR}/mantid/Framework/PythonInterface/mantid/simpleapi.py
    ${CMAKE_CURRENT_SOURCE_DIR}/mantid/Framework/PythonInterface/mantid/fitfunctions.py
    ${LIBBOOSTPYTHON}
    ${POCOLIBS}
    DESTINATION ${MICROMANTID_PACKAGE_NAME})

install(FILES 
    ${CMAKE_CURRENT_SOURCE_DIR}/mantid/Framework/PythonInterface/mantid/kernel/funcinspect.py
    ${CMAKE_CURRENT_SOURCE_DIR}/mantid/Framework/PythonInterface/mantid/kernel/AmendConfig.py
    ${CMAKE_CURRENT_SOURCE_DIR}/mantid/Framework/PythonInterface/mantid/kernel/plugins.py
    DESTINATION ${MICROMANTID_PACKAGE_NAME}/kernel)

install(FILES 
    ${CMAKE_CURRENT_SOURCE_DIR}/mantid/Framework/PythonInterface/mantid/api/_workspaceops.py
    ${CMAKE_CURRENT_SOURCE_DIR}/mantid/Framework/PythonInterface/mantid/api/_adsimports.py
    DESTINATION ${MICROMANTID_PACKAGE_NAME}/api)

install(FILES 
    ${CMAKE_CURRENT_SOURCE_DIR}/mantid/Framework/PythonInterface/plugins/algorithms/CreateEmptyTableWorkspace.py
    ${CMAKE_CURRENT_SOURCE_DIR}/mantid/Framework/PythonInterface/plugins/algorithms/CalculateSampleTransmission.py
    ${CMAKE_CURRENT_SOURCE_DIR}/mantid/Framework/PythonInterface/plugins/algorithms/LoadCIF.py
    DESTINATION ${MICROMANTID_PACKAGE_NAME}/plugins/python/algorithms)
