set(SRC_FILES
    src/Json.cpp
)

add_library(Json OBJECT ${SRC_FILES})
target_include_directories(Json PRIVATE
    inc
    ../Kernel/inc
    ${Boost_INCLUDE_DIRS}
)
set_property(TARGET Json PROPERTY POSITION_INDEPENDENT_CODE ON)



