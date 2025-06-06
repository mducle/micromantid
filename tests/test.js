test("MaterialBuilder", () => {
  let result = global.pyodide.runPython(`
    import pytest
    import micromantid
    builder = micromantid.kernel.MaterialBuilder()
    mat = builder.setFormula("Li F6").setMassDensity(0.1).build()
    assert mat.numberDensity == pytest.approx(0.0034858594422501514, 0.000001)
  `);
});

test("api_ADSValidatorTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/ADSValidatorTest") `); })
test("api_AlgorithmFactoryObserverTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/AlgorithmFactoryObserverTest") `); })
test("api_AlgorithmFactoryTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/AlgorithmFactoryTest") `); })
test("api_AlgorithmHistoryTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/AlgorithmHistoryTest") `); })
test("api_AlgorithmManagerTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/AlgorithmManagerTest") `); })
test("api_AlgorithmPropertyTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/AlgorithmPropertyTest") `); })
//test("api_AlgorithmTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/AlgorithmTest") `); })
test("api_AnalysisDataServiceObserverTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/AnalysisDataServiceObserverTest") `); })
test("api_AnalysisDataServiceTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/AnalysisDataServiceTest") `); })
test("api_AlgoRegisterTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/AlgoRegisterTest") `); })
test("api_AxisTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/AxisTest") `); })
//test("api_CatalogManagerTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/CatalogManagerTest") `); })
test("api_CompositeFunctionTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/CompositeFunctionTest") `); })
test("api_DataProcessorAlgorithmTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/DataProcessorAlgorithmTest") `); })
test("api_DeprecatedAlgorithmCheckerTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/DeprecatedAlgorithmCheckerTest") `); })
test("api_ExperimentInfoTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/ExperimentInfoTest") `); })
//test("api_FileFinderTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/FileFinderTest") `); })
test("api_FilePropertyTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/FilePropertyTest") `); })
test("api_FrameworkManagerTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/FrameworkManagerTest") `); })
test("api_FunctionFactoryTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/FunctionFactoryTest") `); })
test("api_FunctionPropertyTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/FunctionPropertyTest") `); })
test("api_IEventWorkspaceTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/IEventWorkspaceTest") `); })
test("api_IFunction1DTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/IFunction1DTest") `); })
test("api_IFunction1DValidatorTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/IFunction1DValidatorTest") `); })
test("api_IMaskWorkspaceTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/IMaskWorkspaceTest") `); })
test("api_IPeakFunctionTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/IPeakFunctionTest") `); })
test("api_IPeaksWorkspaceTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/IPeaksWorkspaceTest") `); })
test("api_ITableWorkspaceTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/ITableWorkspaceTest") `); })
test("api_JacobianTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/JacobianTest") `); })
test("api_MatrixWorkspaceTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/MatrixWorkspaceTest") `); })
test("api_MDEventWorkspaceTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/MDEventWorkspaceTest") `); })
test("api_MDGeometryTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/MDGeometryTest") `); })
test("api_MDHistoWorkspaceTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/MDHistoWorkspaceTest") `); })
test("api_MultipleExperimentInfos", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/MultipleExperimentInfos") `); })
//test("api_MultipleFilePropertyTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/MultipleFilePropertyTest") `); })
test("api_PreviewManagerTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/PreviewManagerTest") `); })
test("api_ProgressTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/ProgressTest") `); })
test("api_ProjectionTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/ProjectionTest") `); })
test("api_PythonAlgorithmChildAlgCallTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/PythonAlgorithmChildAlgCallTest") `); })
test("api_PythonAlgorithmPropertiesTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/PythonAlgorithmPropertiesTest") `); })
test("api_PythonAlgorithmTraitsTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/PythonAlgorithmTraitsTest") `); })
test("api_PythonAlgorithmWorkspacePropertyTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/PythonAlgorithmWorkspacePropertyTest") `); })
test("api_RunPythonScriptTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/RunPythonScriptTest") `); })
test("api_RunTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/RunTest") `); })
//test("api_SampleTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/SampleTest") `); })
test("api_SpectrumInfoTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/SpectrumInfoTest") `); })
test("api_WorkspaceBinaryOpsTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/WorkspaceBinaryOpsTest") `); })
test("api_WorkspaceFactoryTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/WorkspaceFactoryTest") `); })
test("api_WorkspaceGroupTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/WorkspaceGroupTest") `); })
//test("api_WorkspaceHistoryTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/WorkspaceHistoryTest") `); })
test("api_WorkspacePropertiesTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/WorkspacePropertiesTest") `); })
test("api_WorkspaceTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/WorkspaceTest") `); })
test("api_WorkspaceUnaryOpsTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/WorkspaceUnaryOpsTest") `); })
test("api_WorkspaceValidatorsTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("api/WorkspaceValidatorsTest") `); })

