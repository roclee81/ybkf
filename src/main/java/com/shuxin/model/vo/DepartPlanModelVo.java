package com.shuxin.model.vo;

import java.io.Serializable;
import java.util.List;

/**
 * 科室预算分配 数据封装类
 * 
 * kfsjfs   1 表示月度  2 表示季度
 * ksfptype  类型包括医疗总费用、基金限额、住院人次
 * month	对应月份的数据
 * season	对应季度的数据
 * @author admin
 *
 */
public class DepartPlanModelVo implements Serializable{

	private static final long serialVersionUID = 1L;

	private String month01;
	
	private String month02;
	
	private String month03;
	
	private String month04;
	
	private String month05;
	
	private String month06;
	
	private String month07;
	
	private String month08;
	
	private String month09;
	
	private String month10;
	
	private String month11;
	
	private String month12;
	
	private String season1;
	
	private String season2;
	
	private String season3;
	
	private String season4;
	
	private String syear;
	
	private String cblxbm;
	
	private String ksbm;
	
	private String kfsjfs;  //  1 表示月度  2 表示季度
	
	private String ksfptype; 
	
	private String id;
	
	public String getQy() {
		return qy;
	}

	public void setQy(String qy) {
		this.qy = qy;
	}

	private String qy;

	public String getMonth01() {
		return month01;
	}

	public void setMonth01(String month01) {
		this.month01 = month01;
	}

	public String getMonth02() {
		return month02;
	}

	public void setMonth02(String month02) {
		this.month02 = month02;
	}

	public String getMonth03() {
		return month03;
	}

	public void setMonth03(String month03) {
		this.month03 = month03;
	}

	public String getMonth04() {
		return month04;
	}

	public void setMonth04(String month04) {
		this.month04 = month04;
	}

	public String getMonth05() {
		return month05;
	}

	public void setMonth05(String month05) {
		this.month05 = month05;
	}

	public String getMonth06() {
		return month06;
	}

	public void setMonth06(String month06) {
		this.month06 = month06;
	}

	public String getMonth07() {
		return month07;
	}

	public void setMonth07(String month07) {
		this.month07 = month07;
	}

	public String getMonth08() {
		return month08;
	}

	public void setMonth08(String month08) {
		this.month08 = month08;
	}

	public String getMonth09() {
		return month09;
	}

	public void setMonth09(String month09) {
		this.month09 = month09;
	}

	public String getMonth10() {
		return month10;
	}

	public void setMonth10(String month10) {
		this.month10 = month10;
	}

	public String getMonth11() {
		return month11;
	}

	public void setMonth11(String month11) {
		this.month11 = month11;
	}

	public String getMonth12() {
		return month12;
	}

	public void setMonth12(String month12) {
		this.month12 = month12;
	}

	public String getSeason1() {
		return season1;
	}

	public void setSeason1(String season1) {
		this.season1 = season1;
	}

	public String getSeason2() {
		return season2;
	}

	public void setSeason2(String season2) {
		this.season2 = season2;
	}

	public String getSeason3() {
		return season3;
	}

	public void setSeason3(String season3) {
		this.season3 = season3;
	}

	public String getSeason4() {
		return season4;
	}

	public void setSeason4(String season4) {
		this.season4 = season4;
	}

	public String getSyear() {
		return syear;
	}

	public void setSyear(String syear) {
		this.syear = syear;
	}

	public String getCblxbm() {
		return cblxbm;
	}

	public void setCblxbm(String cblxbm) {
		this.cblxbm = cblxbm;
	}

	public String getKsbm() {
		return ksbm;
	}

	public void setKsbm(String ksbm) {
		this.ksbm = ksbm;
	}

	public String getKfsjfs() {
		return kfsjfs;
	}

	public void setKfsjfs(String kfsjfs) {
		this.kfsjfs = kfsjfs;
	}

	public String getKsfptype() {
		return ksfptype;
	}

	public void setKsfptype(String ksfptype) {
		this.ksfptype = ksfptype;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
