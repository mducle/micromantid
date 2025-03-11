set(API_SRC_FILES
    ../mantid/Framework/API/src/ADSValidator.cpp
    ../mantid/Framework/API/src/Algorithm.cpp
    ../mantid/Framework/API/src/AlgorithmExecuteProfile.cpp
    ../mantid/Framework/API/src/AlgorithmFactory.cpp
    ../mantid/Framework/API/src/AlgorithmHistory.cpp
    ../mantid/Framework/API/src/AlgorithmManager.cpp
    ../mantid/Framework/API/src/AlgoTimeRegister.cpp
    ../mantid/Framework/API/src/AnalysisDataService.cpp
    ../mantid/Framework/API/src/Axis.cpp
    ../mantid/Framework/API/src/BinEdgeAxis.cpp
    ../mantid/Framework/API/src/DeprecatedAlias.cpp
    ../mantid/Framework/API/src/DeprecatedAlgorithm.cpp
    ../mantid/Framework/API/src/ExperimentInfo.cpp
    ../mantid/Framework/API/src/FileLoaderRegistry.cpp
    ../mantid/Framework/API/src/HistoryItem.cpp
    ../mantid/Framework/API/src/HistoryView.cpp
    ../mantid/Framework/API/src/InstrumentDataService.cpp
    ../mantid/Framework/API/src/InstrumentFileFinder.cpp
    ../mantid/Framework/API/src/IMDIterator.cpp
    ../mantid/Framework/API/src/IMDWorkspace.cpp
    ../mantid/Framework/API/src/IPeaksWorkspace.cpp
    ../mantid/Framework/API/src/ITableWorkspace.cpp
    ../mantid/Framework/API/src/ISpectrum.cpp
    ../mantid/Framework/API/src/LogManager.cpp
    ../mantid/Framework/API/src/MatrixWorkspace.cpp
    ../mantid/Framework/API/src/MatrixWorkspaceMDIterator.cpp
    ../mantid/Framework/API/src/MDGeometry.cpp
    ../mantid/Framework/API/src/NexusFileLoader.cpp
    ../mantid/Framework/API/src/NumericAxis.cpp
    ../mantid/Framework/API/src/ResizeRectangularDetectorHelper.cpp
    ../mantid/Framework/API/src/Run.cpp
    ../mantid/Framework/API/src/Sample.cpp
    ../mantid/Framework/API/src/SpectraAxis.cpp
    ../mantid/Framework/API/src/SpectrumDetectorMapping.cpp
    ../mantid/Framework/API/src/SpectrumInfo.cpp
    ../mantid/Framework/API/src/WorkspaceHistory.cpp
    ../mantid/Framework/API/src/Workspace.cpp
    ../mantid/Framework/API/src/WorkspaceGroup.cpp
    ../mantid/Framework/API/src/WorkspacePropertyUtils.cpp
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
    ../mantid/Framework/NexusCpp/inc
    ${Boost_INCLUDE_DIRS}
    ${EIGEN3_INCLUDE_DIR}
)
set_property(TARGET MantidAPI PROPERTY POSITION_INDEPENDENT_CODE ON)

#-------------------------------------------------------------------

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

#-------------------------------------------------------------------

