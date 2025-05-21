# Mantid Repository : https://github.com/mantidproject/mantid
#
# Copyright &copy; 2018 ISIS Rutherford Appleton Laboratory UKRI,
#   NScD Oak Ridge National Laboratory, European Spallation Source,
#   Institut Laue - Langevin & CSNS, Institute of High Energy Physics, CAS
# SPDX - License - Identifier: GPL - 3.0 +
# ruff: noqa: E402,F403   # Allow module import not at top and wild imports
"""
api
===

Defines Python objects that wrap the C++ API namespace.

"""

###############################################################################
# Load the C++ library
###############################################################################
from .._micromantid import _api
from ..utils import lazy_instance_access, add_to_globals
add_to_globals(_api, globals())

###############################################################################
# Make aliases accessible in this namespace
###############################################################################
AnalysisDataService = lazy_instance_access(AnalysisDataServiceImpl, key_as_str=True)
AlgorithmFactory = lazy_instance_access(AlgorithmFactoryImpl)
AlgorithmManager = lazy_instance_access(AlgorithmManagerImpl)
FileFinder = lazy_instance_access(FileFinderImpl)
FileLoaderRegistry = lazy_instance_access(FileLoaderRegistryImpl)
FrameworkManager = lazy_instance_access(FrameworkManagerImpl)
FunctionFactory = lazy_instance_access(FunctionFactoryImpl)
WorkspaceFactory = lazy_instance_access(WorkspaceFactoryImpl)
AlgoTimeRegister = lazy_instance_access(AlgoTimeRegisterImpl)
mtd = AnalysisDataService

###############################################################################
# Attach additional operators to workspaces
###############################################################################
from . import _workspaceops

_workspaceops.attach_binary_operators_to_workspace()
_workspaceops.attach_unary_operators_to_workspace()
_workspaceops.attach_tableworkspaceiterator()

###############################################################################
# Add importAll member to ADS.
#
# Must be imported AFTER all the api members
# have been added to the mantid.api namespace above!
###############################################################################
from . import _adsimports

