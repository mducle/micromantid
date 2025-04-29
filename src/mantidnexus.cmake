set(MTDSRCDIR ../mantid/Framework)
set(NEX_SRC_FILES 
    ${MTDSRCDIR}/Nexus/src/H5Util.cpp 
    ${MTDSRCDIR}/Nexus/src/MuonNexusReader.cpp 
    ${MTDSRCDIR}/Nexus/src/NexusClasses.cpp 
    ${MTDSRCDIR}/Nexus/src/NexusFileIO.cpp
    #${MTDSRCDIR}/NexusGeometry/src/H5ForwardCompatibility.cpp
    ${MTDSRCDIR}/NexusGeometry/src/Hdf5Version.cpp
    ${MTDSRCDIR}/NexusGeometry/src/InstrumentBuilder.cpp
    #${MTDSRCDIR}/NexusGeometry/src/JSONGeometryParser.cpp
    #${MTDSRCDIR}/NexusGeometry/src/JSONInstrumentBuilder.cpp
    ${MTDSRCDIR}/NexusGeometry/src/NexusGeometryParser.cpp
    #${MTDSRCDIR}/NexusGeometry/src/NexusGeometrySave.cpp
    ${MTDSRCDIR}/NexusGeometry/src/NexusGeometryUtilities.cpp
    ${MTDSRCDIR}/NexusGeometry/src/NexusShapeFactory.cpp
    ${MTDSRCDIR}/NexusGeometry/src/TubeBuilder.cpp
    ${MTDSRCDIR}/NexusGeometry/src/TubeHelpers.cpp
)

add_library(MantidNexus OBJECT ${NEX_SRC_FILES})
target_include_directories(MantidNexus PUBLIC
    ../inc
    ../mantid/Framework/API/inc
    ../mantid/Framework/DataObjects/inc
    ../mantid/Framework/Geometry/inc
    ../mantid/Framework/HistogramData/inc
    ../mantid/Framework/Indexing/inc
    ../mantid/Framework/Kernel/inc
    ../mantid/Framework/Json/inc
    ../mantid/Framework/NexusCpp/inc
    ../mantid/Framework/Nexus/inc
    ../mantid/Framework/NexusGeometry/inc
    ../mantid/Framework/Types/inc
    ${Boost_INCLUDE_DIRS}
    ${EIGEN3_INCLUDE_DIR}
)
set_property(TARGET MantidNexus PROPERTY POSITION_INDEPENDENT_CODE ON)
