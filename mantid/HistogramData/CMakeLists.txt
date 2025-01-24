set(SRC_FILES
    src/Histogram.cpp
    src/BinEdges.cpp
    src/Counts.cpp
    src/CountStandardDeviations.cpp
    src/Frequencies.cpp
    src/FrequencyStandardDeviations.cpp
    src/Points.cpp
)

add_library(HistogramData OBJECT ${SRC_FILES})
target_include_directories(HistogramData PRIVATE
    inc
    ../Kernel/inc
    ${Boost_INCLUDE_DIRS}
)
set_property(TARGET HistogramData PROPERTY POSITION_INDEPENDENT_CODE ON)

