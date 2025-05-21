# Mantid Repository : https://github.com/mantidproject/mantid
#
# Copyright &copy; 2018 ISIS Rutherford Appleton Laboratory UKRI,
#   NScD Oak Ridge National Laboratory, European Spallation Source,
#   Institut Laue - Langevin & CSNS, Institute of High Energy Physics, CAS
# SPDX - License - Identifier: GPL - 3.0 +
# ruff: noqa: E402,F403   # Allow module import not at top and wild imports
"""
kernel
=============

Defines Python objects that wrap the C++ Kernel namespace.

"""

###############################################################################
# Make modules available in this namespace
###############################################################################
# Imports boost.mpi if applicable
from . import funcinspect

# module alias for backwards-compatibility in user scripts
funcreturns = funcinspect

###############################################################################
# Load the C++ library
###############################################################################
from ..utils import lazy_instance_access, add_to_globals
from .._micromantid import _kernel
add_to_globals(_kernel, globals())

ConfigService = lazy_instance_access(ConfigServiceImpl, key_as_str=True)
PropertyManagerDataService = lazy_instance_access(PropertyManagerDataServiceImpl, key_as_str=True)
UnitFactory = lazy_instance_access(UnitFactoryImpl)

config = ConfigService
pmds = PropertyManagerDataService
logger = Logger("Python")

from .AmendConfig import amend_config  # noqa: F401

