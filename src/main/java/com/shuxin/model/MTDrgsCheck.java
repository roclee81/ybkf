package com.shuxin.model;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
/**
*
* 门特病审核
*
*/
@TableName("t_dm_mtb_mtbsh")
public class MTDrgsCheck implements Serializable{
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
	
	/** 参保类型编码 */
	private String  cblxbm ;
	/**参保类型名称 */
	private String  cblx;	
	/** 医疗组编码 */
	private String  ylzbm ;
	/**医疗组名称 */
	private String  ylz;	
	
	/** 门诊人次 */
	private String  mzrc ;
	/**医疗总费用 */
	private String  ylzfy;	
	
	/**医保统筹支付*/
	private String  ybtczf ;
	/**医疗总费用 */
	private String  grfd;	
	/**次均费用*/
	private String  cjfy ;
	/**次均费用 */
	private String  cjyf;
	private Date starttime;
	private Date endtime;
	private String sql;
	
	private String startyear;
	private String startmonth;
	private String endyear;
	private String endmonth;
	
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
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
	public String getYlzbm() {
		return ylzbm;
	}
	public void setYlzbm(String ylzbm) {
		this.ylzbm = ylzbm;
	}
	public String getYlz() {
		return ylz;
	}
	public void setYlz(String ylz) {
		this.ylz = ylz;
	}
	public String getMzrc() {
		return mzrc;
	}
	public void setMzrc(String mzrc) {
		this.mzrc = mzrc;
	}
	public String getYlzfy() {
		return ylzfy;
	}
	public void setYlzfy(String ylzfy) {
		this.ylzfy = ylzfy;
	}
	public String getYbtczf() {
		return ybtczf;
	}
	public void setYbtczf(String ybtczf) {
		this.ybtczf = ybtczf;
	}
	public String getGrfd() {
		return grfd;
	}
	public void setGrfd(String grfd) {
		this.grfd = grfd;
	}
	public String getCjfy() {
		return cjfy;
	}
	public void setCjfy(String cjfy) {
		this.cjfy = cjfy;
	}
	public String getCjyf() {
		return cjyf;
	}
	public void setCjyf(String cjyf) {
		this.cjyf = cjyf;
	}
	public Date getStarttime() {
		return starttime;
	}
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public String getStartyear() {
		return startyear;
	}
	public void setStartyear(String startyear) {
		this.startyear = startyear;
	}
	public String getStartmonth() {
		return startmonth;
	}
	public void setStartmonth(String startmonth) {
		this.startmonth = startmonth;
	}
	public String getEndyear() {
		return endyear;
	}
	public void setEndyear(String endyear) {
		this.endyear = endyear;
	}
	public String getEndmonth() {
		return endmonth;
	}
	public void setEndmonth(String endmonth) {
		this.endmonth = endmonth;
	}	
	
	
	
	
	
	
	
	
	
	
}
