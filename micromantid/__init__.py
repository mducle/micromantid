import os
os.environ['MANTIDPATH'] = os.path.dirname(__file__)

from . import _micromantid
from ._micromantid import _api, _kernel, _geometry, _dataobjects
from . import kernel, api, geometry, dataobjects
from .api import mtd, FileFinder, AnalysisDataService
from .kernel import config

def apiVersion():
    return 2
