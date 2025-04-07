# Core Python/C++ code used by all layers accessing the Python C API. It contains functionality such as classes for GIL
# management, conversion of Python errors to exceptions etc.
# It should not link to any other Mantid libraries.

function(CREATE_MODULE MODULE_TEMPLATE OUTPUT_FILE)
  set(_fwd_declarations)
  set(_function_calls)
  foreach(_cppfile ${ARGN})
    # pull out all functions named 'void export...'
    file(STRINGS ${_cppfile} _definitions REGEX "( *)?void *export.*().*")
    foreach(_func_definition ${_definitions})
      # create a forward declaration and function call
      string(STRIP "${_func_definition}" _func_definition)
      string(REGEX REPLACE "(void *export.*\\(\\)).*" "\\1" _func_declaration "${_func_definition}")
      # add to list of declarations
      set(_fwd_declarations "${_fwd_declarations}\n${_func_declaration}\;")
      # strip void and add to call list
      string(REGEX REPLACE "void *" "" _func_call "${_func_declaration}")
      set(_function_calls "${_function_calls}\n${_func_call}\;")
    endforeach()
  endforeach()
  string(STRIP "${_fwd_declarations}" _fwd_declarations)
  string(STRIP "${_function_calls}" _function_calls)

  # Configure the final file
  set(EXPORT_DECLARE ${_fwd_declarations})
  set(EXPORT_FUNCTIONS ${_function_calls})

  configure_file(${MODULE_TEMPLATE} ${OUTPUT_FILE})
endfunction()

set(MTDSRCDIR ../mantid/Framework/PythonInterface/core)

set(SRC_FILES
    ${MTDSRCDIR}/src/ErrorHandling.cpp
    ${MTDSRCDIR}/src/GlobalInterpreterLock.cpp
    ${MTDSRCDIR}/src/NDArray.cpp
    ${MTDSRCDIR}/src/ReleaseGlobalInterpreterLock.cpp
    ${MTDSRCDIR}/src/UninstallTrace.cpp
    ${MTDSRCDIR}/src/PythonLoggingChannel.cpp
    ${MTDSRCDIR}/src/PythonStdoutChannel.cpp
    ${MTDSRCDIR}/src/WrapperHelpers.cpp
    ${MTDSRCDIR}/src/Converters/CloneToNDArray.cpp
    ${MTDSRCDIR}/src/Converters/DateAndTime.cpp
    ${MTDSRCDIR}/src/Converters/NDArrayToVector.cpp
    ${MTDSRCDIR}/src/Converters/NDArrayTypeIndex.cpp
    ${MTDSRCDIR}/src/Converters/NumpyFunctions.cpp
    ${MTDSRCDIR}/src/Converters/PyObjectToMatrix.cpp
    ${MTDSRCDIR}/src/Converters/PyObjectToV3D.cpp
    ${MTDSRCDIR}/src/Converters/PyObjectToVMD.cpp
    ${MTDSRCDIR}/src/Converters/WrapWithNDArray.cpp
)

set(INC_FILES
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/CallMethod.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/Copyable.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/DataServiceExporter.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/DllConfig.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/ErrorHandling.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/ExtractSharedPtr.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/GlobalInterpreterLock.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/IsNone.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/NDArray.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/PropertyWithValueExporter.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/PythonLoggingChannel.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/PythonObjectInstantiator.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/PythonStdoutChannel.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/ReleaseGlobalInterpreterLock.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/StlExportDefinitions.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/TypedValidatorExporter.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/UninstallTrace.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/VersionCompat.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/WrapperHelpers.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/WrapPython.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/Converters/CArrayToNDArray.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/Converters/CloneToNDArray.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/Converters/ContainerDtype.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/Converters/DateAndTime.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/Converters/MapToPyDictionary.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/Converters/MatrixToNDArray.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/Converters/NDArrayToVector.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/Converters/NDArrayTypeIndex.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/Converters/NumpyFunctions.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/Converters/PyObjectToMatrix.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/Converters/PyObjectToV3D.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/Converters/PyObjectToVMD.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/Converters/PySequenceToVector.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/Converters/ToPyList.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/Converters/VectorToNDArray.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/Converters/WrapWithNDArray.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/Policies/MatrixToNumpy.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/Policies/RemoveConst.h
    ${MTDSRCDIR}/inc/MantidPythonInterface/core/Policies/VectorToNumpy.h
)

# Add the target for this directory
set(_target_name PythonInterfaceCore)

add_library(${_target_name} OBJECT ${SRC_FILES} ${INC_FILES})

target_include_directories(${_target_name} PUBLIC
  ../inc
  ${MTDSRCDIR}/inc
  ../mantid/Framework/Kernel/inc
  ../mantid/Framework/Types/inc
  ${Python_INCLUDE_DIRS}
  ${Python_NumPy_INCLUDE_DIRS}
  ${Boost_INCLUDE_DIRS}
)

# Set the name of the generated library
set_target_properties(${_target_name} PROPERTIES
  OUTPUT_NAME MantidPythonInterfaceCore
  COMPILE_DEFINITIONS IN_MANTID_PYTHONINTERFACE_CORE
  POSITION_INDEPENDENT_CODE ON
)
