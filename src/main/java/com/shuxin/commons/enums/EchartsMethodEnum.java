package com.shuxin.commons.enums;

public enum EchartsMethodEnum {
    

	
	
	deaprtover("selectDepartOverPage", "departOver"),
	MedicineZb("selectMedicineZbPage", "MedicineZb"),
	selectbzPage("selectbzPage", "bz"),
	AverageZhuYuan("selectAverageZhuYuanPage", "AverageZhuYuan"),
	onetotalyuan("selectOneTotalyuanPage", "onetotalyuan"),
	onetotalmen("selectOneTotalmenPage", "onetotalmen"),
	selectTopMedicine("selectTopMedicine", "top3Medicine"),
	selectTopMedicineYear("selectTopMedicineYear", "top3Medicineyear"),
	selectMonthDepartOver("selectMonthDepartOver", "monthDepartOver"),
	selectdepartOverYear("selectdepartOverYear", "departOverYear"),
	selectMonthdepartBzOver("selectMonthdepartBzOver", "monthdepartBzOver"),
	selectMonthdepartOverje("selectMonthdepartOverje", "departOverje"),
	selectYearepartBzOver("selectYearepartBzOver", "yeardepartBzOver"),
	selectAverageZYDayMonth("selectAverageZYDayMonth", "averageZYDayMonth"),
	selectAverageZYDayYear("selectAverageZYDayYear", "averageZYDayYear"),
	selectCJFYofMz("selectCJFYofMz", "monthCjfyofMz"),
	selectCJFYofZy("selectCJFYofZy", "monthCjfyofZy"),
	selectCJFYofMzYear("selectCJFYofMzYear", "cjfyofMzYear"),
	selectCJFYofZyYear("selectCJFYofZyYear", "cjfyofZyYear"),
	selectbzMonthOver("selectbzMonthOver", "bzMonthOver"),
	selectYzbMonrhDoctor("selectYzbMonrhDoctor", "YzbMonrhDoctor"),
	selectYzbYearDoctor("selectYzbYearDoctor", "YzbYearDoctor"),
	selectYzbqushi("selectYzbqushi", "yzbqs"),
	selectDepartDoctor("selectDepartDoctor", "DepartDoctor"),
	selectDepartOverQushi("selectDepartOverQushi", "departOverQushi"),
	selectbzDoctorTop3("selectbzDoctorTop3", "bzDoctorTop3"),
	selectbzTop3("selectbzTop3", "bzTop3"),
	selectbzyearDoctorTop3("selecbzyearDoctorTop3", "bzyearDoctorTop3"),
	selectBzOverQushi("selectBzOverQushi", "bzOverQushi"),
	selectMonthCjfyOfMZandZY("selectMonthCjfyOfMZandZY", "monthCjfyOfMZandZY"),
	selectYearCjfyOfMZandZY("selectYearCjfyOfMZandZY", "yearCjfyOfMZandZY"),
	selectYearCjfyOfMZandZYQuShi("selectYearCjfyOfMZandZYQuShi", "yearCjfyOfMZandZYQuShi"),
	selectMonthPJZYROfDoctorTop3("selectMonthPJZYROfDoctorTop3", "monthPJZYROfDoctorTop3"),
	selectYearPJZYROfDoctorTop3("selectYearPJZYROfDoctorTop3", "yearPJZYROfDoctorTop3"),
	selectpjzyrQuShi("selectpjzyrQuShi", "pjzyrQuShi"),
	selectQyWeiguiDanju("selectQyWeiguiDanju", "qyWeiguiDanju"),
	selectQyWeiguiJine("selectQyWeiguiJine", "qyWeiguiJine"),
	selectALLweiguiDepartdatagrid("selectALLweiguiDepartdatagrid", "allweiguiDepart"),
	selectDepartWeiguiJineAndcs("selectDepartWeiguiJineAndcs", "departWeiguiJineAndcs"),
	selectDepartWeiguiQuShi("selectDepartWeiguiQuShi", "departWeiguiQuShi"),
	selectALLweiguiDoctordatagrid("selectALLweiguiDoctordatagrid", "weiguiDoctordatagrid"),
	selectLcljofDoctor("selectLcljofDoctor", "lcljofDoctor"),
 
	;
	private String  methodname;

	private String methodvalue;

	EchartsMethodEnum(String methodname, String methodvalue) {
		this.methodname = methodname;
		this.methodvalue = methodvalue;
	}

	
	public String getMethodname() {
		return methodname;
	}


	public void setMethodname(String methodname) {
		this.methodname = methodname;
	}


	public String getMethodvalue() {
		return methodvalue;
	}


	public void setMethodvalue(String methodvalue) {
		this.methodvalue = methodvalue;
	}

	public static String getMethodname(String methodvalue) {
		 for (EchartsMethodEnum c : EchartsMethodEnum.values()) {
			 if (c.getMethodvalue() .equals(methodvalue) ) {
				   return c.methodname;
				   }
		 }
		
		return null;
	}
	
	
}
