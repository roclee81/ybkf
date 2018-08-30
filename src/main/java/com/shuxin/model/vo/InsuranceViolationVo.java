package com.shuxin.model.vo;

import java.util.List;
import java.util.Map;

public class InsuranceViolationVo {
	
	/**
	 * 年月
	 */
	private String yearMonth;
	
	/**
	 * 科室
	 */
	private String department;
	
	/**
	 * 医保类型
	 */
	private String insuredType;

	/**
	 * 排序
	 */
	private String orderType="0";	
    
    /**
	 * 动态调用方法标识(多个用逗号隔开)
	 */
    private String methodFlag;    
    
    
    private Integer page;
    private Integer rows; 
    private String sort; 
    private String order;
    
    /**
     * 用于接受远程datagrid远程过滤条件
     */
    private List<FilterRulesVo> filterRulesList;
    
    /**
     * 单据编号
     */
    private String billNo;
   

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

	public String getInsuredType() {
		return insuredType;
	}

	public void setInsuredType(String insuredType) {
		this.insuredType = insuredType;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}	

	public String getMethodFlag() {
		return methodFlag;
	}

	public void setMethodFlag(String methodFlag) {
		this.methodFlag = methodFlag;
	}

	public List<FilterRulesVo> getFilterRulesList() {
		return filterRulesList;
	}

	public void setFilterRulesList(List<FilterRulesVo> filterRulesList) {
		this.filterRulesList = filterRulesList;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getBillNo() {
		return billNo;
	}

	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}

	

	

}
