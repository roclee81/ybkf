package com.shuxin.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

/**
*
* 医疗组费用计分配
*
*/
@TableName("t_dm_zyjk")
public class HospitalMonitor implements Serializable{

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
	
	/** 在院人数*/
	private String  zyrs ;
	/**住院总床日数 */
	private String  zyzcrs ;
	/** 参保类型编码 */
	private String  cblxbm ;
	/**医疗组编码 */
	private String  ylzbm;	
	/**医疗组名称 */
	private String  ylzmc;	
	/**参保类型名称 */
	private String  cblx;	
	/**平均住院日*/
	private String  pjzyr;	
	/**平均住院日限定*/
	private String  pjzyr_xd;	
	/**日均住院限定*/
	private String  rjzyfy;	
	/**医疗总费用*/
	private String  ylzfy;	
	/**医保统筹支付*/
	private String  ybtczf;	
	/**个人自付*/
	private String  grzf;	
	/**自费总额*/
	private String  zfze;	
	/**住院时间超长患者数*/
	private String  zysjcchzs;	
	/**住院费用超额患者数*/
	private String  zyfycehzs;	
	/**违规单据数量*/
	private String  wgdjsl;	
	/**违规金额*/
	private String  wgje;	
	/**单病种人数*/
	private String  dbzrs;	
	/**单病种医疗总费用*/
	private String  dbzylzfy;	
	/**单病种住院费占比*/
	private String  dbzzyfyzb;	
	/**单病种费用超限患者数*/
	private String  dbzfycxhzs;
	
	
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
	public String getZyrs() {
		return zyrs;
	}
	public void setZyrs(String zyrs) {
		this.zyrs = zyrs;
	}
	public String getZyzcrs() {
		return zyzcrs;
	}
	public void setZyzcrs(String zyzcrs) {
		this.zyzcrs = zyzcrs;
	}
	public String getCblxbm() {
		return cblxbm;
	}
	public void setCblxbm(String cblxbm) {
		this.cblxbm = cblxbm;
	}
	public String getYlzbm() {
		return ylzbm;
	}
	public void setYlzbm(String ylzbm) {
		this.ylzbm = ylzbm;
	}
	public String getYlzmc() {
		return ylzmc;
	}
	public void setYlzmc(String ylzmc) {
		this.ylzmc = ylzmc;
	}
	public String getCblx() {
		return cblx;
	}
	public void setCblx(String cblx) {
		this.cblx = cblx;
	}
	public String getPjzyr() {
		return pjzyr;
	}
	public void setPjzyr(String pjzyr) {
		this.pjzyr = pjzyr;
	}
	public String getPjzyr_xd() {
		return pjzyr_xd;
	}
	public void setPjzyr_xd(String pjzyr_xd) {
		this.pjzyr_xd = pjzyr_xd;
	}
	public String getRjzyfy() {
		return rjzyfy;
	}
	public void setRjzyfy(String rjzyfy) {
		this.rjzyfy = rjzyfy;
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
	public String getGrzf() {
		return grzf;
	}
	public void setGrzf(String grzf) {
		this.grzf = grzf;
	}
	public String getZfze() {
		return zfze;
	}
	public void setZfze(String zfze) {
		this.zfze = zfze;
	}
	public String getZysjcchzs() {
		return zysjcchzs;
	}
	public void setZysjcchzs(String zysjcchzs) {
		this.zysjcchzs = zysjcchzs;
	}
	public String getZyfycehzs() {
		return zyfycehzs;
	}
	public void setZyfycehzs(String zyfycehzs) {
		this.zyfycehzs = zyfycehzs;
	}
	public String getWgdjsl() {
		return wgdjsl;
	}
	public void setWgdjsl(String wgdjsl) {
		this.wgdjsl = wgdjsl;
	}
	public String getWgje() {
		return wgje;
	}
	public void setWgje(String wgje) {
		this.wgje = wgje;
	}
	public String getDbzrs() {
		return dbzrs;
	}
	public void setDbzrs(String dbzrs) {
		this.dbzrs = dbzrs;
	}
	public String getDbzylzfy() {
		return dbzylzfy;
	}
	public void setDbzylzfy(String dbzylzfy) {
		this.dbzylzfy = dbzylzfy;
	}
	public String getDbzzyfyzb() {
		return dbzzyfyzb;
	}
	public void setDbzzyfyzb(String dbzzyfyzb) {
		this.dbzzyfyzb = dbzzyfyzb;
	}
	public String getDbzfycxhzs() {
		return dbzfycxhzs;
	}
	public void setDbzfycxhzs(String dbzfycxhzs) {
		this.dbzfycxhzs = dbzfycxhzs;
	}	
	
	
	
	
	
	
	
	
}
