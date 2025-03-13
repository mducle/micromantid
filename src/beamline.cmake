set(BEAMLINE_SRC_FILES
    ../mantid/Framework/Beamline/src/ComponentInfo.cpp
    ../mantid/Framework/Beamline/src/DetectorInfo.cpp
    ../mantid/Framework/Beamline/src/SpectrumInfo.cpp
)
add_library(Beamline OBJECT ${BEAMLINE_SRC_FILES})
target_include_directories(Beamline PRIVATE
    ../inc
    ../mantid/Framework/Beamline/inc
    ../mantid/Framework/Kernel/inc
    ../mantid/Framework/Types/inc
    ${EIGEN3_INCLUDE_DIR}
)
set_property(TARGET Beamline PROPERTY POSITION_INDEPENDENT_CODE ON)
