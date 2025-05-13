cmake_minimum_required (VERSION 3.30)
project(mantid_instruments)

if (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/../dist)
    set(MYBINDIR ${CMAKE_CURRENT_SOURCE_DIR}/../dist)
else()
    set(MYBINDIR ${CMAKE_BINARY_DIR})
endif()

add_custom_target(InstrumentWheel
    COMMAND ${CMAKE_COMMAND} 
        -D CURRENT_SOURCE_DIR=${CMAKE_CURRENT_SOURCE_DIR}
        -D CURRENT_BINARY_DIR=${CMAKE_CURRENT_BINARY_DIR}
        -D BINARY_DIR=${MYBINDIR}
        -P ${CMAKE_CURRENT_SOURCE_DIR}/instrument_wheel.cmake
)
