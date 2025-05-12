include(api.cmake)
include(algorithms.cmake)
include(md_algos.cmake)
include(beamline.cmake)
include(dataobjects.cmake)
include(datahandling.cmake)
include(geometry.cmake)
include(histo.cmake)
include(index.cmake)
include(json.cmake)
include(kernel.cmake)
include(nexus.cmake)
include(mantidnexus.cmake)
include(types.cmake)

include(pythoncore.cmake)
include(pythonkernel.cmake)
include(pythongeometry.cmake)
include(pythonapi.cmake)
include(pythondataobjects.cmake)

set(MICROMANTID_CXX_LIBRARIES
  PythonInterfaceCore
  PythonKernelModule
  PythonAPIModule
  PythonGeometryModule
  PythonDataObjectsModule
  MantidAPI
  Algorithms
  Beamline
  DataObjects
  DataHandling
  Geometry
  HistogramData
  Indexing
  Json
  Kernel
  NexusCpp
  MantidNexus
  MDAlgorithms
  Types
CACHE INTERNAL "")

if (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/../dist)
    set(MYBINDIR ${CMAKE_CURRENT_SOURCE_DIR}/../dist)
else()
    set(MYBINDIR ${CMAKE_BINARY_DIR})
endif()

add_custom_target(InstrumentWheel
    COMMAND ${CMAKE_COMMAND} 
        -D CURRENT_SOURCE_DIR=${CMAKE_CURRENT_SOURCE_DIR}
        -D CURRENT_BINARY_DIR=${CMAKE_CURRENT_BINARY_DIR}
        -D BINARY_DIR=${MYBINDIR}
        -P ${CMAKE_CURRENT_SOURCE_DIR}/instrument_wheel.cmake
)
