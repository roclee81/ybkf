package com.shuxin.model.vo;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;


public class DoorPatientVo implements Serializable {
	
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

	/** 门规疾病编码*/
	private String mgjbbm;
	/** 门规疾病名称*/
	private String mgjbmc;
	/** 是否介入治疗*/
	private String sfjrzl;
	/** 患者状态*/
	private String hzzt;
	
	/** 生效时间 */
	private String sxsj;
	/** 失效时间 */
	private String sxsj1;
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

	public String getMgjbbm() {
		return mgjbbm;
	}
	public void setMgjbbm(String mgjbbm) {
		this.mgjbbm = mgjbbm;
	}
	public String getMgjbmc() {
		return mgjbmc;
	}
	public void setMgjbmc(String mgjbmc) {
		this.mgjbmc = mgjbmc;
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
	public String getSxsj() {
		return sxsj;
	}
	public void setSxsj(String sxsj) {
		this.sxsj = sxsj;
	}
	public String getSxsj1() {
		return sxsj1;
	}
	public void setSxsj1(String sxsj1) {
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
