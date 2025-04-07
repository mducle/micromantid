# _kernel Python module
set(MTDSRCDIR ../mantid/Framework/PythonInterface/mantid/kernel)

set(MODULE_TEMPLATE ${MTDSRCDIR}/src/kernel.cpp.in)

# Files containing export definitions, these are automatically processed -- Do NOT sort this list. The order defines the
# order in which the export definitions occur and some depend on their base classes being exported first --
set(EXPORT_FILES
    ${MTDSRCDIR}/src/Exports/ConfigService.cpp
    ${MTDSRCDIR}/src/Exports/ConfigObserver.cpp
    ${MTDSRCDIR}/src/Exports/ConfigPropertyObserver.cpp
    ${MTDSRCDIR}/src/Exports/DataItem.cpp
    ${MTDSRCDIR}/src/Exports/HTTPStatus.cpp
    ${MTDSRCDIR}/src/Exports/IPropertyManager.cpp
    ${MTDSRCDIR}/src/Exports/Property.cpp
    ${MTDSRCDIR}/src/Exports/IValidator.cpp
    ${MTDSRCDIR}/src/Exports/IPropertySettings.cpp
    ${MTDSRCDIR}/src/Exports/EnabledWhenProperty.cpp
    #${MTDSRCDIR}/src/Exports/ErrorReporter.cpp
    ${MTDSRCDIR}/src/Exports/VisibleWhenProperty.cpp
    ${MTDSRCDIR}/src/Exports/PropertyWithValue.cpp
    ${MTDSRCDIR}/src/Exports/ArrayProperty.cpp
    ${MTDSRCDIR}/src/Exports/Quat.cpp
    ${MTDSRCDIR}/src/Exports/V3D.cpp
    ${MTDSRCDIR}/src/Exports/VMD.cpp
    ${MTDSRCDIR}/src/Exports/StlContainers.cpp
    ${MTDSRCDIR}/src/Exports/Logger.cpp
    ${MTDSRCDIR}/src/Exports/Unit.cpp
    ${MTDSRCDIR}/src/Exports/Units.cpp
    ${MTDSRCDIR}/src/Exports/BoundedValidator.cpp
    ${MTDSRCDIR}/src/Exports/TimeSeriesProperty.cpp
    ${MTDSRCDIR}/src/Exports/FilteredTimeSeriesProperty.cpp
    ${MTDSRCDIR}/src/Exports/DateAndTime.cpp
    ${MTDSRCDIR}/src/Exports/InstrumentInfo.cpp
    ${MTDSRCDIR}/src/Exports/FacilityInfo.cpp
    ${MTDSRCDIR}/src/Exports/LiveListenerInfo.cpp
    ${MTDSRCDIR}/src/Exports/NullValidator.cpp
    ${MTDSRCDIR}/src/Exports/ListValidator.cpp
    ${MTDSRCDIR}/src/Exports/ArrayLengthValidator.cpp
    ${MTDSRCDIR}/src/Exports/ArrayBoundedValidator.cpp
    ${MTDSRCDIR}/src/Exports/ArrayOrderedPairsValidator.cpp
    ${MTDSRCDIR}/src/Exports/MandatoryValidator.cpp
    ${MTDSRCDIR}/src/Exports/MantidVersion.cpp
    ${MTDSRCDIR}/src/Exports/CompositeValidator.cpp
    ${MTDSRCDIR}/src/Exports/LogFilter.cpp
    ${MTDSRCDIR}/src/Exports/UnitConversion.cpp
    ${MTDSRCDIR}/src/Exports/UnitFactory.cpp
    ${MTDSRCDIR}/src/Exports/UnitLabel.cpp
    ${MTDSRCDIR}/src/Exports/DeltaEMode.cpp
    ${MTDSRCDIR}/src/Exports/PropertyManager.cpp
    ${MTDSRCDIR}/src/Exports/PropertyManagerDataService.cpp
    ${MTDSRCDIR}/src/Exports/PropertyManagerProperty.cpp
    ${MTDSRCDIR}/src/Exports/PropertyHistory.cpp
    ${MTDSRCDIR}/src/Exports/Memory.cpp
    ${MTDSRCDIR}/src/Exports/ProgressBase.cpp
    ${MTDSRCDIR}/src/Exports/Material.cpp
    ${MTDSRCDIR}/src/Exports/MaterialBuilder.cpp
    ${MTDSRCDIR}/src/Exports/Statistics.cpp
    ${MTDSRCDIR}/src/Exports/TimeROI.cpp
    ${MTDSRCDIR}/src/Exports/OptionalBool.cpp
    #${MTDSRCDIR}/src/Exports/UsageService.cpp
    ${MTDSRCDIR}/src/Exports/Atom.cpp
    ${MTDSRCDIR}/src/Exports/StringContainsValidator.cpp
    ${MTDSRCDIR}/src/Exports/PropertyFactory.cpp
    ${MTDSRCDIR}/src/Exports/RebinParamsValidator.cpp
    ${MTDSRCDIR}/src/Exports/PhysicalConstants.cpp
    ${MTDSRCDIR}/src/Exports/SpecialCoordinateSystem.cpp
)

set(MODULE_DEFINITION ${CMAKE_CURRENT_BINARY_DIR}/kernel.cpp)
create_module(${MODULE_TEMPLATE} ${MODULE_DEFINITION} ${EXPORT_FILES})

# Helper code

set(SRC_FILES
    ${MTDSRCDIR}/src/Registry/MappingTypeHandler.cpp
    ${MTDSRCDIR}/src/Registry/PropertyManagerFactory.cpp
    ${MTDSRCDIR}/src/Registry/PropertyWithValueFactory.cpp
    ${MTDSRCDIR}/src/Registry/SequenceTypeHandler.cpp
    ${MTDSRCDIR}/src/Registry/TypeRegistry.cpp
)

set(INC_FILES
    ${MTDSRCDIR}/inc/MantidPythonInterface/kernel/Registry/MappingTypeHandler.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/kernel/Registry/PropertyValueHandler.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/kernel/Registry/PropertyManagerFactory.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/kernel/Registry/PropertyWithValueFactory.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/kernel/Registry/SequenceTypeHandler.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/kernel/Registry/TypedPropertyValueHandler.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/kernel/Registry/TypeRegistry.h
)

# Create the target for this directory
add_library(PythonKernelModule MODULE ${EXPORT_FILES} ${SRC_FILES} ${MODULE_DEFINITION} ${INC_FILES})

set_target_properties(PythonKernelModule PROPERTIES
  PREFIX ""
  OUTPUT_NAME _kernel
  POSITION_INDEPENDENT_CODE ON
)

target_include_directories(PythonKernelModule PUBLIC
  ${MTDSRCDIR}/inc
  ../mantid/Framework/Kernel/inc
  ${PYTHON_INCLUDE_DIRS}
)

# Add the required dependencies
target_link_libraries(PythonKernelModule PUBLIC
  PythonInterfaceCore 
  Kernel
  Json
  NexusCpp
  Types
  ${BOOSTPYTHON}
  ${POCOLIBS}
  ${HDF5_LIBRARIES}
  ${JSON_LIBS}
)

# Installation settings
install(TARGETS PythonKernelModule DESTINATION micromantid)
