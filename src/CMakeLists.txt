include(api.cmake)
include(beamline.cmake)
include(dataobjects.cmake)
include(geometry.cmake)
include(histo.cmake)
include(index.cmake)
include(json.cmake)
include(kernel.cmake)
include(nexus.cmake)
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
  Beamline
  DataObjects
  Geometry
  HistogramData
  Indexing
  Json
  Kernel
  NexusCpp
  Types
CACHE INTERNAL "")
