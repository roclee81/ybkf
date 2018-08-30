package com.shuxin.model.vo;

public class DiagnosisVo {

	private String id;
	
	/**
	 * 诊断编码
	 */	
	private String diagnosisCode;
	
	/**
	 * 诊断名称
	 */
	private String diagnosisName;
	
	/**
	 * 诊断类型
	 */
	private String diagnosisType;
	
	/**
	 * 诊断类别
	 */
	private String diagnosisMode;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDiagnosisCode() {
		return diagnosisCode;
	}

	public void setDiagnosisCode(String diagnosisCode) {
		this.diagnosisCode = diagnosisCode;
	}

	public String getDiagnosisName() {
		return diagnosisName;
	}

	public void setDiagnosisName(String diagnosisName) {
		this.diagnosisName = diagnosisName;
	}

	public String getDiagnosisType() {
		return diagnosisType;
	}

	public void setDiagnosisType(String diagnosisType) {
		this.diagnosisType = diagnosisType;
	}

	public String getDiagnosisMode() {
		return diagnosisMode;
	}

	public void setDiagnosisMode(String diagnosisMode) {
		this.diagnosisMode = diagnosisMode;
	}
	
	@Override
	public String toString() {
		return "DiagnosisVo [id=" + id + ", zdbm=" + diagnosisCode + ", zdmc=" + diagnosisName
				+ ", zdlb=" + diagnosisType + ", zdlx=" + diagnosisMode + "]";
	}
	
}
