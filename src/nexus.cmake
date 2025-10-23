set(NEXUS_SRC_FILES
    ../mantid/Framework/LegacyNexus/src/napi.cpp
    ../mantid/Framework/LegacyNexus/src/napi4.cpp
    ../mantid/Framework/LegacyNexus/src/napi5.cpp
    ../mantid/Framework/LegacyNexus/src/NexusClasses.cpp
    ../mantid/Framework/LegacyNexus/src/NeXusException.cpp
    ../mantid/Framework/LegacyNexus/src/NeXusFile.cpp
    ../mantid/Framework/LegacyNexus/src/NeXusFileID.cpp
    ../mantid/Framework/LegacyNexus/src/stptok.cpp
)
add_library(LegacyNexus OBJECT ${NEXUS_SRC_FILES})
target_include_directories(LegacyNexus PRIVATE
    ../inc
    ../mantid/Framework/Types/inc
    ../mantid/Framework/LegacyNexus/inc
    ${Boost_INCLUDE_DIRS}
)
set_property(TARGET LegacyNexus PROPERTY POSITION_INDEPENDENT_CODE ON)
