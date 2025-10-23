set(API_SRC_FILES
    ../mantid/Framework/API/src/ADSValidator.cpp
    ../mantid/Framework/API/src/Algorithm.cpp
    ../mantid/Framework/API/src/AlgorithmExecuteProfile.cpp
    ../mantid/Framework/API/src/AlgorithmFactory.cpp
    ../mantid/Framework/API/src/AlgorithmFactoryObserver.cpp
#   ../mantid/Framework/API/src/AlgorithmHasProperty.cpp
    ../mantid/Framework/API/src/AlgorithmHistory.cpp
    ../mantid/Framework/API/src/AlgorithmManager.cpp
    ../mantid/Framework/API/src/AlgorithmObserver.cpp
#   ../mantid/Framework/API/src/AlgorithmProperties.cpp
    ../mantid/Framework/API/src/AlgorithmProperty.cpp
#   ../mantid/Framework/API/src/AlgorithmRuntimeProps.cpp
    ../mantid/Framework/API/src/AlgoTimeRegister.cpp
    ../mantid/Framework/API/src/AnalysisDataService.cpp
    ../mantid/Framework/API/src/AnalysisDataServiceObserver.cpp
#   ../mantid/Framework/API/src/ArchiveSearchFactory.cpp
    ../mantid/Framework/API/src/Axis.cpp
    ../mantid/Framework/API/src/BinEdgeAxis.cpp
#   ../mantid/Framework/API/src/BoostOptionalToAlgorithmProperty.cpp
    ../mantid/Framework/API/src/BoxController.cpp
    ../mantid/Framework/API/src/BoxControllerSettingsAlgorithm.cpp
#   ../mantid/Framework/API/src/CatalogManager.cpp
#   ../mantid/Framework/API/src/CatalogSession.cpp
    ../mantid/Framework/API/src/Citation.cpp
    ../mantid/Framework/API/src/Column.cpp
    ../mantid/Framework/API/src/ColumnFactory.cpp
    ../mantid/Framework/API/src/CommonBinsValidator.cpp
#   ../mantid/Framework/API/src/CompositeCatalog.cpp
#   ../mantid/Framework/API/src/CompositeDomainMD.cpp
    ../mantid/Framework/API/src/CompositeFunction.cpp
    ../mantid/Framework/API/src/ConstraintFactory.cpp
    ../mantid/Framework/API/src/CoordTransform.cpp
    ../mantid/Framework/API/src/CostFunctionFactory.cpp
    ../mantid/Framework/API/src/DataProcessorAlgorithm.cpp
    ../mantid/Framework/API/src/DeprecatedAlgorithm.cpp
    ../mantid/Framework/API/src/DeprecatedAlias.cpp
#   ../mantid/Framework/API/src/DetectorSearcher.cpp
    ../mantid/Framework/API/src/DomainCreatorFactory.cpp
#   ../mantid/Framework/API/src/EnabledWhenWorkspaceIsType.cpp
    ../mantid/Framework/API/src/EqualBinSizesValidator.cpp
    ../mantid/Framework/API/src/ExperimentInfo.cpp
    ../mantid/Framework/API/src/Expression.cpp
    ../mantid/Framework/API/src/FileBackedExperimentInfo.cpp
    ../mantid/Framework/API/src/FileFinder.cpp
    ../mantid/Framework/API/src/FileLoaderRegistry.cpp
    ../mantid/Framework/API/src/FileProperty.cpp
    ../mantid/Framework/API/src/FrameworkManager.cpp
    ../mantid/Framework/API/src/FuncMinimizerFactory.cpp
    ../mantid/Framework/API/src/FunctionDomain1D.cpp
    ../mantid/Framework/API/src/FunctionDomainGeneral.cpp
    ../mantid/Framework/API/src/FunctionDomainMD.cpp
    ../mantid/Framework/API/src/FunctionFactory.cpp
#   ../mantid/Framework/API/src/FunctionGenerator.cpp
    ../mantid/Framework/API/src/FunctionParameterDecorator.cpp
    ../mantid/Framework/API/src/FunctionProperty.cpp
    ../mantid/Framework/API/src/FunctionValues.cpp
#   ../mantid/Framework/API/src/GridDomain.cpp
#   ../mantid/Framework/API/src/GridDomain1D.cpp
#   ../mantid/Framework/API/src/GroupingLoader.cpp
#   ../mantid/Framework/API/src/HistoWorkspace.cpp
    ../mantid/Framework/API/src/HistogramValidator.cpp
    ../mantid/Framework/API/src/HistoryItem.cpp
    ../mantid/Framework/API/src/HistoryView.cpp
    ../mantid/Framework/API/src/IDomainCreator.cpp
#   ../mantid/Framework/API/src/IEventList.cpp
    ../mantid/Framework/API/src/IEventWorkspace.cpp
    ../mantid/Framework/API/src/IFuncMinimizer.cpp
    ../mantid/Framework/API/src/IFunction.cpp
    ../mantid/Framework/API/src/IFunction1D.cpp
    ../mantid/Framework/API/src/IFunction1DSpectrum.cpp
    ../mantid/Framework/API/src/IFunctionGeneral.cpp
    ../mantid/Framework/API/src/IFunctionMD.cpp
    ../mantid/Framework/API/src/IFunctionMW.cpp
#   ../mantid/Framework/API/src/IJournal.cpp
    ../mantid/Framework/API/src/ILatticeFunction.cpp
    ../mantid/Framework/API/src/IMDEventWorkspace.cpp
    ../mantid/Framework/API/src/IMDHistoWorkspace.cpp
    ../mantid/Framework/API/src/IMDIterator.cpp
    ../mantid/Framework/API/src/IMDWorkspace.cpp
    ../mantid/Framework/API/src/IPawleyFunction.cpp
    ../mantid/Framework/API/src/IPeakFunction.cpp
    ../mantid/Framework/API/src/IPeaksWorkspace.cpp
#   ../mantid/Framework/API/src/IPowderDiffPeakFunction.cpp
#   ../mantid/Framework/API/src/ISISInstrumentDataCache.cpp
    ../mantid/Framework/API/src/ISISRunLogs.cpp
    ../mantid/Framework/API/src/ISpectrum.cpp
    ../mantid/Framework/API/src/ITableWorkspace.cpp
    ../mantid/Framework/API/src/ImmutableCompositeFunction.cpp
    ../mantid/Framework/API/src/ImplicitFunctionFactory.cpp
    ../mantid/Framework/API/src/ImplicitFunctionParameterParserFactory.cpp
    ../mantid/Framework/API/src/ImplicitFunctionParserFactory.cpp
    ../mantid/Framework/API/src/IncreasingAxisValidator.cpp
    ../mantid/Framework/API/src/IndexProperty.cpp
    ../mantid/Framework/API/src/IndexTypeProperty.cpp
    ../mantid/Framework/API/src/InstrumentDataService.cpp
    ../mantid/Framework/API/src/InstrumentFileFinder.cpp
    ../mantid/Framework/API/src/InstrumentValidator.cpp
    ../mantid/Framework/API/src/JointDomain.cpp
    ../mantid/Framework/API/src/LatticeDomain.cpp
#   ../mantid/Framework/API/src/LinearScale.cpp
#   ../mantid/Framework/API/src/LiveListener.cpp
#   ../mantid/Framework/API/src/LiveListenerFactory.cpp
    ../mantid/Framework/API/src/LogManager.cpp
#   ../mantid/Framework/API/src/LogarithmScale.cpp
    ../mantid/Framework/API/src/MDFrameValidator.cpp
    ../mantid/Framework/API/src/MDGeometry.cpp
    ../mantid/Framework/API/src/MatrixWorkspace.cpp
    ../mantid/Framework/API/src/MatrixWorkspaceMDIterator.cpp
    ../mantid/Framework/API/src/MuParserUtils.cpp
    ../mantid/Framework/API/src/MultiDomainFunction.cpp
    ../mantid/Framework/API/src/MultiPeriodGroupAlgorithm.cpp
    ../mantid/Framework/API/src/MultiPeriodGroupWorker.cpp
    ../mantid/Framework/API/src/MultipleExperimentInfos.cpp
    ../mantid/Framework/API/src/MultipleFileProperty.cpp
    ../mantid/Framework/API/src/NexusFileLoader.cpp
    ../mantid/Framework/API/src/NotebookBuilder.cpp
    ../mantid/Framework/API/src/NotebookWriter.cpp
    ../mantid/Framework/API/src/NullCoordTransform.cpp
    ../mantid/Framework/API/src/NumericAxis.cpp
    ../mantid/Framework/API/src/NumericAxisValidator.cpp
    ../mantid/Framework/API/src/OrientedLatticeValidator.cpp
    ../mantid/Framework/API/src/ParamFunction.cpp
    ../mantid/Framework/API/src/ParameterReference.cpp
    ../mantid/Framework/API/src/ParameterTie.cpp
    ../mantid/Framework/API/src/PeakFunctionIntegrator.cpp
#   ../mantid/Framework/API/src/PolSANSWorkspaceValidator.cpp
    ../mantid/Framework/API/src/PreviewManager.cpp
    ../mantid/Framework/API/src/Progress.cpp
    ../mantid/Framework/API/src/Projection.cpp
    ../mantid/Framework/API/src/PropertyWithValue.cpp
    ../mantid/Framework/API/src/RawCountValidator.cpp
    ../mantid/Framework/API/src/RefAxis.cpp
    ../mantid/Framework/API/src/RegionSelectorObserver.cpp
    ../mantid/Framework/API/src/ResizeRectangularDetectorHelper.cpp
    ../mantid/Framework/API/src/Run.cpp
    ../mantid/Framework/API/src/Sample.cpp
#   ../mantid/Framework/API/src/SampleShapeValidator.cpp
    ../mantid/Framework/API/src/SampleValidator.cpp
#   ../mantid/Framework/API/src/ScopedWorkspace.cpp
    ../mantid/Framework/API/src/ScriptBuilder.cpp
#   ../mantid/Framework/API/src/ScriptRepository.cpp
#   ../mantid/Framework/API/src/ScriptRepositoryFactory.cpp
    ../mantid/Framework/API/src/SingleCountValidator.cpp
    ../mantid/Framework/API/src/SpectraAxis.cpp
    ../mantid/Framework/API/src/SpectraAxisValidator.cpp
    ../mantid/Framework/API/src/SpectrumDetectorMapping.cpp
    ../mantid/Framework/API/src/SpectrumInfo.cpp
    ../mantid/Framework/API/src/TableRow.cpp
    ../mantid/Framework/API/src/TextAxis.cpp
#   ../mantid/Framework/API/src/TransformScaleFactory.cpp
    ../mantid/Framework/API/src/Workspace.cpp
    ../mantid/Framework/API/src/WorkspaceFactory.cpp
    ../mantid/Framework/API/src/WorkspaceGroup.cpp
    ../mantid/Framework/API/src/WorkspaceHasDxValidator.cpp
    ../mantid/Framework/API/src/WorkspaceHistory.cpp
    ../mantid/Framework/API/src/WorkspaceNearestNeighbourInfo.cpp
    ../mantid/Framework/API/src/WorkspaceNearestNeighbours.cpp
    ../mantid/Framework/API/src/WorkspaceOpOverloads.cpp
    ../mantid/Framework/API/src/WorkspaceProperty.cpp
    ../mantid/Framework/API/src/WorkspacePropertyUtils.cpp
    ../mantid/Framework/API/src/WorkspaceUnitValidator.cpp
)
add_library(MantidAPI OBJECT ${API_SRC_FILES})
target_include_directories(MantidAPI PRIVATE
    ../inc
    ../mantid/Framework/API/inc
    ../mantid/Framework/Beamline/inc
    ../mantid/Framework/Geometry/inc
    ../mantid/Framework/HistogramData/inc
    ../mantid/Framework/Indexing/inc
    ../mantid/Framework/Json/inc
    ../mantid/Framework/Kernel/inc
    ../mantid/Framework/Types/inc
    ../mantid/Framework/Nexus/inc
    ${Boost_INCLUDE_DIRS}
    ${EIGEN3_INCLUDE_DIR}
)
set_property(TARGET MantidAPI PROPERTY POSITION_INDEPENDENT_CODE ON)
