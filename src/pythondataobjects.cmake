# _dataobjects Python module
set(MTDSRCDIR ../mantid/Framework/PythonInterface/mantid/dataobjects)

set(MODULE_TEMPLATE ${MTDSRCDIR}/src/dataobjects.cpp.in)

# Files containing export definitions, these are automatically processed -- Do NOT sort this list. The order defines the
# order in which the export definitions occur and some depend on their base classes being exported first --
set(EXPORT_FILES
    ${MTDSRCDIR}/src/Exports/EventList.cpp
    ${MTDSRCDIR}/src/Exports/EventWorkspace.cpp
    ${MTDSRCDIR}/src/Exports/EventWorkspaceProperty.cpp
    ${MTDSRCDIR}/src/Exports/Workspace2D.cpp
    ${MTDSRCDIR}/src/Exports/Workspace2DProperty.cpp
    ${MTDSRCDIR}/src/Exports/RebinnedOutput.cpp
    ${MTDSRCDIR}/src/Exports/SpecialWorkspace2D.cpp
    ${MTDSRCDIR}/src/Exports/SpecialWorkspace2DProperty.cpp
    ${MTDSRCDIR}/src/Exports/GroupingWorkspace.cpp
    ${MTDSRCDIR}/src/Exports/GroupingWorkspaceProperty.cpp
    ${MTDSRCDIR}/src/Exports/MaskWorkspace.cpp
    ${MTDSRCDIR}/src/Exports/MaskWorkspaceProperty.cpp
    ${MTDSRCDIR}/src/Exports/OffsetsWorkspace.cpp
    ${MTDSRCDIR}/src/Exports/OffsetsWorkspaceProperty.cpp
    ${MTDSRCDIR}/src/Exports/MDEventWorkspace.cpp
    ${MTDSRCDIR}/src/Exports/MDHistoWorkspace.cpp
    ${MTDSRCDIR}/src/Exports/PeaksWorkspace.cpp
    ${MTDSRCDIR}/src/Exports/LeanElasticPeaksWorkspace.cpp
    ${MTDSRCDIR}/src/Exports/PeaksWorkspaceProperty.cpp
    ${MTDSRCDIR}/src/Exports/TableWorkspace.cpp
    ${MTDSRCDIR}/src/Exports/TableWorkspaceProperty.cpp
    ${MTDSRCDIR}/src/Exports/SplittersWorkspace.cpp
    ${MTDSRCDIR}/src/Exports/SplittersWorkspaceProperty.cpp
    ${MTDSRCDIR}/src/Exports/WorkspaceSingleValue.cpp
    ${MTDSRCDIR}/src/Exports/WorkspaceSingleValueProperty.cpp
    ${MTDSRCDIR}/src/Exports/NoShape.cpp
    ${MTDSRCDIR}/src/Exports/PeakShapeSpherical.cpp
    ${MTDSRCDIR}/src/Exports/PeakShapeEllipsoid.cpp
    ${MTDSRCDIR}/src/Exports/WorkspaceValidators.cpp
    ${MTDSRCDIR}/src/Exports/PeakShapeDetectorBin.cpp
)

set(MODULE_DEFINITION ${CMAKE_CURRENT_BINARY_DIR}/dataobjects.cpp)
create_module(${MODULE_TEMPLATE} ${MODULE_DEFINITION} ${EXPORT_FILES})

# Create the target for this directory
add_library(PythonDataObjectsModule OBJECT ${EXPORT_FILES} ${MODULE_DEFINITION})

set_target_properties(PythonDataObjectsModule PROPERTIES
  PREFIX ""
  OUTPUT_NAME _dataobjects
  POSITION_INDEPENDENT_CODE ON
)

target_include_directories(PythonDataObjectsModule PRIVATE
  ${MTDSRCDIR}/inc
  ../inc
  ../mantid/Framework/DataObjects/inc
  ../mantid/Framework/API/inc
  ../mantid/Framework/Beamline/inc
  ../mantid/Framework/Geometry/inc
  ../mantid/Framework/HistogramData/inc
  ../mantid/Framework/Indexing/inc
  ../mantid/Framework/Kernel/inc
  ../mantid/Framework/NexusCpp/inc
  ../mantid/Framework/Types/inc
  ../mantid/Framework/PythonInterface/core/inc
  ../mantid/Framework/PythonInterface/mantid/api/inc
  ../mantid/Framework/PythonInterface/mantid/kernel/inc
  ${Boost_INCLUDE_DIRS}
  ${EIGEN3_INCLUDE_DIR}
  ${Python_INCLUDE_DIRS}
)
# ${Python_NumPy_INCLUDE_DIRS}
