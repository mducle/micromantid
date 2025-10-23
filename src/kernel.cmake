set(KERNEL_SRC_FILES
    ../mantid/Framework/Kernel/src/ANN_complete.cpp
    ../mantid/Framework/Kernel/src/ArrayBoundedValidator.cpp
    ../mantid/Framework/Kernel/src/ArrayLengthValidator.cpp
    ../mantid/Framework/Kernel/src/ArrayOrderedPairsValidator.cpp
    ../mantid/Framework/Kernel/src/ArrayProperty.cpp
    ../mantid/Framework/Kernel/src/Atom.cpp
    ../mantid/Framework/Kernel/src/AttenuationProfile.cpp
#   ../mantid/Framework/Kernel/src/BinFinder.cpp
    ../mantid/Framework/Kernel/src/BinaryStreamReader.cpp
#   ../mantid/Framework/Kernel/src/BinaryStreamWriter.cpp
    ../mantid/Framework/Kernel/src/CPUTimer.cpp
    ../mantid/Framework/Kernel/src/CatalogInfo.cpp
    ../mantid/Framework/Kernel/src/ChecksumHelper.cpp
    ../mantid/Framework/Kernel/src/CompositeValidator.cpp
    ../mantid/Framework/Kernel/src/ConfigObserver.cpp
    ../mantid/Framework/Kernel/src/ConfigPropertyObserver.cpp
    ../mantid/Framework/Kernel/src/ConfigService.cpp
    ../mantid/Framework/Kernel/src/DataItem.cpp
    ../mantid/Framework/Kernel/src/DateAndTime.cpp
    ../mantid/Framework/Kernel/src/DateAndTimeHelpers.cpp
    ../mantid/Framework/Kernel/src/DateTimeValidator.cpp
#   ../mantid/Framework/Kernel/src/DateValidator.cpp
    ../mantid/Framework/Kernel/src/DeltaEMode.cpp
    ../mantid/Framework/Kernel/src/DirectoryValidator.cpp
    ../mantid/Framework/Kernel/src/DiskBuffer.cpp
    ../mantid/Framework/Kernel/src/DllOpen.cpp
    ../mantid/Framework/Kernel/src/EnabledWhenProperty.cpp
    ../mantid/Framework/Kernel/src/EnvironmentHistory.cpp
    ../mantid/Framework/Kernel/src/EqualBinsChecker.cpp
#   ../mantid/Framework/Kernel/src/ErrorReporter.cpp
    ../mantid/Framework/Kernel/src/Exception.cpp
    ../mantid/Framework/Kernel/src/FacilityInfo.cpp
    ../mantid/Framework/Kernel/src/FileDescriptor.cpp
    ../mantid/Framework/Kernel/src/FileValidator.cpp
    ../mantid/Framework/Kernel/src/FilteredTimeSeriesProperty.cpp
    ../mantid/Framework/Kernel/src/FloatingPointComparison.cpp
#   ../mantid/Framework/Kernel/src/FreeBlock.cpp
#   ../mantid/Framework/Kernel/src/GitHubApiHelper.cpp
    ../mantid/Framework/Kernel/src/Glob.cpp
    ../mantid/Framework/Kernel/src/ICatalogInfo.cpp
    ../mantid/Framework/Kernel/src/IPropertyManager.cpp
    ../mantid/Framework/Kernel/src/ISaveable.cpp
    ../mantid/Framework/Kernel/src/IndexSet.cpp
    ../mantid/Framework/Kernel/src/InstrumentInfo.cpp
#   ../mantid/Framework/Kernel/src/InternetHelper.cpp
    ../mantid/Framework/Kernel/src/Interpolation.cpp
    ../mantid/Framework/Kernel/src/InvisibleProperty.cpp
    ../mantid/Framework/Kernel/src/LibraryManager.cpp
    ../mantid/Framework/Kernel/src/LibraryWrapper.cpp
    ../mantid/Framework/Kernel/src/LiveListenerInfo.cpp
    ../mantid/Framework/Kernel/src/LogFilter.cpp
    ../mantid/Framework/Kernel/src/LogParser.cpp
    ../mantid/Framework/Kernel/src/Logger.cpp
    ../mantid/Framework/Kernel/src/MDAxisValidator.cpp
    ../mantid/Framework/Kernel/src/MDUnit.cpp
    ../mantid/Framework/Kernel/src/MDUnitFactory.cpp
    ../mantid/Framework/Kernel/src/MagneticIon.cpp
    ../mantid/Framework/Kernel/src/MandatoryValidator.cpp
     MantidVersion.cpp
#   ../mantid/Framework/Kernel/src/MaskedProperty.cpp
    ../mantid/Framework/Kernel/src/Material.cpp
    ../mantid/Framework/Kernel/src/MaterialBuilder.cpp
#   ../mantid/Framework/Kernel/src/MaterialXMLParser.cpp
    ../mantid/Framework/Kernel/src/Math/ChebyshevPolyFit.cpp
    ../mantid/Framework/Kernel/src/Math/Distributions/ChebyshevPolynomial.cpp
    ../mantid/Framework/Kernel/src/Math/Distributions/ChebyshevSeries.cpp
#   ../mantid/Framework/Kernel/src/Math/Optimization/SLSQPMinimizer.cpp
    ../mantid/Framework/Kernel/src/Matrix.cpp
#   ../mantid/Framework/Kernel/src/MatrixProperty.cpp
    ../mantid/Framework/Kernel/src/Memory.cpp
    ../mantid/Framework/Kernel/src/MersenneTwister.cpp
    ../mantid/Framework/Kernel/src/MultiFileNameParser.cpp
    ../mantid/Framework/Kernel/src/MultiFileValidator.cpp
    ../mantid/Framework/Kernel/src/NDRandomNumberGenerator.cpp
    ../mantid/Framework/Kernel/src/NeutronAtom.cpp
    ../mantid/Framework/Kernel/src/LegacyNexusDescriptor.cpp
    ../mantid/Framework/Kernel/src/NullValidator.cpp
    ../mantid/Framework/Kernel/src/OptionalBool.cpp
    ../mantid/Framework/Kernel/src/SpinStateHelpers.cpp
#   ../mantid/Framework/Kernel/src/ParallelMinMax.cpp
    ../mantid/Framework/Kernel/src/ProgressBase.cpp
    ../mantid/Framework/Kernel/src/Property.cpp
    ../mantid/Framework/Kernel/src/PropertyHelper.cpp
    ../mantid/Framework/Kernel/src/PropertyHistory.cpp
    ../mantid/Framework/Kernel/src/PropertyManager.cpp
    ../mantid/Framework/Kernel/src/PropertyManagerDataService.cpp
    ../mantid/Framework/Kernel/src/PropertyManagerOwner.cpp
    ../mantid/Framework/Kernel/src/PropertyManagerProperty.cpp
    ../mantid/Framework/Kernel/src/PropertyNexus.cpp
    ../mantid/Framework/Kernel/src/PropertyWithValue.cpp
    ../mantid/Framework/Kernel/src/PropertyWithValueJSON.cpp
#   ../mantid/Framework/Kernel/src/ProxyInfo.cpp
    ../mantid/Framework/Kernel/src/PseudoRandomNumberGenerator.cpp
    ../mantid/Framework/Kernel/src/Quat.cpp
#   ../mantid/Framework/Kernel/src/ReadLock.cpp
    ../mantid/Framework/Kernel/src/RebinParamsValidator.cpp
    ../mantid/Framework/Kernel/src/RegexStrings.cpp
#   ../mantid/Framework/Kernel/src/SetValueWhenProperty.cpp
    ../mantid/Framework/Kernel/src/SingletonHolder.cpp
#   ../mantid/Framework/Kernel/src/SobolSequence.cpp
    ../mantid/Framework/Kernel/src/SpinStateValidator.cpp
    ../mantid/Framework/Kernel/src/SplittingInterval.cpp
    ../mantid/Framework/Kernel/src/StartsWithValidator.cpp
    ../mantid/Framework/Kernel/src/Statistics.cpp
    ../mantid/Framework/Kernel/src/StdoutChannel.cpp
    ../mantid/Framework/Kernel/src/StringContainsValidator.cpp
    ../mantid/Framework/Kernel/src/StringTokenizer.cpp
    ../mantid/Framework/Kernel/src/Strings.cpp
#   ../mantid/Framework/Kernel/src/TestChannel.cpp
#   ../mantid/Framework/Kernel/src/ThreadPool.cpp
#   ../mantid/Framework/Kernel/src/ThreadPoolRunnable.cpp
    ../mantid/Framework/Kernel/src/ThreadSafeLogStream.cpp
    ../mantid/Framework/Kernel/src/TimeROI.cpp
    ../mantid/Framework/Kernel/src/TimeSeriesProperty.cpp
    ../mantid/Framework/Kernel/src/Timer.cpp
    ../mantid/Framework/Kernel/src/TopicInfo.cpp
    ../mantid/Framework/Kernel/src/Unit.cpp
    ../mantid/Framework/Kernel/src/UnitConversion.cpp
    ../mantid/Framework/Kernel/src/UnitLabel.cpp
    ../mantid/Framework/Kernel/src/UnitLabelTypes.cpp
#   ../mantid/Framework/Kernel/src/UsageService.cpp
#   ../mantid/Framework/Kernel/src/UserCatalogInfo.cpp
#   ../mantid/Framework/Kernel/src/UserStringParser.cpp
#   ../mantid/Framework/Kernel/src/Utils.cpp
    ../mantid/Framework/Kernel/src/V2D.cpp
    ../mantid/Framework/Kernel/src/V3D.cpp
    ../mantid/Framework/Kernel/src/VMD.cpp
    ../mantid/Framework/Kernel/src/VectorHelper.cpp
    ../mantid/Framework/Kernel/src/VisibleWhenProperty.cpp
#   ../mantid/Framework/Kernel/src/WriteLock.cpp
)
add_library(Kernel OBJECT ${KERNEL_SRC_FILES})
target_include_directories(Kernel PRIVATE
    ../inc
    ../mantid/Framework/Kernel/inc
    ../mantid/Framework/Json/inc
    ../mantid/Framework/Types/inc
    ../mantid/Framework/LegacyNexus/inc
    ../mantid/Framework/Nexus/inc
    ${Boost_INCLUDE_DIRS}
)
set_property(TARGET Kernel PROPERTY POSITION_INDEPENDENT_CODE ON)
