package com.shuxin.commons.enums;

public enum DepartmentPerformanceEnum {
	selectYearCjfyOfMZandZY("selectYearCjfyOfMZandZY", "yearCjfyOfMZandZY"),
	selectMonthCjfyOfMZandZY("selectMonthCjfyOfMZandZY", "monthCjfyOfMZandZY"),
	selectYearCjfyOfMZandZYQuShi("selectYearCjfyOfMZandZYQuShi", "yearCjfyOfMZandZYQuShi"),
	selectCjFYofDoctor("selectCjFYofDoctor", "CjFYofDoctor"),
	selectMonthPJZYROfDoctorTop3("selectMonthPJZYROfDoctor", "monthPJZYROfDoctor"),
	selectpjzyrofDoctor("selectpjzyrofDoctor", "pjzyrofDoctor"),
	selectYzbMonrhAllDoctor("selectYzbMonrhAllDoctor", "yzbMonrhAllDoctor"),
	selectYzbqushi("selectYzbqushi", "yzbqs"),
	selectpjzyrQuShi("selectpjzyrQuShi", "pjzyrQuShi"),
	selectbzdoctorData("selectbzdoctorData", "bzdoctorData"),
	selectDepartDoctor("selectDepartDoctor", "DepartDoctor"),
	selectbzDoctorTop3("selectbzDoctor", "bzDoctor"),
	selectbzTop3("selectbz", "bz"),
	selectBzOverQushi("selectBzOverQushi", "bzOverQushi"),
	selectDepartWeiguiJineAndcs("selectDepartWeiguiJineAndcs", "departWeiguiJineAndcs"),
	selectDepartWeiguiQuShi("selectDepartWeiguiQuShi", "departWeiguiQuShi"),
	selectALLweiguiDoctordatagrid("selectALLweiguiDoctordatagrid", "weiguiDoctordatagrid"),
	SELECTONESUBJECTSETTING("selectOneSubjectSetting", "OneSubjectSetting"),
	;
	private String  methodname;

	private String methodvalue;

	DepartmentPerformanceEnum(String methodname, String methodvalue) {
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
		 for (DepartmentPerformanceEnum c : DepartmentPerformanceEnum.values()) {
			 if (c.getMethodvalue() .equals(methodvalue) ) {
				   return c.methodname;
				   }
		 }
		
		return null;
	}
	
	
	
}
