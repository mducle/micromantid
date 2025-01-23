set(SRC_FILES
    src/Instrument/Parameter.cpp
)

add_library(Geometry OBJECT ${SRC_FILES})
target_include_directories(Geometry PRIVATE
    inc
    ../Kernel/inc
    ${Boost_INCLUDE_DIRS}
)
set_property(TARGET Geometry PROPERTY POSITION_INDEPENDENT_CODE ON)
