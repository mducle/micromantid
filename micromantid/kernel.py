from ._micromantid import _kernel
from ._utils import lazy_instance_access, add_to_globals
from . import _funcinspect as funcinspect

add_to_globals(_kernel, globals())

ConfigService = lazy_instance_access(ConfigServiceImpl, key_as_str=True)
PropertyManagerDataService = lazy_instance_access(PropertyManagerDataServiceImpl, key_as_str=True)
UnitFactory = lazy_instance_access(UnitFactoryImpl)

config = ConfigService
pmds = PropertyManagerDataService
logger = Logger("Python")

from contextlib import contextmanager
from typing import Union

@contextmanager
def amend_config(
    facility: str = None, instrument: str = None, data_dir: Union[str, list] = None, prepend_datadir: bool = True, **kwargs
) -> None:
    """
    Context manager to safely modify :ref:`Mantid Configuration Service <Config Service>` while the function is executed.
    """
    from copy import deepcopy

    modified_keys = list()
    backup = dict()
    config = ConfigService.Instance()
    DEFAULT_FACILITY = "default.facility"
    DEFAULT_INSTRUMENT = "default.instrument"
    SEARCH_ARCHIVE = "datasearch.searcharchive"
    DATASEARCH_DIR = "datasearch.directories"

    backup[DEFAULT_FACILITY] = config[DEFAULT_FACILITY]
    backup[DEFAULT_INSTRUMENT] = config[DEFAULT_INSTRUMENT]

    if facility:
        config.setFacility(facility)
        modified_keys.append(DEFAULT_FACILITY)
        modified_keys.append(DEFAULT_INSTRUMENT)
    logger.information(f"kernel.amend_config: using default.facility {config[DEFAULT_FACILITY]}")

    if instrument:
        config[DEFAULT_INSTRUMENT] = instrument
        if DEFAULT_INSTRUMENT not in modified_keys:
            modified_keys.append(DEFAULT_INSTRUMENT)
    logger.information(f"kernel.amend_config: using default.instrument {config[DEFAULT_INSTRUMENT]}")

    if data_dir is not None:
        data_dirs = (
            [
                data_dir,
            ]
            if isinstance(data_dir, str)
            else data_dir
        )
        backup[DATASEARCH_DIR] = deepcopy(config[DATASEARCH_DIR])
        modified_keys.append(DATASEARCH_DIR)
        # Prepend or replace data search dirs
        if prepend_datadir:
            config.setDataSearchDirs(data_dirs + list(config.getDataSearchDirs()))
        else:
            config.setDataSearchDirs(data_dirs)

    if kwargs is not None:
        if SEARCH_ARCHIVE not in kwargs:
            kwargs[SEARCH_ARCHIVE] = "hfir, sns"
        for key, val in kwargs.items():
            backup[key] = config[key]
            config[key] = val
            modified_keys.append(key)

    try:
        yield
    finally:
        for key in modified_keys:
            config[key] = backup[key]
