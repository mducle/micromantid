# _geometry Python module
set(MTDSRCDIR ../mantid/Framework/PythonInterface/mantid/geometry)

set(MODULE_TEMPLATE ${MTDSRCDIR}/src/geometry.cpp.in)

set(EXPORT_FILES
    ${MTDSRCDIR}/src/Exports/BoundingBox.cpp
    ${MTDSRCDIR}/src/Exports/IComponent.cpp
    ${MTDSRCDIR}/src/Exports/ICompAssembly.cpp
    ${MTDSRCDIR}/src/Exports/IObject.cpp
    ${MTDSRCDIR}/src/Exports/IObjComponent.cpp
    ${MTDSRCDIR}/src/Exports/IDetector.cpp
    ${MTDSRCDIR}/src/Exports/IMDDimension.cpp
    ${MTDSRCDIR}/src/Exports/Component.cpp
    ${MTDSRCDIR}/src/Exports/CompAssembly.cpp
    ${MTDSRCDIR}/src/Exports/ObjComponent.cpp
    ${MTDSRCDIR}/src/Exports/ObjCompAssembly.cpp
    ${MTDSRCDIR}/src/Exports/Detector.cpp
    ${MTDSRCDIR}/src/Exports/DetectorGroup.cpp
    ${MTDSRCDIR}/src/Exports/GridDetector.cpp
    ${MTDSRCDIR}/src/Exports/RectangularDetector.cpp
    ${MTDSRCDIR}/src/Exports/Instrument.cpp
    ${MTDSRCDIR}/src/Exports/UnitCell.cpp
    ${MTDSRCDIR}/src/Exports/MDFrame.cpp
    ${MTDSRCDIR}/src/Exports/OrientedLattice.cpp
    ${MTDSRCDIR}/src/Exports/ReferenceFrame.cpp
    ${MTDSRCDIR}/src/Exports/Goniometer.cpp
    ${MTDSRCDIR}/src/Exports/CSGObject.cpp
    ${MTDSRCDIR}/src/Exports/PeakShape.cpp
    ${MTDSRCDIR}/src/Exports/Group.cpp
    ${MTDSRCDIR}/src/Exports/PointGroup.cpp
    ${MTDSRCDIR}/src/Exports/PointGroupFactory.cpp
    ${MTDSRCDIR}/src/Exports/SpaceGroup.cpp
    ${MTDSRCDIR}/src/Exports/SpaceGroupFactory.cpp
    ${MTDSRCDIR}/src/Exports/SymmetryElement.cpp
    ${MTDSRCDIR}/src/Exports/SymmetryElementFactory.cpp
    ${MTDSRCDIR}/src/Exports/SymmetryOperation.cpp
    ${MTDSRCDIR}/src/Exports/SymmetryOperationFactory.cpp
    ${MTDSRCDIR}/src/Exports/CrystalStructure.cpp
    ${MTDSRCDIR}/src/Exports/ReflectionGenerator.cpp
    ${MTDSRCDIR}/src/Exports/DetectorInfo.cpp
    ${MTDSRCDIR}/src/Exports/DetectorInfoItem.cpp
    ${MTDSRCDIR}/src/Exports/DetectorInfoPythonIterator.cpp
    ${MTDSRCDIR}/src/Exports/ComponentInfo.cpp
    ${MTDSRCDIR}/src/Exports/ComponentInfoItem.cpp
    ${MTDSRCDIR}/src/Exports/ComponentInfoPythonIterator.cpp
    ${MTDSRCDIR}/src/Exports/MeshObject.cpp
    ${MTDSRCDIR}/src/Exports/SampleEnvironment.cpp
    ${MTDSRCDIR}/src/Exports/Container.cpp
)

set(MODULE_DEFINITION ${CMAKE_CURRENT_BINARY_DIR}/geometry.cpp)
create_module(${MODULE_TEMPLATE} ${MODULE_DEFINITION} ${EXPORT_FILES})

# Helper code
set(INC_FILES 
    ${MTDSRCDIR}/inc/MantidPythonInterface/geometry/ComponentInfoPythonIterator.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/geometry/DetectorInfoPythonIterator.h
)

# Create the target for this directory
add_library(PythonGeometryModule MODULE ${EXPORT_FILES} ${MODULE_DEFINITION} ${INC_FILES})

set_target_properties(PythonGeometryModule PROPERTIES
  PREFIX ""
  OUTPUT_NAME _geometry
  POSITION_INDEPENDENT_CODE ON
)

target_include_directories(PythonGeometryModule PUBLIC
  ${MTDSRCDIR}/inc
  ../inc
  ../mantid/Framework/Geometry/inc
  ../mantid/Framework/Beamline/inc
  ../mantid/Framework/NexusCpp/inc
  ${Boost_INCLUDE_DIRS}
)

# Add the required dependencies
target_link_libraries(PythonGeometryModule PUBLIC
  Geometry
  Beamline
  Types
  PythonInterfaceCore 
  PythonKernelModule
  ${BOOSTPYTHON}
  ${MUPARSER_LIBS}
  ${GSL_LIBS}
)

# Installation settings
install(TARGETS PythonGeometryModule DESTINATION micromantid)