test("kernel_AmendConfigTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/AmendConfigTest") `); })
test("kernel_ArrayBoundedValidatorTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/ArrayBoundedValidatorTest") `); })
test("kernel_ArrayLengthValidatorTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/ArrayLengthValidatorTest") `); })
test("kernel_ArrayOrderedPairsValidatorTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/ArrayOrderedPairsValidatorTest") `); })
test("kernel_ArrayPropertyTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/ArrayPropertyTest") `); })
test("kernel_BoundedValidatorTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/BoundedValidatorTest") `); })
test("kernel_CompositeValidatorTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/CompositeValidatorTest") `); })
test("kernel_ConfigObserverTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/ConfigObserverTest") `); })
test("kernel_ConfigPropertyObserverTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/ConfigPropertyObserverTest") `); })
test("kernel_DateAndTimeTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/DateAndTimeTest") `); })
test("kernel_DeltaEModeTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/DeltaEModeTest") `); })
test("kernel_EnabledWhenPropertyTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/EnabledWhenPropertyTest") `); })
test("kernel_FacilityInfoTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/FacilityInfoTest") `); })
test("kernel_FilteredTimeSeriesPropertyTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/FilteredTimeSeriesPropertyTest") `); })
test("kernel_HTTPStatusTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/HTTPStatusTest") `); })
test("kernel_InstrumentInfoTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/InstrumentInfoTest") `); })
test("kernel_IPropertySettingsTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/IPropertySettingsTest") `); })
test("kernel_ListValidatorTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/ListValidatorTest") `); })
test("kernel_LiveListenerInfoTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/LiveListenerInfoTest") `); })
test("kernel_LogFilterTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/LogFilterTest") `); })
test("kernel_LoggerTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/LoggerTest") `); })
test("kernel_MandatoryValidatorTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/MandatoryValidatorTest") `); })
test("kernel_MantidVersionTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/MantidVersionTest") `); })
test("kernel_MaterialBuilderTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/MaterialBuilderTest") `); })
test("kernel_MemoryStatsTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/MemoryStatsTest") `); })
test("kernel_NullValidatorTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/NullValidatorTest") `); })
test("kernel_OptionalBoolTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/OptionalBoolTest") `); })
test("kernel_PhysicalConstantsTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/PhysicalConstantsTest") `); })
test("kernel_ProgressBaseTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/ProgressBaseTest") `); })
test("kernel_PropertyHistoryTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/PropertyHistoryTest") `); })
test("kernel_PropertyManagerDataServiceTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/PropertyManagerDataServiceTest") `); })
test("kernel_PropertyManagerPropertyTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/PropertyManagerPropertyTest") `); })
test("kernel_PropertyManagerTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/PropertyManagerTest") `); })
test("kernel_PropertyWithValueTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/PropertyWithValueTest") `); })
test("kernel_PythonPluginsTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/PythonPluginsTest") `); })
test("kernel_QuatTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/QuatTest") `); })
test("kernel_RebinParamsValidatorTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/RebinParamsValidatorTest") `); })
test("kernel_StatisticsTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/StatisticsTest") `); })
test("kernel_StringContainsValidatorTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/StringContainsValidatorTest") `); })
test("kernel_TimeSeriesPropertyTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/TimeSeriesPropertyTest") `); })
test("kernel_UnitConversionTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/UnitConversionTest") `); })
test("kernel_UnitFactoryTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/UnitFactoryTest") `); })
test("kernel_UnitLabelTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/UnitLabelTest") `); })
test("kernel_UnitsTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/UnitsTest") `); })
//test("kernel_UsageServiceTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/UsageServiceTest") `); })
test("kernel_V3DTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/V3DTest") `); })
test("kernel_VisibleWhenPropertyTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/VisibleWhenPropertyTest") `); })
test("kernel_VMDTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/VMDTest") `); })

test("geom_BoundingBoxTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("geometry/BoundingBoxTest") `); })
test("geom_ComponentInfoTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("geometry/ComponentInfoTest") `); })
test("geom_CrystalStructureTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("geometry/CrystalStructureTest") `); })
test("geom_CSGObjectTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("geometry/CSGObjectTest") `); })
test("geom_DetectorInfoTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("geometry/DetectorInfoTest") `); })
test("geom_GoniometerTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("geometry/GoniometerTest") `); })
test("geom_GroupTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("geometry/GroupTest") `); })
test("geom_IComponentTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("geometry/IComponentTest") `); })
test("geom_InstrumentTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("geometry/InstrumentTest") `); })
test("geom_IPeakTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("geometry/IPeakTest") `); })
test("geom_OrientedLatticeTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("geometry/OrientedLatticeTest") `); })
test("geom_PeakShapeTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("geometry/PeakShapeTest") `); })
test("geom_PointGroupTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("geometry/PointGroupTest") `); })
test("geom_RectangularDetectorTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("geometry/RectangularDetectorTest") `); })
test("geom_ReflectionGeneratorTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("geometry/ReflectionGeneratorTest") `); })
test("geom_SpaceGroupTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("geometry/SpaceGroupTest") `); })
test("geom_SymmetryElementTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("geometry/SymmetryElementTest") `); })
test("geom_SymmetryOperationTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("geometry/SymmetryOperationTest") `); })
test("geom_UnitCellTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("geometry/UnitCellTest") `); })

test("datobj_EventListTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("dataobjects/EventListTest") `); })
test("datobj_GroupingWorkspaceTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("dataobjects/GroupingWorkspaceTest") `); })
test("datobj_PeakShapes", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("dataobjects/PeakShapes") `); })
//test("datobj_SpecialWorkspace2DTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("dataobjects/SpecialWorkspace2DTest") `); })
//test("datobj_Workspace2DPickleTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("dataobjects/Workspace2DPickleTest") `); })
test("datobj_WorkspaceValidatorsTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("dataobjects/WorkspaceValidatorsTest") `); })

test("alg_NormaliseToUnityTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("algorithms/NormaliseToUnityTest") `); })
// The next test messes up the configurations causing other tests to fail if run before.
test("kernel_ConfigServiceTest", () => { let result = global.pyodide.runPython(` import micromantid_test; micromantid_test.run("kernel/ConfigServiceTest") `); })
