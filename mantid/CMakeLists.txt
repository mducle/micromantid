add_subdirectory(API)
add_subdirectory(Beamline)
add_subdirectory(Geometry)
add_subdirectory(HistogramData)
add_subdirectory(Indexing)
add_subdirectory(Json)
add_subdirectory(Kernel)
add_subdirectory(NexusCpp)
add_subdirectory(Types)

target_include_directories(${MICROMANTID_PYTHON_MODULE} PUBLIC
    Kernel/inc
    Types/inc
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
    mantid/kernel_bind.cpp
    mantid/Kernel/bindings/Material.cpp
    mantid/Kernel/bindings/MaterialBuilder.cpp
    mantid/Kernel/bindings/Property.cpp
CACHE INTERNAL "")
