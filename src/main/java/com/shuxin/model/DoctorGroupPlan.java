package com.shuxin.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

/**
*
* 医疗组费用计分配
*
*/
@TableName("T_YSGL_YLZJJPF")
public class DoctorGroupPlan implements Serializable{

	
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;
	
	/** 这年 */
	private String  syear ;
	/** 这季度*//*
	private String  quarter ;
	*//** 这月*//*
	private String  smonth ;*/
	/**所属科室编码 */
	private String  ksbm ;
	/** 医疗组编码 */
	private String  ylzbm ;
	
	/** 医疗组名称 */
	private String  ylzmc ;
	
	/** 参保类型编码*/
	private String  cblxbm ;
	
	/** 参保类型*/
	private String  cblx ;
	/**控费时间方式*/
	private String  kfsjfs ;
	/**人均基金限额*/
	private String  rjjjxe ;
	
	
	/**人均医疗总费用限额*/
	private String  rjylfyxe ;
	
	/**自费比限额*/
	private String  zfbxe ;
	
	/**药占比限额*/
	private String  yzbxe ;
	/**检查检验占比限额*/
	private String  jcjyzbxe ;
	
	/**诊疗占比限额*/
	private String  zlzbxe ;
	/**耗材占比限额*/
	private String  hczbxe ;
	/**住院天数限定*/
	private String  zytsxd ;
	  @TableId(type = IdType.UUID)
	    private String id;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSyear() {
		return syear;
	}
	public void setSyear(String syear) {
		this.syear = syear;
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
	public String getYlzmc() {
		return ylzmc;
	}
	public void setYlzmc(String ylzmc) {
		this.ylzmc = ylzmc;
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
	public String getKfsjfs() {
		return kfsjfs;
	}
	public void setKfsjfs(String kfsjfs) {
		this.kfsjfs = kfsjfs;
	}
	public String getRjjjxe() {
		return rjjjxe;
	}
	public void setRjjjxe(String rjjjxe) {
		this.rjjjxe = rjjjxe;
	}
	public String getRjylfyxe() {
		return rjylfyxe;
	}
	public void setRjylfyxe(String rjylfyxe) {
		this.rjylfyxe = rjylfyxe;
	}
	public String getZfbxe() {
		return zfbxe;
	}
	public void setZfbxe(String zfbxe) {
		this.zfbxe = zfbxe;
	}
	public String getYzbxe() {
		return yzbxe;
	}
	public void setYzbxe(String yzbxe) {
		this.yzbxe = yzbxe;
	}
	public String getJcjyzbxe() {
		return jcjyzbxe;
	}
	public void setJcjyzbxe(String jcjyzbxe) {
		this.jcjyzbxe = jcjyzbxe;
	}
	public String getZlzbxe() {
		return zlzbxe;
	}
	public void setZlzbxe(String zlzbxe) {
		this.zlzbxe = zlzbxe;
	}
	public String getHczbxe() {
		return hczbxe;
	}
	public void setHczbxe(String hczbxe) {
		this.hczbxe = hczbxe;
	}
	public String getZytsxd() {
		return zytsxd;
	}
	public void setZytsxd(String zytsxd) {
		this.zytsxd = zytsxd;
	}
	@Override
	public String toString() {
		return "DoctorGroupPlan [syear=" + syear + ",  ksbm=" + ksbm + ", ylzbm=" + ylzbm
				+ ", ylzmc=" + ylzmc + ", cblxbm=" + cblxbm + ", cblx=" + cblx
				+ ", kfsjfs=" + kfsjfs + ", rjjjxe=" + rjjjxe + ", rjylfyxe="
				+ rjylfyxe + ", zfbxe=" + zfbxe + ", yzbxe=" + yzbxe
				+ ", jcjyzbxe=" + jcjyzbxe + ", zlzbxe=" + zlzbxe + ", hczbxe="
				+ hczbxe + ", zytsxd=" + zytsxd + "]";
	}
	
	
}
