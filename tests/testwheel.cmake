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

file(MAKE_DIRECTORY
    ${CURRENT_BINARY_DIR}/mantid
)

file(WRITE ${CURRENT_BINARY_DIR}/mantid/__init__.py "from micromantid import *")
file(WRITE ${CURRENT_BINARY_DIR}/mantid/api.py "from micromantid.api import *")
file(WRITE ${CURRENT_BINARY_DIR}/mantid/dataobject.py "from micromantid.dataobject import *")
file(WRITE ${CURRENT_BINARY_DIR}/mantid/geometry.py "from micromantid.geometry import *")
file(WRITE ${CURRENT_BINARY_DIR}/mantid/kernel.py "from micromantid.kernel import *")

file(ARCHIVE_CREATE
    OUTPUT "micromantid_test-1.0.0-py2.py3-none-any.whl"
    WORKING_DIRECTORY ${CURRENT_BINARY_DIR}
    PATHS micromantid_test micromantid_test-1.0.0.dist-info mantid
    FORMAT "zip"
)

file(COPY
    ${CURRENT_BINARY_DIR}/micromantid_test-1.0.0-py2.py3-none-any.whl
    DESTINATION ${BINARY_DIR}
)
