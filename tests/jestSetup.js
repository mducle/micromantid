const { loadPyodide } = require("pyodide");
const { glob } = require("glob");

module.exports = async () => {
  let pyodide = await loadPyodide({
    indexURL: "node_modules/pyodide",
  });
  await pyodide.loadPackage("pytest")
  await pyodide.loadPackage("numpy")
  const wheels = await glob("dist/*whl");
  for (const wheel of wheels) {
    await pyodide.loadPackage(wheel); }
  console.log("Loaded Pyodide and wheels");
  const test_wheels = await glob("tests/testhelpers/dist/*whl");
  for (const wheel of test_wheels) {
    await pyodide.loadPackage(wheel); }
  global.pyodide = pyodide;
};


