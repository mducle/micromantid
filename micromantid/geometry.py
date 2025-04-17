from ._micromantid import _geometry
from ._utils import lazy_instance_access, add_to_globals

add_to_globals(_geometry, globals())

SpaceGroupFactory = lazy_instance_access(SpaceGroupFactoryImpl)
SymmetryOperationFactory = lazy_instance_access(SymmetryOperationFactoryImpl)
SymmetryElementFactory = lazy_instance_access(SymmetryElementFactoryImpl)
PointGroupFactory = lazy_instance_access(PointGroupFactoryImpl)
