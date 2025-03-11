set(SRC_FILES
    src/napi.cpp
    src/napi4.cpp
    src/napi5.cpp
    src/NeXusException.cpp
    src/NeXusFile.cpp
    src/nxstack.cpp
    src/stptok.cpp
)

add_library(NexusCpp OBJECT ${SRC_FILES})
target_include_directories(NexusCpp PRIVATE
    inc
    ${Boost_INCLUDE_DIRS}
)
set_property(TARGET NexusCpp PROPERTY POSITION_INDEPENDENT_CODE ON)
