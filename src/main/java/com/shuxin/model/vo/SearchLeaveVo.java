package com.shuxin.model.vo;

import java.util.List;
import java.util.Map;

public class SearchLeaveVo {
	private String ldate;//最小日期
	private String hdate;//最大日期
	private String ksbm;//科室编码
	private String ylzbm;	//医疗组编码
	private Integer page;//一下4个参数用于接受分页属性
	private Integer rows;
	private String sort;
	private String order;
	private List<ConVo> condition;//用于接受过滤标签数组
	private String filterRules;//这个属性用于接受远程datagrid远程过滤条件	
	private String methodFlag;
	private String orderType;//按‘金额’还是按‘人次’
	private String ybkh;//医保卡号

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




	public String getFilterRules() {
		return filterRules;
	}
	public void setFilterRules(String filterRules) {
		this.filterRules = filterRules;
	}

	public String getKsbm() {
		return ksbm;
	}
	public void setKsbm(String ksbm) {
		this.ksbm = ksbm;
	}

	public List<ConVo> getCondition() {
		return condition;
	}
	public void setCondition(List<ConVo> condition) {
		this.condition = condition;
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
	public String getLdate() {
		return ldate;
	}
	public void setLdate(String ldate) {
		this.ldate = ldate;
	}
	public String getHdate() {
		return hdate;
	}
	public void setHdate(String hdate) {
		this.hdate = hdate;
	}
	public String getYlzbm() {
		return ylzbm;
	}
	public void setYlzbm(String ylzbm) {
		this.ylzbm = ylzbm;
	}
	public String getYbkh() {
		return ybkh;
	}
	public void setYbkh(String ybkh) {
		this.ybkh = ybkh;
	}
	
}
