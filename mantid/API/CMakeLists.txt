set(SRC_FILES
    src/Algorithm.cpp
    src/AlgorithmExecuteProfile.cpp
    src/AlgorithmFactory.cpp
    src/AnalysisDataService.cpp
    src/DeprecatedAlias.cpp
    src/ExperimentInfo.cpp
    src/FileLoaderRegistry.cpp
    src/IPeaksWorkspace.cpp
    src/ITableWorkspace.cpp
    src/MatrixWorkspace.cpp
    src/Workspace.cpp
    src/WorkspaceGroup.cpp
)

add_library(MantidAPI OBJECT ${SRC_FILES})
target_include_directories(MantidAPI PRIVATE
    inc
    ../Beamline/inc
    ../Geometry/inc
    ../HistogramData/inc
    ../Indexing/inc
    ../Json/inc
    ../Kernel/inc
    ../Types/inc
    ../NexusCpp/inc
    ${Boost_INCLUDE_DIRS}
    ${EIGEN3_INCLUDE_DIR}
)
set_property(TARGET MantidAPI PROPERTY POSITION_INDEPENDENT_CODE ON)
