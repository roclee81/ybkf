package com.shuxin.commons.enums;

public enum SingleDiseaseEcharsEnum {
	
	SINGLE_DISEASE("singleDisease","singleDiseaseSort"),
	OVERE_SINGLE_DISEASE("overSingleDisease","overSingleDiseaseSort"),
	DEPARTMENT_DISEASE("departmentDisease","departmentDiseaseSort"),
	OVERE_DEPARTMENT_DISEASE("overDepartmentDisease","overDepartmentDiseaseSort"),
	DOCTOR_DISEASE("doctorSingleDisease","doctorSingleDiseaseSort"),
	OVERE_DOCTOR_DISEASE("overDoctorSingleDisease","overDoctorSingleDiseaseSort"),
	;
	
	private String  key;

	private String value;
	
	SingleDiseaseEcharsEnum(String key, String value) {
		this.key = key;
		this.value = value;
	}
	
	public static String getEnumValue(String key) {
		 for (SingleDiseaseEcharsEnum c : SingleDiseaseEcharsEnum.values()) 
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
