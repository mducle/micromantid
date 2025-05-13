cmake_minimum_required (VERSION 3.30)
project(micromantid_tests)

if (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/../dist)
    set(MYBINDIR ${CMAKE_CURRENT_SOURCE_DIR}/../dist)
else()
    set(MYBINDIR ${CMAKE_BINARY_DIR})
endif()

include(ExternalData)
set(ExternalData_URL_TEMPLATES "https://testdata.mantidproject.org/ftp/external-data/%(algo)/%(hash)")
file(GLOB_RECURSE TestDataFiles "test_data/*md5")
foreach(_datafile ${TestDataFiles})
    string(REGEX REPLACE "\\.md5$" "" _datafile ${_datafile})
    ExternalData_Expand_Arguments(TestData link_location DATA{${_datafile}})
endforeach()
ExternalData_Add_Target(TestData)

add_custom_target(TestWheel
    DEPENDS TestData
    COMMAND ${CMAKE_COMMAND} 
        -D CURRENT_SOURCE_DIR=${CMAKE_CURRENT_SOURCE_DIR}
        -D CURRENT_BINARY_DIR=${CMAKE_CURRENT_BINARY_DIR}
        -D BINARY_DIR=${MYBINDIR}
        -P ${CMAKE_CURRENT_SOURCE_DIR}/testwheel.cmake
)
