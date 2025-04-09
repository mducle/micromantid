#include <boost/python/module.hpp>
#include <boost/python/scope.hpp>
#include <boost/python/docstring_options.hpp>

// See http://docs.scipy.org/doc/numpy/reference/c-api.array.html#PY_ARRAY_UNIQUE_SYMBOL
#define PY_ARRAY_UNIQUE_SYMBOL MICROMANTID_ARRAY_API
#include <numpy/arrayobject.h>

void init_kernel();
void init_geometry();
void init_api();

BOOST_PYTHON_MODULE(micromantid)
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
}
