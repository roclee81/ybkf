package com.shuxin.commons.enums;

public enum CostStructEnum {
	
	
	SEARCHBZRCECHARTS("searchbzrcECharts","searchbzrcECharts"),
	SEARCHBZXEECHARTS("searchbzxeECharts","searchbzxeECharts"),
	FINDMONTHCOSTOFMG("findmonthcostofMg","findmonthcostofMg"),
	MONTHLYINDICATORTREND("monthlyIndicatorTrend","monthlyIndicatorTrend"),
	WGDEPARTORDER("wgdepartOrder","wgdepartOrder"),
	MZWGDEPARTORDER("mzwgdepartOrder","mzwgdepartOrder"),
	MZWGDOCTORORDER("mzwgDoctorOrder","mzwgDoctorOrder"),
	MGWGDOCTORORDER("mgwgDoctorOrder","mgwgDoctorOrder"),
	WGGZORDER("wggzOrder","wggzOrder"),
	MZWGGZORDER("mzwggzOrder","mzwggzOrder"),
	mgdoctordatagrid("mgDoctorDataGrid","mgDoctorDataGrid"),
	MGPATIENTDATAGRID("mgPatientDataGrid","mgPatientDataGrid"),
	MZDJDATAGRID("mzdjDataGrid","mzdjDataGrid"),
	MGDJDATAGRID("mgdjDataGrid","mgdjDataGrid"),
	GETWGXXBYLSH("getWGXXByLSH","getWGXXByLSH"),
	  GETZFTXBYLSH("getZFTXByLSH","getZFTXByLSH"),
	  GETYZMXBYLSH("getYZMXByLSH","getYZMXByLSH"),
	  GETFYMXBYLSH("getFYMXByLSH","getFYMXByLSH"),
	  SELECTBYLSH("selectByLsh","selectByLsh"),
	  GETFYZBYJBYLSH("getFYZBYJByLSH","getFYZBYJByLSH"),
	  CHECKSTATE("checkState","checkState"),
	  SELECTBIGMONEYCHECK("selectBigmoneycheck","selectBigmoneycheck"),
	  MZTABLE("mzTable","mzTable"),	  
	  MZVIOLATIONDOCUMENTS("mzViolationsDocuments","mzViolationsDocuments"),
	  PATIENTENQUIRY("patientEnquiry","patientEnquiry"),
	  MEDICALINFORMATION("medicalInformation","medicalInformation"),
	  //预算监控
	  FINDMONTHLYQUOTA("findquota","findquota"),
	  //门规病种-病种统计-重点月就诊人次
	  KEYPATIENTSCHART("keypatientsChart","keypatientsChart"),
	  //门规病种-患者监控-就诊记录
	  MEDICALRECORDS("medicalRecords","medicalRecords"),

	  MZLINECHART("mzlinechart","mzlinechart"),
	  

	  //出院评价-费用统计-月度变化趋势
	  MONTHLYTRENDCOST("monthlyTrendCost","monthlyTrendCost"),
	  //出院评价-违规汇总-规则
	  ZYWGGZORDER("zywggzOrder","zywggzOrder"),
	  //出院评价-违规汇总-科室
	  ZYWGDEPARTORDER("zywgdepartOrder","zywgdepartOrder"),
	  //出院评价-违规汇总-医师
	  ZYWGDOCTORORDER("zywgDoctorOrder","zywgDoctorOrder"),
	  //出院评价-重点监控-住院费用超额
	  OVERHOSPITALIZATION("overhospitalization","overhospitalization"),
	  //出院评价-重点监控-住院时间超长
	  HOSPITALSTAY("hospitalStay","hospitalStay"),
	  //全院概览-普通住院-月度变化趋势
	  MONTHLYTRENDPTZY("monthlyTrendPTZY","monthlyTrendPTZY"),
	  //全院概览-住院病种-月度变化趋势
	  MONTHLYTRENDZYBZ("monthlyTrendZYBZ","monthlyTrendZYBZ"),
	  
