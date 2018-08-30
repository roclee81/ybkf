package com.shuxin.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@TableName("T_TB_MGHZDJ_JB")
public class DoorpatientDrug implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	@TableId(type = IdType.UUID)
	private String id;
	/** 身份证号码*/
	private String sfzhm;
	/** 病种分类*/
	private String bzfl;
	/** 病种序号*/
	private String bzxh;
	/** 病种名称*/
	private String bzmc;
	/** 诊断编码*/
	private String zdbm;
	/** 诊断名称*/
	private String zdmc;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSfzhm() {
		return sfzhm;
	}
	public void setSfzhm(String sfzhm) {
		this.sfzhm = sfzhm;
	}
	public String getBzfl() {
		return bzfl;
	}
	public void setBzfl(String bzfl) {
		this.bzfl = bzfl;
	}
	public String getBzxh() {
		return bzxh;
	}
	public void setBzxh(String bzxh) {
		this.bzxh = bzxh;
	}
	public String getBzmc() {
		return bzmc;
	}
	public void setBzmc(String bzmc) {
		this.bzmc = bzmc;
	}
	public String getZdbm() {
		return zdbm;
	}
	public void setZdbm(String zdbm) {
		this.zdbm = zdbm;
	}
	public String getZdmc() {
		return zdmc;
	}
	public void setZdmc(String zdmc) {
		this.zdmc = zdmc;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
