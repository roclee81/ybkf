package com.shuxin.model.vo;

public class SingleDiseaseVo {
	
	/**
	 * 年月
	 */
	private String yearMonth;
	
	/**
	 * 部门编码
	 */
	private String department;
	
	/**
	 * 图表标识(多个用逗号隔开)
	 */
	private String echarsFlag;
	
	/**
	 * 排序类型
	 */
	private String orderType="0";

	public String getYearMonth() {
		return yearMonth;
	}

	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getEcharsFlag() {
		return echarsFlag;
	}

	public void setEcharsFlag(String echarsFlag) {
		this.echarsFlag = echarsFlag;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}	

}
