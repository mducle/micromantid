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
