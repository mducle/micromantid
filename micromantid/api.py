from ._micromantid import _api
from ._utils import lazy_instance_access, add_to_globals
from .funcinspect import customise_func, lhs_info, LazyMethodSignature
import sys
add_to_globals(_api, globals())

from . import _workspaceops

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

sys.modules[f'{__name__}._workspaceops'] = _workspaceops