set(GEOMETRY_SRC_FILES
    ../mantid/Framework/Geometry/src/Crystal/BraggScatterer.cpp
    ../mantid/Framework/Geometry/src/Crystal/BraggScattererFactory.cpp
    ../mantid/Framework/Geometry/src/Crystal/BraggScattererInCrystalStructure.cpp
    ../mantid/Framework/Geometry/src/Crystal/CenteringGroup.cpp
    ../mantid/Framework/Geometry/src/Crystal/CompositeBraggScatterer.cpp
    ../mantid/Framework/Geometry/src/Crystal/CrystalStructure.cpp
    ../mantid/Framework/Geometry/src/Crystal/CyclicGroup.cpp
    ../mantid/Framework/Geometry/src/Crystal/Group.cpp
    ../mantid/Framework/Geometry/src/Crystal/GroupTransformation.cpp
    ../mantid/Framework/Geometry/src/Crystal/IsotropicAtomBraggScatterer.cpp
    ../mantid/Framework/Geometry/src/Crystal/OrientedLattice.cpp
    ../mantid/Framework/Geometry/src/Crystal/PointGroup.cpp
    ../mantid/Framework/Geometry/src/Crystal/PointGroupFactory.cpp
    ../mantid/Framework/Geometry/src/Crystal/ProductOfCyclicGroups.cpp
    ../mantid/Framework/Geometry/src/Crystal/ReflectionCondition.cpp
    ../mantid/Framework/Geometry/src/Crystal/SpaceGroup.cpp
    ../mantid/Framework/Geometry/src/Crystal/SpaceGroupFactory.cpp
    ../mantid/Framework/Geometry/src/Crystal/SymmetryElement.cpp
    ../mantid/Framework/Geometry/src/Crystal/SymmetryElementFactory.cpp
    ../mantid/Framework/Geometry/src/Crystal/SymmetryOperation.cpp
    ../mantid/Framework/Geometry/src/Crystal/SymmetryOperationFactory.cpp
    ../mantid/Framework/Geometry/src/Crystal/SymmetryOperationSymbolParser.cpp
    ../mantid/Framework/Geometry/src/Crystal/UnitCell.cpp
    ../mantid/Framework/Geometry/src/Crystal/V3R.cpp
    ../mantid/Framework/Geometry/src/IObjComponent.cpp
    ../mantid/Framework/Geometry/src/Instrument.cpp
    ../mantid/Framework/Geometry/src/Instrument/Component.cpp
    ../mantid/Framework/Geometry/src/Instrument/ComponentInfo.cpp
    ../mantid/Framework/Geometry/src/Instrument/ComponentInfoBankHelpers.cpp
    ../mantid/Framework/Geometry/src/Instrument/CompAssembly.cpp
    ../mantid/Framework/Geometry/src/Instrument/DetectorInfo.cpp
    ../mantid/Framework/Geometry/src/Instrument/DetectorGroup.cpp
    ../mantid/Framework/Geometry/src/Instrument/Detector.cpp
    ../mantid/Framework/Geometry/src/Instrument/FitParameter.cpp
    ../mantid/Framework/Geometry/src/Instrument/GridDetector.cpp
    ../mantid/Framework/Geometry/src/Instrument/GridDetectorPixel.cpp
    ../mantid/Framework/Geometry/src/Instrument/Goniometer.cpp
    ../mantid/Framework/Geometry/src/Instrument/IDFObject.cpp
    ../mantid/Framework/Geometry/src/Instrument/InstrumentDefinitionParser.cpp
    ../mantid/Framework/Geometry/src/Instrument/InstrumentVisitor.cpp
    ../mantid/Framework/Geometry/src/Instrument/ObjCompAssembly.cpp
    ../mantid/Framework/Geometry/src/Instrument/ObjComponent.cpp
    ../mantid/Framework/Geometry/src/Instrument/Parameter.cpp
    ../mantid/Framework/Geometry/src/Instrument/ParameterMap.cpp
    ../mantid/Framework/Geometry/src/Instrument/ParComponentFactory.cpp
    ../mantid/Framework/Geometry/src/Instrument/RectangularDetector.cpp
    ../mantid/Framework/Geometry/src/Instrument/ReferenceFrame.cpp
    ../mantid/Framework/Geometry/src/Instrument/StructuredDetector.cpp
    ../mantid/Framework/Geometry/src/Instrument/XMLInstrumentParameter.cpp
    ../mantid/Framework/Geometry/src/MDGeometry/GeneralFrame.cpp
    ../mantid/Framework/Geometry/src/MDGeometry/MDGeometryXMLBuilder.cpp
    ../mantid/Framework/Geometry/src/MDGeometry/MDHistoDimension.cpp
    ../mantid/Framework/Geometry/src/Math/PolyBase.cpp
    ../mantid/Framework/Geometry/src/Math/Triple.cpp
    ../mantid/Framework/Geometry/src/Math/mathSupport.cpp
    ../mantid/Framework/Geometry/src/Objects/BoundingBox.cpp
    ../mantid/Framework/Geometry/src/Objects/CSGObject.cpp
    ../mantid/Framework/Geometry/src/Objects/MeshObject.cpp
    ../mantid/Framework/Geometry/src/Objects/MeshObject2D.cpp
    ../mantid/Framework/Geometry/src/Objects/MeshObjectCommon.cpp
    ../mantid/Framework/Geometry/src/Objects/Rules.cpp
    ../mantid/Framework/Geometry/src/Objects/RuleItems.cpp
    ../mantid/Framework/Geometry/src/Objects/ShapeFactory.cpp
    ../mantid/Framework/Geometry/src/Objects/Track.cpp
    ../mantid/Framework/Geometry/src/RandomPoint.cpp
    ../mantid/Framework/Geometry/src/Rendering/GeometryHandler.cpp
    ../mantid/Framework/Geometry/src/Rendering/GeometryTriangulator.cpp
    ../mantid/Framework/Geometry/src/Rendering/vtkGeometryCacheReader.cpp
    ../mantid/Framework/Geometry/src/Rendering/vtkGeometryCacheWriter.cpp
    ../mantid/Framework/Geometry/src/Rendering/RenderingHelpersThrowing.cpp
    ../mantid/Framework/Geometry/src/Rendering/ShapeInfo.cpp
    ../mantid/Framework/Geometry/src/Surfaces/Cone.cpp
    ../mantid/Framework/Geometry/src/Surfaces/Cylinder.cpp
    ../mantid/Framework/Geometry/src/Surfaces/Line.cpp
    ../mantid/Framework/Geometry/src/Surfaces/LineIntersectVisit.cpp
    ../mantid/Framework/Geometry/src/Surfaces/Plane.cpp
    ../mantid/Framework/Geometry/src/Surfaces/Quadratic.cpp
    ../mantid/Framework/Geometry/src/Surfaces/Sphere.cpp
    ../mantid/Framework/Geometry/src/Surfaces/Surface.cpp
    ../mantid/Framework/Geometry/src/Surfaces/Torus.cpp
)
add_library(Geometry OBJECT ${GEOMETRY_SRC_FILES})
target_include_directories(Geometry PRIVATE
    ../inc
    ../mantid/Framework/Geometry/inc
    ../mantid/Framework/Beamline/inc
    ../mantid/Framework/Json/inc
    ../mantid/Framework/Kernel/inc
    ../mantid/Framework/NexusCpp/inc
    ../mantid/Framework/Types/inc
    ${Boost_INCLUDE_DIRS}
    ${EIGEN3_INCLUDE_DIRS}
)
set_property(TARGET Geometry PROPERTY POSITION_INDEPENDENT_CODE ON)

