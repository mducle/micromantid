import os
os.environ['MANTIDPATH'] = os.path.dirname(__file__)

from . import kernel as _kernel
from . import api as _api
from . import geometry as _geometry
from . import dataobjects as _dataobjects

from .kernel import *
from .api import *

def apiVersion():
    return 2

# Make the version string and info accessible in the standard way
from .kernel import version_str as _version_str
from .kernel import version  # noqa: F401

__version__ = _version_str()
