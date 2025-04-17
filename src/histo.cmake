set(HISTO_SRC_FILES
    ../mantid/Framework/HistogramData/src/BinEdges.cpp
    ../mantid/Framework/HistogramData/src/CountStandardDeviations.cpp
#   ../mantid/Framework/HistogramData/src/CountVariances.cpp
    ../mantid/Framework/HistogramData/src/Counts.cpp
#   ../mantid/Framework/HistogramData/src/EstimatePolynomial.cpp
#   ../mantid/Framework/HistogramData/src/Exception.cpp
    ../mantid/Framework/HistogramData/src/Frequencies.cpp
    ../mantid/Framework/HistogramData/src/FrequencyStandardDeviations.cpp
#   ../mantid/Framework/HistogramData/src/FrequencyVariances.cpp
    ../mantid/Framework/HistogramData/src/Histogram.cpp
#   ../mantid/Framework/HistogramData/src/HistogramBuilder.cpp
#   ../mantid/Framework/HistogramData/src/HistogramMath.cpp
#   ../mantid/Framework/HistogramData/src/Interpolate.cpp
    ../mantid/Framework/HistogramData/src/Points.cpp
#   ../mantid/Framework/HistogramData/src/Rebin.cpp
)
add_library(HistogramData OBJECT ${HISTO_SRC_FILES})
target_include_directories(HistogramData PRIVATE
    ../inc
    ../mantid/Framework/HistogramData/inc
    ../mantid/Framework/Kernel/inc
    ${Boost_INCLUDE_DIRS}
)
set_property(TARGET HistogramData PROPERTY POSITION_INDEPENDENT_CODE ON)
