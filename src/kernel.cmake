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
