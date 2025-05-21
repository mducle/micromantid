file(COPY
    ${CURRENT_SOURCE_DIR}/../mantid/Framework/PythonInterface/test/python/mantid/api
    ${CURRENT_SOURCE_DIR}/../mantid/Framework/PythonInterface/test/python/mantid/kernel
    ${CURRENT_SOURCE_DIR}/../mantid/Framework/PythonInterface/test/python/mantid/geometry
    ${CURRENT_SOURCE_DIR}/../mantid/Framework/PythonInterface/test/python/mantid/dataobjects
    DESTINATION ${CURRENT_BINARY_DIR}/micromantid_test
)

file(COPY
    ${CURRENT_SOURCE_DIR}/../mantid/Framework/Algorithms/test/NormaliseToUnityTest.py
    DESTINATION ${CURRENT_BINARY_DIR}/micromantid_test/algorithms
)

file(COPY_FILE
    ${CURRENT_SOURCE_DIR}/runTest.py 
    ${CURRENT_BINARY_DIR}/micromantid_test/__init__.py
)

file(MAKE_DIRECTORY
    ${CURRENT_BINARY_DIR}/micromantid_test-1.0.0.dist-info
)

file(MAKE_DIRECTORY ${CURRENT_BINARY_DIR}/micromantid_test/data)
file(GLOB_RECURSE TestDataFiles "${CURRENT_SOURCE_DIR}/test_data/*md5")
foreach(_datafile ${TestDataFiles})
    cmake_path(GET _datafile FILENAME _datafile)
    string(REGEX REPLACE "\\.md5$" "" _datafile ${_datafile})
    file(READ_SYMLINK ${CURRENT_BINARY_DIR}/test_data/${_datafile} _linkname)
    file(COPY_FILE test_data/${_linkname} ${CURRENT_BINARY_DIR}/micromantid_test/data/${_datafile})
endforeach()

file(MAKE_DIRECTORY ${CURRENT_BINARY_DIR}/mantid)
file(MAKE_DIRECTORY ${CURRENT_BINARY_DIR}/mantid/api)
file(MAKE_DIRECTORY ${CURRENT_BINARY_DIR}/mantid/kernel)

file(WRITE ${CURRENT_BINARY_DIR}/mantid/__init__.py "from micromantid import *")
file(WRITE ${CURRENT_BINARY_DIR}/mantid/api/__init__.py "from micromantid.api import *")
file(WRITE ${CURRENT_BINARY_DIR}/mantid/api/_workspaceops.py "from micromantid.api._workspaceops import *")
file(WRITE ${CURRENT_BINARY_DIR}/mantid/dataobjects.py "from micromantid.dataobjects import *")
file(WRITE ${CURRENT_BINARY_DIR}/mantid/geometry.py "from micromantid.geometry import *")
file(WRITE ${CURRENT_BINARY_DIR}/mantid/kernel/__init__.py
    "from micromantid.kernel import *\n"
    "import sys; sys.modules[f'{__name__}.funcinspect'] = funcinspect")
file(WRITE ${CURRENT_BINARY_DIR}/mantid/kernel/plugins.py "from micromantid.kernel.plugins import *")
file(WRITE ${CURRENT_BINARY_DIR}/mantid/simpleapi.py 
    "from micromantid.simpleapi import *\n"
    "from micromantid.simpleapi import _create_algorithm_function as _create_alg_fn\n"
    "def _create_algorithm_function(name, version, algm_object):\n"
    "   alg_wrapper = _create_alg_fn(name, version, algm_object)\n"
    "   globals()[name] = alg_wrapper\n"
    "   return alg_wrapper")

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
