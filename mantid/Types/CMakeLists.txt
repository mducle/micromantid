set(SRC_FILES
    src/Core/DateAndTime.cpp
    src/Core/DateAndTimeHelpers.cpp
)

add_library(Types OBJECT ${SRC_FILES})
target_include_directories(Types PRIVATE
    inc
    ${Boost_INCLUDE_DIRS}
)
set_property(TARGET Types PROPERTY POSITION_INDEPENDENT_CODE ON)




