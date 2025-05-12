file(GLOB instrument_files ${CURRENT_SOURCE_DIR}/../mantid/instrument/*)

file(COPY
    ${instrument_files}
    DESTINATION ${CURRENT_BINARY_DIR}/mantid_instruments
)

file(MAKE_DIRECTORY
    ${CURRENT_BINARY_DIR}/mantid_instruments-1.0.0.dist-info
)

file(ARCHIVE_CREATE
    OUTPUT "mantid_instruments-1.0.0-py2.py3-none-any.whl"
    WORKING_DIRECTORY ${CURRENT_BINARY_DIR}
    PATHS mantid_instruments mantid_instruments-1.0.0.dist-info
    FORMAT "zip"
)

file(COPY
    ${CURRENT_BINARY_DIR}/mantid_instruments-1.0.0-py2.py3-none-any.whl
    DESTINATION ${BINARY_DIR}
)