	// 规则审核-门诊审核-处方明细
	GETCFMXBYLSH("getCFMXByLSH", "getCFMXByLSH"),
	// 规则审核-门诊审核-收费明细
	GETSFMXBYLSH("getSFMXByLSH", "getSFMXByLSH"),
	// 规则审核-可疑单据查询
	MZKYDJDATAGRID("mzkydjDataGrid", "mzkydjDataGrid"),
	// 住院审核-医嘱明细
	DOCDETAIL("docDetail", "docDetail"),
	// 住院审核-费用明细
	COSTDETAIL("costDetail", "costDetail"),
	// 违规统计-违规规则排序
	RULEORDERINGTABLE("ruleOrderingTable","ruleOrderingTable"),
	// 违规统计-违规科室排序
	DEPARTORDERINGTABLE("departOrderingTable","departOrderingTable"),
	// 违规统计-违规医师排序
	DOCTORORDERINGTABLE("doctorOrderingTable","doctorOrderingTable"),
	  
	  /*SELECTADDRESSPOPULATION("addressPopulation","SelectAddressPopulation"),
	  GET_INVOICE_BY_CONDITION("getInvoiceByCondition","getInvoiceByCondition"),
	  SELECTFUNDUSEOFDEPART("circleEChartsOfCost","SelectFundUseOfdepart"),
	  SELECTCOSTFLAGOFMONTH("costFlagofMonth","SelectCostFlagofMonth"),
	  SINGLEDISEASESEARCH("singleDiseaseSearch","singleDiseaseSearch"),
	  GETPATIENTINFO("getPatientInfo","getPatientInfo"),
	  selectDoctorAdviceByLsh("selectDoctorAdviceByLsh","selectDoctorAdviceByLsh"),
	  selectCostDetailByLsh("selectCostDetailByLsh","selectCostDetailByLsh"),
	  getWGXXByLSH("getWGXXByLSH","getWGXXByLSH"),
	  getZFTXByLSH("getZFTXByLSH","getZFTXByLSH"),
	  getLJBYByLSH("getLJBYByLSH","getLJBYByLSH"),
	  getYZMXByLSH("getYZMXByLSH","getYZMXByLSH"),
	  getFYMXByLSH("getFYMXByLSH","getFYMXByLSH"),
	  GETFYMXBYLSH("getCFINFO","getCFINFO"),
	  GETMTBFYZBYJBYLSH("getMTBFYZBYJByLSH","selectMTBFYZBYJByLSH"),
	  GETOUTHOSPITAL("getOutHospital","getOutHospital"),
	  getYPFXByDateAndKSBM("getYPFXByDateAndKSBM","getYPFXByDateAndKSBM"),
	  getLineByDrugCodeAndYear("getLineByDrugCodeAndYear","getLineByDrugCodeAndYear"),
	  getLineGroupByDepartment("getLineGroupByDepartment","getLineGroupByDepartment"),
	  getJCJYLineByCondition("getJCJYLineByCondition","getJCJYLineByCondition"),
	  getJYJCByDepart("getJYJCByDepart","getJYJCByDepart"),
	  getTreatmentByDepart("getTreatmentByDepart","getTreatmentByDepart"),
	  selectOperationInfoBySSDJ("selectOperationInfoBySSDJ","selectOperationInfoBySSDJ"),
	  selectOperationInfoByDepart("selectOperationInfoByDepart","selectOperationInfoByDepart"),
	  selectConsumablePie("selectConsumablePie","selectConsumablePie"),
	  selectConsumableByMonth("selectConsumableByMonth","selectConsumableByMonth"),
	  selectConsumableByDepart("selectConsumableByDepart","selectConsumableByDepart"),
	  getSHWGGroupByDepart("getSHWGGroupByDepart","getSHWGGroupByDepart"),
	  getSHWGGroupByRule("getSHWGGroupByRule","getSHWGGroupByRule"),
	  getSHWGGridByDepart("getSHWGGridByDepart","getSHWGGridByDepart"),
	  getSHWGGridByDoctor("getSHWGGridByDoctor","getSHWGGridByDoctor"),
	  aaa("aaa","aaa"),
	  selectDoctorGroupInfo("selectDoctorGroupInfo","selectDoctorGroupInfo"),*/
	;
	
	private String  key;

	private String value;
	
	CostStructEnum(String key, String value) {
		this.key = key;
		this.value = value;
	}
	
	public static String getEnumValue(String key) {
		 for (CostStructEnum c : CostStructEnum.values()) 
		 {
			 if (c.getKey() .equals(key) ) 
			 {
				   return c.value;
			}
		 }
		
		return null;
	}
	

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
}
