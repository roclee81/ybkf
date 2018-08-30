package com.shuxin.commons.enums;

public enum InsuranceViolationEnums {

	VIOLATION_DEPARTMENT_SORT("violationDepartmentSort","violationDepartmentSort"),
	VIOLATION_DOCTOR_SORT("violationDoctorSort","violationDoctorSort"),
	VIOLATION_RULE_SORT("violationRuleSort","violationRuleSort"),
	SELECT_VIOLATION_DETAIL("selectViolationDetail","selectViolationDetail"),
	SELECT_PATIENTBILL_DETAIL("selectPatientBillDetail","selectPatientBillDetail")
;
	
	private String  key;

	private String value;
	
	InsuranceViolationEnums(String key, String value) {
		this.key = key;
		this.value = value;
	}
	
	public static String getEnumValue(String key) {
		 for (InsuranceViolationEnums c : InsuranceViolationEnums.values()) 
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
