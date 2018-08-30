package com.shuxin.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
/**
*
* 科室费用监控
*
*/
@TableName("T_DM_KSFYJK")
public class DepartmentCostControl implements Serializable{
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;
	/** 系统年月 */
	private String  syearmonth ;
	/** 这年 */	
	private String  syear ;
	/** 这月*/
	
	private String  smonth ;
	/**科室编码 */
	private String  ksbm ;
	/** 科室名称 */
	private String  ksmc ;
	
	/** 指标编码*/
	private String  zbbm ;
	/** 指标名称 */
	private String  zbmc ;
	/** 参保类型编码 */
	private String  cblxbm ;
	/**参保类型名称 */
	private String  cblx;	
	/**就诊类型编码 */
	private String  jzlxbm ;
	/**就诊类型名称*/
	private String  jzlx ;
	/**医生姓名*/
	private String  ysgh ;
	/**医生工号*/
	private String  ysxm ;
	/**本月值*/
	private Double  byz ;
	/**限定值月*/
	@TableField(value = "xdz_m")
	private Double  xdzm ;
	/**本年值*/
	private Double  nlz ;
	/**限定值年*/
	@TableField(value = "xdz_y")
	private Double  xdzy ;
	/**备用1*/
	private String  by1 ;
	/**备用2*/
	private Double  by2 ;
	public String getSyearmonth() {
		return syearmonth;
	}
	public void setSyearmonth(String syearmonth) {
		this.syearmonth = syearmonth;
	}
	
	
	public String getSyear() {
		return syear;
	}
	public void setSyear(String syear) {
		this.syear = syear;
	}
	public String getSmonth() {
		return smonth;
	}
	public void setSmonth(String smonth) {
		this.smonth = smonth;
	}
	public String getKsbm() {
		return ksbm;
	}
	public void setKsbm(String ksbm) {
		this.ksbm = ksbm;
	}
	public String getKsmc() {
		return ksmc;
	}
	public void setKsmc(String ksmc) {
		this.ksmc = ksmc;
	}
	public String getZbbm() {
		return zbbm;
	}
	public void setZbbm(String zbbm) {
		this.zbbm = zbbm;
	}
	public String getZbmc() {
		return zbmc;
	}
	public void setZbmc(String zbmc) {
		this.zbmc = zbmc;
	}
	public String getCblxbm() {
		return cblxbm;
	}
	public void setCblxbm(String cblxbm) {
		this.cblxbm = cblxbm;
	}
	public String getCblx() {
		return cblx;
	}
	public void setCblx(String cblx) {
		this.cblx = cblx;
	}
	public String getJzlxbm() {
		return jzlxbm;
	}
	public void setJzlxbm(String jzlxbm) {
		this.jzlxbm = jzlxbm;
	}
	public String getJzlx() {
		return jzlx;
	}
	public void setJzlx(String jzlx) {
		this.jzlx = jzlx;
	}
	public String getYsgh() {
		return ysgh;
	}
	public void setYsgh(String ysgh) {
		this.ysgh = ysgh;
	}
	public String getYsxm() {
		return ysxm;
	}
	public void setYsxm(String ysxm) {
		this.ysxm = ysxm;
	}
	public Double getByz() {
		return byz;
	}
	public void setByz(Double byz) {
		this.byz = byz;
	}
	public Double getXdzm() {
		return xdzm;
	}
	public void setXdzm(Double xdzm) {
		this.xdzm = xdzm;
	}
	public Double getNlz() {
		return nlz;
	}
	public void setNlz(Double nlz) {
		this.nlz = nlz;
	}
	public Double getXdzy() {
		return xdzy;
	}
	public void setXdzy(Double xdzy) {
		this.xdzy = xdzy;
	}
	public String getBy1() {
		return by1;
	}
	public void setBy1(String by1) {
		this.by1 = by1;
	}
	public Double getBy2() {
		return by2;
	}
	public void setBy2(Double by2) {
		this.by2 = by2;
	}
	
	
	
	
	
	
	
	
}
