const { loadPyodide } = require("pyodide");
const { glob } = require("glob");

module.exports = async () => {
  let pyodide = await loadPyodide({
    indexURL: "node_modules/pyodide",
  });
  await pyodide.loadPackage(["pytest", "numpy", "python-dateutil", "pytz"])
  const wheels = await glob("dist/*whl");
  for (const wheel of wheels) {
    await pyodide.loadPackage(wheel); }
  console.log("Loaded Pyodide and wheels");
  const test_wheels = await glob("tests/testhelpers/dist/*whl");
  for (const wheel of test_wheels) {
    await pyodide.loadPackage(wheel); }
  global.pyodide = pyodide;
  global.pyodide.runPython(`
    from mantid import config
    import os, micromantid_test
    config.appendDataSearchDir(os.path.join(os.path.dirname(micromantid_test.__file__), 'data'))
  `);
};


