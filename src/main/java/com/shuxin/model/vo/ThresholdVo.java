package com.shuxin.model.vo;

import java.math.BigDecimal;

public class ThresholdVo {
	
private String id;
	
	/**
	 * 病种序号
	 */
	private String diseaseSeq;
	
	/**
	 * 病种限额
	 */
	private BigDecimal diseaseLimit; 
	
	/**
	 * 预警限额
	 */
	private BigDecimal warnLimit; 
	
	/**
	 * 预警金额
	 */
	private BigDecimal warnAmount; 
	
	/**
	 * 限定住院时间
	 */
	private BigDecimal timeLimit; 
	
	/**
	 * 药占比
	 */
	private BigDecimal drugProportion; 
	
	/**
	 * 诊疗占比
	 */
	private BigDecimal diagnosisProportion; 
	
	/**
	 * 材料占比  
	 */
	private BigDecimal materialProportion; 
	
	/**
	 * 检验检查占比
	 */
	private BigDecimal checkLimit;
	
	/**
	 * 有效标志(0:无效;1:有效)
	 */
	private int validFlag; 
	
	/**
	 * 生效时间
	 */
	private BigDecimal validTime; 
	
	/**
	 * 失效时间
	 */
	private BigDecimal invalidTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDiseaseSeq() {
		return diseaseSeq;
	}

	public void setDiseaseSeq(String diseaseSeq) {
		this.diseaseSeq = diseaseSeq;
	}

	public BigDecimal getDiseaseLimit() {
		return diseaseLimit;
	}

	public void setDiseaseLimit(BigDecimal diseaseLimit) {
		this.diseaseLimit = diseaseLimit;
	}

	public BigDecimal getWarnLimit() {
		return warnLimit;
	}

	public void setWarnLimit(BigDecimal warnLimit) {
		this.warnLimit = warnLimit;
	}

	public BigDecimal getWarnAmount() {
		return warnAmount;
	}

	public void setWarnAmount(BigDecimal warnAmount) {
		this.warnAmount = warnAmount;
	}

	public BigDecimal getTimeLimit() {
		return timeLimit;
	}

	public void setTimeLimit(BigDecimal timeLimit) {
		this.timeLimit = timeLimit;
	}

	public BigDecimal getDrugProportion() {
		return drugProportion;
	}

	public void setDrugProportion(BigDecimal drugProportion) {
		this.drugProportion = drugProportion;
	}

	public BigDecimal getDiagnosisProportion() {
		return diagnosisProportion;
	}

	public void setDiagnosisProportion(BigDecimal diagnosisProportion) {
		this.diagnosisProportion = diagnosisProportion;
	}

	public BigDecimal getMaterialProportion() {
		return materialProportion;
	}

	public void setMaterialProportion(BigDecimal materialProportion) {
		this.materialProportion = materialProportion;
	}

	public BigDecimal getCheckLimit() {
		return checkLimit;
	}

	public void setCheckLimit(BigDecimal checkLimit) {
		this.checkLimit = checkLimit;
	}

	public int getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(int validFlag) {
		this.validFlag = validFlag;
	}

	public BigDecimal getValidTime() {
		return validTime;
	}

	public void setValidTime(BigDecimal validTime) {
		this.validTime = validTime;
	}

	public BigDecimal getInvalidTime() {
		return invalidTime;
	}

	public void setInvalidTime(BigDecimal invalidTime) {
		this.invalidTime = invalidTime;
	}
	
	@Override
	public String toString() {
		return "ThresholdVo [id=" + id + ", bzxh=" + diseaseSeq + ", bzxe=" + diseaseLimit
				+ ", yjxe=" + warnLimit + ", yjje=" + warnAmount + ", xdzysj=" + timeLimit
				+ ", yzb=" + drugProportion + ", zlzb=" + diagnosisProportion
				+ ", clzb=" + materialProportion + ", jxjczb=" + checkLimit + ", yxbz="
				+ validFlag + ", sxsj=" + validTime + ", shxsj=" + invalidTime + "]";
	}

}
