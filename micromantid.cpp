#include <boost/python/module.hpp>
#include <boost/python/scope.hpp>
#include <boost/python/docstring_options.hpp>

// See http://docs.scipy.org/doc/numpy/reference/c-api.array.html#PY_ARRAY_UNIQUE_SYMBOL
#define PY_ARRAY_UNIQUE_SYMBOL MICROMANTID_ARRAY_API
#include <numpy/arrayobject.h>

#include "registrations.hpp"

void init_kernel();
void init_geometry();
void init_api();
void init_dataobjects();

BOOST_PYTHON_MODULE(_micromantid)
{
  // Doc string options - User defined, python arguments, C++ call signatures
  boost::python::docstring_options docstrings(true, true, false);
  // Import numpy
  _import_array();

  // https://linuxtut.com/en/038bf30933d56cb845af/
  boost::python::object package = boost::python::scope();
  package.attr("__path__") = "micromantid";
  init_kernel();
  init_geometry();
  init_api();
  init_dataobjects();
#ifdef EMSCRIPTEN
  Mantid::DataObjects::register_ws_Workspace2D();
  Mantid::DataObjects::register_ws_MaskWorkspace();
  Mantid::DataObjects::register_ws_EventWorkspace();
  Mantid::DataObjects::register_ws_PeaksWorkspace();
  Mantid::DataObjects::register_ws_RebinnedOutput();
  Mantid::DataObjects::register_ws_TableWorkspace();
  Mantid::DataObjects::register_ws_GroupingWorkspace();
  Mantid::DataObjects::register_ws_SpecialWorkspace2D();
  Mantid::DataObjects::register_ws_WorkspaceSingleValue();
  Mantid::DataObjects::register_ws_LeanElasticPeaksWorkspace();
#endif
}
