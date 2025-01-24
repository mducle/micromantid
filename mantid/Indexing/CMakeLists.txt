set(SRC_FILES
    src/IndexInfo.cpp
    src/Partitioner.cpp
    src/RoundRobinPartitioner.cpp
    src/SpectrumNumberTranslator.cpp
)

add_library(Indexing OBJECT ${SRC_FILES})
target_include_directories(Indexing PRIVATE
    inc
    ../Kernel/inc
    ../Types/inc
    ${Boost_INCLUDE_DIRS}
)
set_property(TARGET Indexing PROPERTY POSITION_INDEPENDENT_CODE ON)


