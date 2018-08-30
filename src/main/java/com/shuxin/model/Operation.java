package com.shuxin.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@TableName("T_ZD_SSZDB")
public class Operation implements Serializable {
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 主键id */
	//手术代码
	//@TableId(type = IdType.UUID)
	private String ssdm;
	/** 角色名 */
	//手术名称
	private String ssmc;
	//手术级别
	private String ssjb;
	//id
	@TableId(type = IdType.UUID)
	private String id;
	//get,set方法
	public String getSsdm() {
		return ssdm;
	}
	public void setSsdm(String ssdm) {
		this.ssdm = ssdm;
	}
	public String getSsmc() {
		return ssmc;
	}
	public void setSsmc(String ssmc) {
		this.ssmc = ssmc;
	}
	public String getSsjb() {
		return ssjb;
	}
	public void setSsjb(String ssjb) {
		this.ssjb = ssjb;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Operation [ssdm=" + ssdm + ", ssmc=" + ssmc + ", ssjb=" + ssjb + ", id=" + id + "]";
	}
}
