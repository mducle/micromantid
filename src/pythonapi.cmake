# _api Python module
set(MTDSRCDIR ../mantid/Framework/PythonInterface/mantid/api)

set(MODULE_TEMPLATE ${MTDSRCDIR}/src/api.cpp.in)

# Files containing export definitions, these are automatically processed -- Do NOT sort this list. The order defines the
# order in which the export definitions occur and some depend on their base classes being exported first
set(EXPORT_FILES
    ${MTDSRCDIR}/src/Exports/IAlgorithm.cpp
    ${MTDSRCDIR}/src/Exports/AlgorithmObserver.cpp
    ${MTDSRCDIR}/src/Exports/AlgorithmHistory.cpp
    ${MTDSRCDIR}/src/Exports/AlgoTimeRegister.cpp
    #${MTDSRCDIR}/src/Exports/CatalogManager.cpp
    #${MTDSRCDIR}/src/Exports/CatalogSession.cpp
    ${MTDSRCDIR}/src/Exports/DeprecatedAlgorithmChecker.cpp
    ${MTDSRCDIR}/src/Exports/Algorithm.cpp
    ${MTDSRCDIR}/src/Exports/DataProcessorAlgorithm.cpp
    ${MTDSRCDIR}/src/Exports/AlgorithmFactory.cpp
    ${MTDSRCDIR}/src/Exports/AlgorithmFactoryObserver.cpp
    ${MTDSRCDIR}/src/Exports/AlgorithmManager.cpp
    ${MTDSRCDIR}/src/Exports/AnalysisDataService.cpp
    ${MTDSRCDIR}/src/Exports/FileProperty.cpp
    ${MTDSRCDIR}/src/Exports/InstrumentFileFinder.cpp
    ${MTDSRCDIR}/src/Exports/MultipleFileProperty.cpp
    ${MTDSRCDIR}/src/Exports/FrameworkManager.cpp
    ${MTDSRCDIR}/src/Exports/ISpectrum.cpp
    ${MTDSRCDIR}/src/Exports/IEventList.cpp
    ${MTDSRCDIR}/src/Exports/WorkspaceHistory.cpp
    ${MTDSRCDIR}/src/Exports/ExperimentInfo.cpp
    ${MTDSRCDIR}/src/Exports/MultipleExperimentInfos.cpp
    ${MTDSRCDIR}/src/Exports/Workspace.cpp
    ${MTDSRCDIR}/src/Exports/IWorkspaceProperty.cpp
    ${MTDSRCDIR}/src/Exports/WorkspaceProperty.cpp
    ${MTDSRCDIR}/src/Exports/ITableWorkspace.cpp
    ${MTDSRCDIR}/src/Exports/ITableWorkspaceProperty.cpp
    ${MTDSRCDIR}/src/Exports/ISplittersWorkspace.cpp
    ${MTDSRCDIR}/src/Exports/MDGeometry.cpp
    ${MTDSRCDIR}/src/Exports/IMDWorkspace.cpp
    ${MTDSRCDIR}/src/Exports/IMDWorkspaceProperty.cpp
    ${MTDSRCDIR}/src/Exports/IMDHistoWorkspace.cpp
    ${MTDSRCDIR}/src/Exports/IMDHistoWorkspaceProperty.cpp
    ${MTDSRCDIR}/src/Exports/IMDEventWorkspace.cpp
    ${MTDSRCDIR}/src/Exports/IMDEventWorkspaceProperty.cpp
    ${MTDSRCDIR}/src/Exports/MatrixWorkspace.cpp
    ${MTDSRCDIR}/src/Exports/MatrixWorkspaceProperty.cpp
    ${MTDSRCDIR}/src/Exports/IEventWorkspace.cpp
    ${MTDSRCDIR}/src/Exports/IEventWorkspaceProperty.cpp
    ${MTDSRCDIR}/src/Exports/IMaskWorkspace.cpp
    ${MTDSRCDIR}/src/Exports/IPeaksWorkspace.cpp
    ${MTDSRCDIR}/src/Exports/IPeaksWorkspaceProperty.cpp
    ${MTDSRCDIR}/src/Exports/BinaryOperations.cpp
    ${MTDSRCDIR}/src/Exports/WorkspaceGroup.cpp
    ${MTDSRCDIR}/src/Exports/WorkspaceGroupProperty.cpp
    ${MTDSRCDIR}/src/Exports/WorkspaceValidators.cpp
    ${MTDSRCDIR}/src/Exports/ADSValidator.cpp
    ${MTDSRCDIR}/src/Exports/InstrumentValidator.cpp
    ${MTDSRCDIR}/src/Exports/OrientedLatticeValidator.cpp
    ${MTDSRCDIR}/src/Exports/Axis.cpp
    ${MTDSRCDIR}/src/Exports/IPeak.cpp
    ${MTDSRCDIR}/src/Exports/BoxController.cpp
    ${MTDSRCDIR}/src/Exports/FileFinder.cpp
    ${MTDSRCDIR}/src/Exports/FileLoaderRegistry.cpp
    ${MTDSRCDIR}/src/Exports/Sample.cpp
    #${MTDSRCDIR}/src/Exports/ScriptRepository.cpp
    #${MTDSRCDIR}/src/Exports/ScriptRepositoryFactory.cpp
    ${MTDSRCDIR}/src/Exports/SpectrumInfo.cpp
    ${MTDSRCDIR}/src/Exports/Run.cpp
    ${MTDSRCDIR}/src/Exports/WorkspaceFactory.cpp
    ${MTDSRCDIR}/src/Exports/FunctionDomain.cpp
    ${MTDSRCDIR}/src/Exports/FunctionDomain1D.cpp
    ${MTDSRCDIR}/src/Exports/FunctionDomain1DHistogram.cpp
    ${MTDSRCDIR}/src/Exports/FunctionDomain1DVector.cpp
    ${MTDSRCDIR}/src/Exports/IFunction.cpp
    ${MTDSRCDIR}/src/Exports/IFunction1D.cpp
    ${MTDSRCDIR}/src/Exports/IPeakFunction.cpp
    ${MTDSRCDIR}/src/Exports/CompositeFunction.cpp
    ${MTDSRCDIR}/src/Exports/Jacobian.cpp
    ${MTDSRCDIR}/src/Exports/FunctionFactory.cpp
    ${MTDSRCDIR}/src/Exports/Progress.cpp
    ${MTDSRCDIR}/src/Exports/Projection.cpp
    ${MTDSRCDIR}/src/Exports/FunctionProperty.cpp
    ${MTDSRCDIR}/src/Exports/AlgorithmProperty.cpp
    ${MTDSRCDIR}/src/Exports/MultiDomainFunction.cpp
    ${MTDSRCDIR}/src/Exports/SpectrumDefinition.cpp
    ${MTDSRCDIR}/src/Exports/SpectrumInfoItem.cpp
    ${MTDSRCDIR}/src/Exports/SpectrumInfoIterator.cpp
    ${MTDSRCDIR}/src/Exports/SpectrumInfoPythonIterator.cpp
    ${MTDSRCDIR}/src/Exports/AnalysisDataServiceObserver.cpp
    ${MTDSRCDIR}/src/Exports/Citation.cpp
    ${MTDSRCDIR}/src/Exports/IPreview.cpp
    ${MTDSRCDIR}/src/Exports/PreviewManager.cpp
    ${MTDSRCDIR}/src/Exports/RegionSelectorObserver.cpp
)

