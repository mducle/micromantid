set(TYPES_SRC_FILES
    ../mantid/Framework/Types/src/Core/DateAndTime.cpp
    ../mantid/Framework/Types/src/Core/DateAndTimeHelpers.cpp
)
add_library(Types OBJECT ${TYPES_SRC_FILES})
target_include_directories(Types PRIVATE
    ../inc
    ../mantid/Framework/Types/inc
    ${Boost_INCLUDE_DIRS}
)
set_property(TARGET Types PROPERTY POSITION_INDEPENDENT_CODE ON)