#-------------------------------------------------------------------

set(HISTO_SRC_FILES
    ../mantid/Framework/HistogramData/src/Histogram.cpp
    ../mantid/Framework/HistogramData/src/BinEdges.cpp
    ../mantid/Framework/HistogramData/src/Counts.cpp
    ../mantid/Framework/HistogramData/src/CountStandardDeviations.cpp
    ../mantid/Framework/HistogramData/src/Frequencies.cpp
    ../mantid/Framework/HistogramData/src/FrequencyStandardDeviations.cpp
    ../mantid/Framework/HistogramData/src/Points.cpp
)
add_library(HistogramData OBJECT ${HISTO_SRC_FILES})
target_include_directories(HistogramData PRIVATE
    ../inc
    ../mantid/Framework/HistogramData/inc
    ../mantid/Framework/Kernel/inc
    ${Boost_INCLUDE_DIRS}
)
set_property(TARGET HistogramData PROPERTY POSITION_INDEPENDENT_CODE ON)

#-------------------------------------------------------------------

set(INDEX_SRC_FILES
    ../mantid/Framework/Indexing/src/IndexInfo.cpp
    ../mantid/Framework/Indexing/src/Partitioner.cpp
    ../mantid/Framework/Indexing/src/RoundRobinPartitioner.cpp
    ../mantid/Framework/Indexing/src/SpectrumNumberTranslator.cpp
)
add_library(Indexing OBJECT ${INDEX_SRC_FILES})
target_include_directories(Indexing PRIVATE
    ../inc
    ../mantid/Framework/Indexing/inc
    ../mantid/Framework/Kernel/inc
    ../mantid/Framework/Types/inc
    ${Boost_INCLUDE_DIRS}
)
set_property(TARGET Indexing PROPERTY POSITION_INDEPENDENT_CODE ON)

#-------------------------------------------------------------------

