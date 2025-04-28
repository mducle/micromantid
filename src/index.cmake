set(INDEX_SRC_FILES
    ../mantid/Framework/Indexing/src/Extract.cpp
#   ../mantid/Framework/Indexing/src/Group.cpp
    ../mantid/Framework/Indexing/src/IndexInfo.cpp
#   ../mantid/Framework/Indexing/src/LegacyConversion.cpp
    ../mantid/Framework/Indexing/src/Partitioner.cpp
    ../mantid/Framework/Indexing/src/RoundRobinPartitioner.cpp
    ../mantid/Framework/Indexing/src/SpectrumNumberTranslator.cpp
)
add_library(Indexing OBJECT ${INDEX_SRC_FILES})
target_include_directories(Indexing PRIVATE
    ../inc
    ../mantid/Framework/Indexing/inc
    ../mantid/Framework/Kernel/inc
    ../mantid/Framework/Types/inc
    ${Boost_INCLUDE_DIRS}
)
set_property(TARGET Indexing PROPERTY POSITION_INDEPENDENT_CODE ON)
