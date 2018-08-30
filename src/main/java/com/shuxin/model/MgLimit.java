package com.shuxin.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;



@TableName("T_TB_MGXE ")
public class MgLimit implements Serializable{
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 主键id */
	@TableId(type = IdType.UUID)
	private String id;

	/** 参保类型*/
	private String cblx;
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
	/**医保统筹定额*/
	private String  ybtcde ;
	/**浮动限额*/
	private String  fdxe  ;
	/**医疗期*/
	private String  ylq  ;
	/**修改时间*/
	private String  xgsj  ;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCblx() {
		return cblx;
	}
	public void setCblx(String cblx) {
		this.cblx = cblx;
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
	public String getYbtcde() {
		return ybtcde;
	}
	public void setYbtcde(String ybtcde) {
		this.ybtcde = ybtcde;
	}
	public String getFdxe() {
		return fdxe;
	}
	public void setFdxe(String fdxe) {
		this.fdxe = fdxe;
	}
	public String getYlq() {
		return ylq;
	}
	public void setYlq(String ylq) {
		this.ylq = ylq;
	}
	public String getXgsj() {
		return xgsj;
	}
	public void setXgsj(String xgsj) {
		this.xgsj = xgsj;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
