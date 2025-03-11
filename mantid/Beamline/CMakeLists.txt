set(SRC_FILES
    src/ComponentInfo.cpp
    src/DetectorInfo.cpp
    src/SpectrumInfo.cpp
)

add_library(Beamline OBJECT ${SRC_FILES})
target_include_directories(Beamline PRIVATE
    inc
    ../Kernel/inc
    ../Types/inc
    ${EIGEN3_INCLUDE_DIR}
)
set_property(TARGET Beamline PROPERTY POSITION_INDEPENDENT_CODE ON)