set(JSON_SRC_FILES
    ../mantid/Framework/Json/src/Json.cpp
)
add_library(Json OBJECT ${JSON_SRC_FILES})
target_include_directories(Json PRIVATE
    ../inc
    ../mantid/Framework/Json/inc
    ../mantid/Framework/Kernel/inc
    ${Boost_INCLUDE_DIRS}
)
set_property(TARGET Json PROPERTY POSITION_INDEPENDENT_CODE ON)

#-------------------------------------------------------------------

set(KERNEL_SRC_FILES
    ../mantid/Framework/Kernel/src/Atom.cpp
    ../mantid/Framework/Kernel/src/AttenuationProfile.cpp
    ../mantid/Framework/Kernel/src/ArrayProperty.cpp
    ../mantid/Framework/Kernel/src/CatalogInfo.cpp
    ../mantid/Framework/Kernel/src/ChecksumHelper.cpp
    ../mantid/Framework/Kernel/src/ConfigService.cpp
    ../mantid/Framework/Kernel/src/CompositeValidator.cpp
    ../mantid/Framework/Kernel/src/DataItem.cpp
    ../mantid/Framework/Kernel/src/DateAndTime.cpp
    ../mantid/Framework/Kernel/src/DeltaEMode.cpp
    ../mantid/Framework/Kernel/src/DllOpen.cpp
    ../mantid/Framework/Kernel/src/EnvironmentHistory.cpp
    ../mantid/Framework/Kernel/src/Exception.cpp
    ../mantid/Framework/Kernel/src/FacilityInfo.cpp
    ../mantid/Framework/Kernel/src/FileDescriptor.cpp
    ../mantid/Framework/Kernel/src/FilteredTimeSeriesProperty.cpp
    ../mantid/Framework/Kernel/src/FloatingPointComparison.cpp
    ../mantid/Framework/Kernel/src/Glob.cpp
    ../mantid/Framework/Kernel/src/ICatalogInfo.cpp
    ../mantid/Framework/Kernel/src/InstrumentInfo.cpp
    ../mantid/Framework/Kernel/src/Interpolation.cpp
    ../mantid/Framework/Kernel/src/IPropertyManager.cpp
    ../mantid/Framework/Kernel/src/LibraryManager.cpp
    ../mantid/Framework/Kernel/src/LibraryWrapper.cpp
    ../mantid/Framework/Kernel/src/LiveListenerInfo.cpp
    ../mantid/Framework/Kernel/src/Logger.cpp
    ../mantid/Framework/Kernel/src/LogFilter.cpp
    ../mantid/Framework/Kernel/src/LogParser.cpp
    ../mantid/Framework/Kernel/src/MandatoryValidator.cpp
    MantidVersion.cpp
    ../mantid/Framework/Kernel/src/Material.cpp
    ../mantid/Framework/Kernel/src/MaterialBuilder.cpp
    ../mantid/Framework/Kernel/src/Matrix.cpp
    ../mantid/Framework/Kernel/src/MDUnit.cpp
    ../mantid/Framework/Kernel/src/MDUnitFactory.cpp
    ../mantid/Framework/Kernel/src/MersenneTwister.cpp
    ../mantid/Framework/Kernel/src/Memory.cpp
    ../mantid/Framework/Kernel/src/NDRandomNumberGenerator.cpp
    ../mantid/Framework/Kernel/src/NeutronAtom.cpp
    ../mantid/Framework/Kernel/src/NexusDescriptor.cpp
    ../mantid/Framework/Kernel/src/NexusHDF5Descriptor.cpp
    ../mantid/Framework/Kernel/src/NullValidator.cpp
    ../mantid/Framework/Kernel/src/OptionalBool.cpp
    ../mantid/Framework/Kernel/src/ProgressBase.cpp
    ../mantid/Framework/Kernel/src/Property.cpp
    ../mantid/Framework/Kernel/src/PropertyHistory.cpp
    ../mantid/Framework/Kernel/src/PropertyManager.cpp
    ../mantid/Framework/Kernel/src/PropertyManagerDataService.cpp
    ../mantid/Framework/Kernel/src/PropertyManagerOwner.cpp
    ../mantid/Framework/Kernel/src/PropertyManagerProperty.cpp
    ../mantid/Framework/Kernel/src/PropertyNexus.cpp
    ../mantid/Framework/Kernel/src/PropertyWithValue.cpp
    ../mantid/Framework/Kernel/src/PropertyWithValueJSON.cpp
    ../mantid/Framework/Kernel/src/PseudoRandomNumberGenerator.cpp
    ../mantid/Framework/Kernel/src/Quat.cpp
    ../mantid/Framework/Kernel/src/RegexStrings.cpp
    ../mantid/Framework/Kernel/src/SingletonHolder.cpp
    ../mantid/Framework/Kernel/src/SplittingInterval.cpp
    ../mantid/Framework/Kernel/src/Statistics.cpp
    ../mantid/Framework/Kernel/src/StdoutChannel.cpp
    ../mantid/Framework/Kernel/src/Strings.cpp
    ../mantid/Framework/Kernel/src/StringTokenizer.cpp
    ../mantid/Framework/Kernel/src/ThreadSafeLogStream.cpp
    ../mantid/Framework/Kernel/src/TimeROI.cpp
    ../mantid/Framework/Kernel/src/Timer.cpp
    ../mantid/Framework/Kernel/src/TimeSeriesProperty.cpp
    ../mantid/Framework/Kernel/src/TopicInfo.cpp
    ../mantid/Framework/Kernel/src/Unit.cpp
    ../mantid/Framework/Kernel/src/UnitLabel.cpp
    ../mantid/Framework/Kernel/src/UnitLabelTypes.cpp
    ../mantid/Framework/Kernel/src/V3D.cpp
    ../mantid/Framework/Kernel/src/VectorHelper.cpp
    ../mantid/Framework/Kernel/src/VMD.cpp
)
add_library(Kernel OBJECT ${KERNEL_SRC_FILES})
target_include_directories(Kernel PRIVATE
    ../inc
    ../mantid/Framework/Kernel/inc
    ../mantid/Framework/Json/inc
    ../mantid/Framework/Types/inc
    ../mantid/Framework/NexusCpp/inc
    ${Boost_INCLUDE_DIRS}
)
set_property(TARGET Kernel PROPERTY POSITION_INDEPENDENT_CODE ON)

