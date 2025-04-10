set(JSON_SRC_FILES
    ../mantid/Framework/Json/src/Json.cpp
)
add_library(Json OBJECT ${JSON_SRC_FILES})
target_include_directories(Json PRIVATE
    ../inc
    ../mantid/Framework/Json/inc
    ../mantid/Framework/Kernel/inc
    ${Boost_INCLUDE_DIRS}
)
set_property(TARGET Json PROPERTY POSITION_INDEPENDENT_CODE ON)