set(MODULE_DEFINITION ${CMAKE_CURRENT_BINARY_DIR}/api.cpp)
create_module(${MODULE_TEMPLATE} ${MODULE_DEFINITION} ${EXPORT_FILES})

# Helper code
set(SRC_FILES
    ${MTDSRCDIR}/src/Algorithms/AlgorithmObserverAdapter.cpp
    ${MTDSRCDIR}/src/Algorithms/RunPythonScript.cpp
    ${MTDSRCDIR}/src/FitFunctions/IFunctionAdapter.cpp
    ${MTDSRCDIR}/src/FitFunctions/IFunction1DAdapter.cpp
    ${MTDSRCDIR}/src/FitFunctions/IPeakFunctionAdapter.cpp
    ${MTDSRCDIR}/src/PythonAlgorithm/AlgorithmAdapter.cpp
    ${MTDSRCDIR}/src/PythonAlgorithm/DataProcessorAdapter.cpp
    ${MTDSRCDIR}/src/CloneMatrixWorkspace.cpp
    ${MTDSRCDIR}/src/Exports/AlgorithmFactoryObserverAdapter.cpp
    ${MTDSRCDIR}/src/Exports/AnalysisDataServiceObserverAdapter.cpp
)

set(INC_FILES
    ${MTDSRCDIR}/inc/MantidPythonInterface/api/Algorithms/AlgorithmFactoryObserverAdapter.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/api/Algorithms/AlgorithmObserverAdapter.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/api/Algorithms/RunPythonScript.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/api/FitFunctions/IFunctionAdapter.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/api/FitFunctions/IFunction1DAdapter.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/api/FitFunctions/IPeakFunctionAdapter.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/api/PythonAlgorithm/AlgorithmAdapter.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/api/PythonAlgorithm/DataProcessorAdapter.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/api/AnalysisDataServiceObserverAdapter.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/api/BinaryOperations.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/api/CloneMatrixWorkspace.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/api/SpectrumInfoPythonIterator.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/api/RegisterWorkspacePtrToPython.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/api/WorkspacePropertyExporter.h
)


# Create the target for this directory
add_library(PythonAPIModule MODULE ${EXPORT_FILES} ${SRC_FILES} ${MODULE_DEFINITION} ${INC_FILES})

set_target_properties(PythonAPIModule PROPERTIES
  PREFIX ""
  OUTPUT_NAME _api
  POSITION_INDEPENDENT_CODE ON
)

target_include_directories(PythonAPIModule PUBLIC
  ${MTDSRCDIR}/inc
  ../inc
  ../mantid/Framework/API/inc
  ../mantid/Framework/Beamline/inc
  ../mantid/Framework/CurveFitting/inc
  ../mantid/Framework/Geometry/inc
  ../mantid/Framework/HistogramData/inc
  ../mantid/Framework/Indexing/inc
  ../mantid/Framework/Kernel/inc
  ../mantid/Framework/Types/inc
  ../mantid/Framework/NexusCpp/inc
  ../mantid/Framework/PythonInterface/core/inc
  ../mantid/Framework/PythonInterface/mantid/kernel/inc
  ${Boost_INCLUDE_DIRS}
  ${Python_INCLUDE_DIRS}
  ${Python_NumPy_INCLUDE_DIRS}
)

# Add the required dependencies
target_link_libraries(PythonAPIModule PUBLIC
  PythonInterfaceCore
  PythonKernelModule
  MantidAPI
  Beamline
  Geometry
  HistogramData
  Indexing
  Json
  Kernel
  NexusCpp
  Types
  ${BOOSTPYTHON}
  ${POCOLIBS}
  ${HDF5_LIBRARIES}
  ${JSON_LIBS}
  ${MUPARSER_LIBS}
  ${GSL_LIBS}
)

# Installation settings
install(TARGETS PythonAPIModule DESTINATION micromantid)
