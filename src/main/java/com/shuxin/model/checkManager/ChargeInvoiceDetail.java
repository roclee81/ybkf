package com.shuxin.model.checkManager;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * 收费单据明细表
 * @author admin
 *
 */
@TableName("ODS_SFDJMXB")
public class ChargeInvoiceDetail implements Serializable{
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;
	
	/** 单据项编码*/
	private String djxbm;

	/** 就诊流水号 */
	private String jzlsh;

	/** 医嘱流水号 */
	private String yzlsh;
	
	/** 收费项目编码/药品编码 */
	private String xmbm;
	
	/** 收费项目名称/药品名称 */
	private String xmmc;
	
	/** 类别编码/药品分类编码 */
	private String lbbm;
	
	/** 一级分类/药品分类 */
	private String lbmc;
	
	/** 1：药品，2：诊疗，3：服务设施，4：医用材料 */
	private String sdmllb;
	
	/** 报销等级，1：甲类，2：乙类，3：丙类 */
	private String bxdj;
	
	/** 出院带药标识1：是，0：否 */
	private String cydybs;
	
	/** 单价 */
	private String dj;
	
	/** 数量 */
	private String sl;
	
	/** 金额 */
	private String je;
	
	/** 服务日期：开处方日期 */
	private String fwrq;
	
	/** 执行科室编码 */
	private String zxksbm;
	
	/** 执行医生工号 */
	private String zxysgh;
	
	/** 医保内金额 */
	private String ybnje;
	
	/** 先行自付金额，乙类产品的先行自付金额*/
	private String xxzfje;
	/** 自费金额 */
	private String zfje;
	private String ldate;
	private String hdate;
	private String department;
	private String docname;
	private String patname;
	private String miid;
	private String mitype;
	private String machinestatus;
	private String personstatus;
	private String illegalrule;
	private String mctype;
	
	
	public String getDjxbm() {
		return djxbm;
	}
	public void setDjxbm(String djxbm) {
		this.djxbm = djxbm;
	}
	public String getJzlsh() {
		return jzlsh;
	}
	public void setJzlsh(String jzlsh) {
		this.jzlsh = jzlsh;
	}
	public String getYzlsh() {
		return yzlsh;
	}
	public void setYzlsh(String yzlsh) {
		this.yzlsh = yzlsh;
	}
	public String getXmbm() {
		return xmbm;
	}
	public void setXmbm(String xmbm) {
		this.xmbm = xmbm;
	}
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}
	public String getLbbm() {
		return lbbm;
	}
	public void setLbbm(String lbbm) {
		this.lbbm = lbbm;
	}
	public String getLbmc() {
		return lbmc;
	}
	public void setLbmc(String lbmc) {
		this.lbmc = lbmc;
	}
	public String getSdmllb() {
		return sdmllb;
	}
	public void setSdmllb(String sdmllb) {
		this.sdmllb = sdmllb;
	}
	public String getBxdj() {
		return bxdj;
	}
	public void setBxdj(String bxdj) {
		this.bxdj = bxdj;
	}
	public String getCydybs() {
		return cydybs;
	}
	public void setCydybs(String cydybs) {
		this.cydybs = cydybs;
	}
	public String getDj() {
		return dj;
	}
	public void setDj(String dj) {
		this.dj = dj;
	}
	public String getSl() {
		return sl;
	}
	public void setSl(String sl) {
		this.sl = sl;
	}
	public String getJe() {
		return je;
	}
	public void setJe(String je) {
		this.je = je;
	}
	public String getFwrq() {
		return fwrq;
	}
	public void setFwrq(String fwrq) {
		this.fwrq = fwrq;
	}
	public String getZxksbm() {
		return zxksbm;
	}
	public void setZxksbm(String zxksbm) {
		this.zxksbm = zxksbm;
	}
	public String getZxysgh() {
		return zxysgh;
	}
	public void setZxysgh(String zxysgh) {
		this.zxysgh = zxysgh;
	}
	public String getYbnje() {
		return ybnje;
	}
	public void setYbnje(String ybnje) {
		this.ybnje = ybnje;
	}
	public String getXxzfje() {
		return xxzfje;
	}
	public void setXxzfje(String xxzfje) {
		this.xxzfje = xxzfje;
	}
	public String getZfje() {
		return zfje;
	}
	public void setZfje(String zfje) {
		this.zfje = zfje;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
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
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getDocname() {
		return docname;
	}
	public void setDocname(String docname) {
		this.docname = docname;
	}
	public String getPatname() {
		return patname;
	}
	public void setPatname(String patname) {
		this.patname = patname;
	}
	public String getMiid() {
		return miid;
	}
	public void setMiid(String miid) {
		this.miid = miid;
	}
	public String getMitype() {
		return mitype;
	}
	public void setMitype(String mitype) {
		this.mitype = mitype;
	}
	public String getMachinestatus() {
		return machinestatus;
	}
	public void setMachinestatus(String machinestatus) {
		this.machinestatus = machinestatus;
	}
	public String getPersonstatus() {
		return personstatus;
	}
	public void setPersonstatus(String personstatus) {
		this.personstatus = personstatus;
	}
	public String getIllegalrule() {
		return illegalrule;
	}
	public void setIllegalrule(String illegalrule) {
		this.illegalrule = illegalrule;
	}
	public String getMctype() {
		return mctype;
	}
	public void setMctype(String mctype) {
		this.mctype = mctype;
	}

}
