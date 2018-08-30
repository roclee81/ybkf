package com.shuxin.model.vo;

import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotations.TableField;

public class BudgetDistrVo {
	
private String id;
	
	/**
	 * 医保年度
	 */
	private String year;
	
	/**
	 * 科室编码
	 */
	private String department;
	
	/**
	 * 分配总额
	 */
	private BigDecimal distrTotal;
	
	/**
	 * 预警值
	 */
	private BigDecimal warningValue;
	
	/**
	 * 警戒值
	 */
	private BigDecimal alertValue;
	
	/**
	 * 耗材占比限额
	 */
	private BigDecimal materialLimt;
	
	/**
	 * 自费比限额
	 */
	private BigDecimal ownExpense;
	
	/**
	 * 检验检查占比限额
	 */
	private BigDecimal inspectLimit;
	
	/**
	 * 药占比限额
	 */
	private BigDecimal drugLimit;
	
	/**
	 * 诊疗占比限额
	 */
	private BigDecimal diagnosisLimit;
	
	/**
	 * 人均药费限额
	 */
	private BigDecimal drugRateLimit;
	
	/**
	 * 限定住院时间
	 */
	private Double limitTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public BigDecimal getDistrTotal() {
		return distrTotal;
	}

	public void setDistrTotal(BigDecimal distrTotal) {
		this.distrTotal = distrTotal;
	}

	public BigDecimal getWarningValue() {
		return warningValue;
	}

	public void setWarningValue(BigDecimal warningValue) {
		this.warningValue = warningValue;
	}

	public BigDecimal getAlertValue() {
		return alertValue;
	}

	public void setAlertValue(BigDecimal alertValue) {
		this.alertValue = alertValue;
	}

	public BigDecimal getMaterialLimt() {
		return materialLimt;
	}

	public void setMaterialLimt(BigDecimal materialLimt) {
		this.materialLimt = materialLimt;
	}

	public BigDecimal getOwnExpense() {
		return ownExpense;
	}

	public void setOwnExpense(BigDecimal ownExpense) {
		this.ownExpense = ownExpense;
	}

	public BigDecimal getInspectLimit() {
		return inspectLimit;
	}

	public void setInspectLimit(BigDecimal inspectLimit) {
		this.inspectLimit = inspectLimit;
	}

	public BigDecimal getDrugLimit() {
		return drugLimit;
	}

	public void setDrugLimit(BigDecimal drugLimit) {
		this.drugLimit = drugLimit;
	}

	public BigDecimal getDiagnosisLimit() {
		return diagnosisLimit;
	}

	public void setDiagnosisLimit(BigDecimal diagnosisLimit) {
		this.diagnosisLimit = diagnosisLimit;
	}

	public BigDecimal getDrugRateLimit() {
		return drugRateLimit;
	}

	public void setDrugRateLimit(BigDecimal drugRateLimit) {
		this.drugRateLimit = drugRateLimit;
	}

	public Double getLimitTime() {
		return limitTime;
	}

	public void setLimitTime(Double limitTime) {
		this.limitTime = limitTime;
	}
	
	@Override
	public String toString() {
		return "BudgetDistrVo [id=" + id + ", year=" + year + ", ksbm=" + department + ", fpze="
				+ distrTotal + ", yjz=" + warningValue + ", jjz=" + alertValue + ", hczbxe="
				+ materialLimt + ", zfbxe=" + ownExpense + ", jyjczbxe=" + inspectLimit + ", jzbxe="
				+ drugLimit + ", zlzbxe=" + diagnosisLimit + ", rjybxe=" + drugRateLimit + ", xdzysj="
				+ limitTime + "]";
	}

}