#-------------------------------------------------------------------

set(NEXUS_SRC_FILES
    ../mantid/Framework/NexusCpp/src/napi.cpp
    ../mantid/Framework/NexusCpp/src/napi4.cpp
    ../mantid/Framework/NexusCpp/src/napi5.cpp
    ../mantid/Framework/NexusCpp/src/NeXusException.cpp
    ../mantid/Framework/NexusCpp/src/NeXusFile.cpp
    ../mantid/Framework/NexusCpp/src/nxstack.cpp
    ../mantid/Framework/NexusCpp/src/stptok.cpp
)
add_library(NexusCpp OBJECT ${NEXUS_SRC_FILES})
target_include_directories(NexusCpp PRIVATE
    ../inc
    ../mantid/Framework/NexusCpp/inc
    ${Boost_INCLUDE_DIRS}
)
set_property(TARGET NexusCpp PROPERTY POSITION_INDEPENDENT_CODE ON)

#-------------------------------------------------------------------

set(TYPES_SRC_FILES
    ../mantid/Framework/Types/src/Core/DateAndTime.cpp
    ../mantid/Framework/Types/src/Core/DateAndTimeHelpers.cpp
)
add_library(Types OBJECT ${TYPES_SRC_FILES})
target_include_directories(Types PRIVATE
    ../inc
    ../mantid/Framework/Types/inc
    ${Boost_INCLUDE_DIRS}
)
set_property(TARGET Types PROPERTY POSITION_INDEPENDENT_CODE ON)

#-------------------------------------------------------------------

target_include_directories(${MICROMANTID_PYTHON_MODULE} PUBLIC
    ../mantid/Framework/Kernel/inc
    ../mantid/Framework/Types/inc
)

set(MICROMANTID_CXX_LIBRARIES
    MantidAPI
    Beamline
    Geometry
    HistogramData
    Indexing
    Json
    Kernel
    NexusCpp
    Types
CACHE INTERNAL "")

set(MICROMANTID_KERNEL_BINDINGS
    src/kernel_bind.cpp
    src/kernel_bindings/Material.cpp
    src/kernel_bindings/MaterialBuilder.cpp
    src/kernel_bindings/Property.cpp
CACHE INTERNAL "")
