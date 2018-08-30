package com.shuxin.commons.enums;

public enum OverfulfilEnum {
	OVERFULFIL_ORDER_BY_SECTION("OverfulfilOrderBySection","OverfulfilOrderBySection"),
	OVERFULFIL_ORDER_BY_DISEASE("OverfulfilOrderByDisease","OverfulfilOrderByDisease"),
	OVERFULFIL_ORDER_BY_DOCTOR("OverfulfilOrderByDoctor","OverfulfilOrderByDoctor"),
	LOS_OVERFULFIL_BY_SECTION("losOverfulfilBySection","losOverfulfilBySection"),
	LOS_OVERFULFIL_BY_DISEASE("losOverfulfilByDisease","losOverfulfilByDisease"),
	LOS_OVERFULFIL_BY_DOCTOR("losOverfulfilByDoctor","losOverfulfilByDoctor"),
	DISEASE_OVERFULFIL_ORDER("diseaseOverfulfilOrder","diseaseOverfulfilOrder"),
	DISEASE_LOS_OVERFULFIL_ORDER("diseaseLosOverfulfilOrder","diseaseLosOverfulfilOrder")
	;
	
	private String  key;

	private String value;
	
	OverfulfilEnum(String key, String value) {
		this.key = key;
		this.value = value;
	}
	
	public static String getEnumValue(String key) {
		 for (OverfulfilEnum c : OverfulfilEnum.values()) 
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
