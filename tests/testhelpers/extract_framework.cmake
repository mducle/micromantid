file(ARCHIVE_EXTRACT
    INPUT ${MAINWHEEL}
    DESTINATION ${CURRENT_BINARY_DIR}
    PATTERNS *_micromantid*
)
file(GLOB FRAMEWORK_LIB ${CURRENT_BINARY_DIR}/*/_micromantid*)
if (FRAMEWORK_LIB STREQUAL "")
    message(FATAL_ERROR "Could not extract C++ Mantid Framework library from wheel")
endif()
file(RENAME ${FRAMEWORK_LIB} ${CURRENT_BINARY_DIR}/_micromantid.so)
