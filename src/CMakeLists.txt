include(api.cmake)
include(beamline.cmake)
include(geometry.cmake)
include(histo.cmake)
include(index.cmake)
include(json.cmake)
include(kernel.cmake)
include(nexus.cmake)
include(types.cmake)

include(pythoncore.cmake)
include(pythonkernel.cmake)

#target_include_directories(${MICROMANTID_PYTHON_MODULE} PUBLIC
#    ../mantid/Framework/Kernel/inc
#    ../mantid/Framework/Types/inc
#)

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
