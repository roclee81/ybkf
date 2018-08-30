package com.shuxin.model.vo;

public class DiseaseVo {
	
	/**
	 * 病种分类
	 */
	private String diseaseType;
	
	/**
	 * 病种序列
	 */
	private String diseaseSeq;
	
	/**
	 * 病种名字
	 */
	private String diseaseName;
	
	private String id;
	
	/**
	 * 病种编码
	 */
	private String diseaseCode;
	
	/**
	 * 病种类型
	 */
	private String diseaseMode;
	
	/**
	 * 描述信息
	 */
	private String diseaseDesc;
	
	/**
	 * 治疗方式
	 */
	private String treatmentMethod;
	
	/**
	 * 是否临床路径管理（0否1是）
	 */
	private String pathWayFlag;

	public String getDiseaseType() {
		return diseaseType;
	}

	public void setDiseaseType(String diseaseType) {
		this.diseaseType = diseaseType;
	}	


	public String getDiseaseSeq() {
		return diseaseSeq;
	}

	public void setDiseaseSeq(String diseaseSeq) {
		this.diseaseSeq = diseaseSeq;
	}

	public String getDiseaseName() {
		return diseaseName;
	}

	public void setDiseaseName(String diseaseName) {
		this.diseaseName = diseaseName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDiseaseCode() {
		return diseaseCode;
	}

	public void setDiseaseCode(String diseaseCode) {
		this.diseaseCode = diseaseCode;
	}

	public String getDiseaseMode() {
		return diseaseMode;
	}

	public void setDiseaseMode(String diseaseMode) {
		this.diseaseMode = diseaseMode;
	}

	public String getDiseaseDesc() {
		return diseaseDesc;
	}

	public void setDiseaseDesc(String diseaseDesc) {
		this.diseaseDesc = diseaseDesc;
	}

	public String getTreatmentMethod() {
		return treatmentMethod;
	}

	public void setTreatmentMethod(String treatmentMethod) {
		this.treatmentMethod = treatmentMethod;
	}

	public String getPathWayFlag() {
		return pathWayFlag;
	}

	public void setPathWayFlag(String pathWayFlag) {
		this.pathWayFlag = pathWayFlag;
	}
	
	@Override
	public String toString() {
		return "DiseaseVo [bzfl=" + diseaseType + ", bzxh=" + diseaseSeq + ", bzmc=" + diseaseName
				+ ", id=" + id + ", zdbm=" + diseaseCode + ", bzlx=" + diseaseMode + ", bz="
				+ diseaseDesc + ", zlfs=" + treatmentMethod + ", sflcljgl=" + pathWayFlag + "]";
	}

}
