package com.shuxin.model;

import java.io.Serializable;

public class FormsModel implements Serializable{

	private static final long serialVersionUID = 932136354701046889L;
	
	
	private String starttime;
	private String endtime;
	private String sql;
	private String ksbm;
	private String ylzbm;
	private String title;
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
	public String getKsbm() {
		return ksbm;
	}
	public void setKsbm(String ksbm) {
		this.ksbm = ksbm;
	}
	public String getYlzbm() {
		return ylzbm;
	}
	public void setYlzbm(String ylzbm) {
		this.ylzbm = ylzbm;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	
	
}
