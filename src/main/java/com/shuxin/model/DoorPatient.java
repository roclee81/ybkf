package com.shuxin.model;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@TableName("T_TB_MGHZDJ_HZ")
public class DoorPatient implements Serializable {
	
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	@TableId(type = IdType.UUID)
	private String id;

	/** 参保类型*/
	private String cblx;
	/** 患者姓名*/
	private String hzxm;
	/** 身份证号码*/
	private String sfzhm;
	/** 单位或地址*/
	private String dwhzz;	

	/** 是否介入治疗*/
	private String sfjrzl;
	/** 患者状态*/
	private String hzzt;
	
	/** 生效时间 */
	private Date sxsj;
	/** 失效时间 */
	private Date sxsj1;
	/** 修改时间 */
	private Date xgsj;
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
	public String getHzxm() {
		return hzxm;
	}
	public void setHzxm(String hzxm) {
		this.hzxm = hzxm;
	}
	public String getSfzhm() {
		return sfzhm;
	}
	public void setSfzhm(String sfzhm) {
		this.sfzhm = sfzhm;
	}
	public String getDwhzz() {
		return dwhzz;
	}
	public void setDwhzz(String dwhzz) {
		this.dwhzz = dwhzz;
	}
	
	public String getSfjrzl() {
		return sfjrzl;
	}
	public void setSfjrzl(String sfjrzl) {
		this.sfjrzl = sfjrzl;
	}
	public String getHzzt() {
		return hzzt;
	}
	public void setHzzt(String hzzt) {
		this.hzzt = hzzt;
	}
	public Date getSxsj() {
		return sxsj;
	}
	public void setSxsj(Date sxsj) {
		this.sxsj = sxsj;
	}
	public Date getSxsj1() {
		return sxsj1;
	}
	public void setSxsj1(Date sxsj1) {
		this.sxsj1 = sxsj1;
	}
	public Date getXgsj() {
		return xgsj;
	}
	public void setXgsj(Date xgsj) {
		this.xgsj = xgsj;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	

}
