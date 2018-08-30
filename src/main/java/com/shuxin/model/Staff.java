package com.shuxin.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@TableName("T_ZD_GZRYZDB")
public class Staff implements Serializable {
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 主键id */
	//人员编号
	//@TableId(type = IdType.UUID)
	private String rybh;
	/** 角色名 */
	//姓名
	private String xm;
	//科室编码
	private String ksbm;
	//人员类别
	private String rylb;
	//id
	@TableId(type = IdType.UUID)
	private String id;
	//以下为getset方法
	public String getRybh() {
		return rybh;
	}
	public void setRybh(String rybh) {
		this.rybh = rybh;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getKsbm() {
		return ksbm;
	}
	public void setKsbm(String ksbm) {
		this.ksbm = ksbm;
	}
	public String getRylb() {
		return rylb;
	}
	public void setRylb(String rylb) {
		this.rylb = rylb;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Staff [rybh=" + rybh + ", xm=" + xm + ", ksbm=" + ksbm + ", rylb=" + rylb + ", id=" + id + "]";
	}
	
}
