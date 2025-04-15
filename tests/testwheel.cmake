file(COPY
    ${CURRENT_SOURCE_DIR}/../mantid/Framework/PythonInterface/test/python/mantid/api
    DESTINATION ${CURRENT_BINARY_DIR}/micromantid_test
)

file(COPY_FILE
    ${CURRENT_SOURCE_DIR}/runTest.py 
    ${CURRENT_BINARY_DIR}/micromantid_test/__init__.py
)

file(MAKE_DIRECTORY
    ${CURRENT_BINARY_DIR}/micromantid_test-1.0.0.dist-info
)

file(ARCHIVE_CREATE
    OUTPUT "micromantid_test-1.0.0-py2.py3-none-any.whl"
    WORKING_DIRECTORY ${CURRENT_BINARY_DIR}
    PATHS micromantid_test micromantid_test-1.0.0.dist-info
    FORMAT "zip"
)

file(COPY
    ${CURRENT_BINARY_DIR}/micromantid_test-1.0.0-py2.py3-none-any.whl
    DESTINATION ${BINARY_DIR}
)
