# microMantid

microMantid is a fork of [Mantid 6.12](https://github.com/mantidproject/mantid/releases/tag/v6.12.0) 
containing only a subset of the core Framework without the Workbench or GUI interfaces, and refactored
to use [pybind11](https://github.com/pybind/pybind11) instead of [boost::python](https://github.com/boostorg/python)
targetted at the [WebAssembly](https://webassembly.org/) platform so that it can run client-side-only
within a web-browser.

## Mantid

The [Mantid project](https://www.mantidproject.org) provides a framework that supports high-performance
computing and visualisation of scientific data. Mantid has been created to manipulate and analyse Neutron
and Muon scattering data, but could be applied to many other techniques.
The framework is open source and is supported on multiple target platforms (Windows, Linux, macOS).

## Building and testing

Note that only Linux builds are currently used and tested.
Emscripten does support Windows and MacOS if you want to try it yourself on those platform.

You need to install conda or mamba, and then you can run the script to install and set up the environment
and then use `pyodide` to build the project:

```
source ./setup_emsdk_env.sh
pyodide build
```

The wheel will be put in the `dist` folder and can be uploaded to the website.
To test the wheel you need to install `node.js`, then you can run:

```
npm install
npm test
```

If you want to build for the native architecture rather the for WebAssembly, you can run:

```
mamba create -n native python=3.12 pybind11 boost-cpp gxx poco jsoncpp zlib hdf5 pytest eigen muparser gsl
mamba activate native
mkdir build
cd build
cmake ..
cmake --build .
```

This will build the module file in the `build` folder. You can also use:

```
python -m pip wheel
``` 

to build a wheel instead. After installing the wheel you can run

```
python -m unittest
```

To run the tests.
