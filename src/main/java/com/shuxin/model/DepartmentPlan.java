package com.shuxin.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

/**
*
* 科室费用计划分配
*
*/
@TableName("T_YSGL_KSJJPF")
public class DepartmentPlan  implements Serializable{

	
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;
	
	/** 这年 */
	private String  syear ;
	

	/**科室编码 */
	private String  ksbm ;
	
	/** 参保类型编码*/
	private String  cblxbm ;
	
	/**控费时间方式*/
	private String  kfsjfs ;
	/**基金限额*/
	private String  jjxe ;
	
	/**医疗总费用限额*/
	private String  ylzfyxe ;
	
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
	/**住院天数限额*/
	private String  zytsxd ;
	/**患者负担占比限额*/
	private String  hzfdzbxe ;
	/**乙类自付比限额*/
	private String  ylzfbxe ;
	/**住院人次*/
	private String  zyrc ;
	/**区域*/
	private String qy ;
	
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
	public String getCblxbm() {
		return cblxbm;
	}
	public void setCblxbm(String cblxbm) {
		this.cblxbm = cblxbm;
	}
	public String getKfsjfs() {
		return kfsjfs;
	}
	public void setKfsjfs(String kfsjfs) {
		this.kfsjfs = kfsjfs;
	}
	public String getJjxe() {
		return jjxe;
	}
	public void setJjxe(String jjxe) {
		this.jjxe = jjxe;
	}
	public String getYlzfyxe() {
		return ylzfyxe;
	}
	public void setYlzfyxe(String ylzfyxe) {
		this.ylzfyxe = ylzfyxe;
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
	public String getHzfdzbxe() {
		return hzfdzbxe;
	}
	public void setHzfdzbxe(String hzfdzbxe) {
		this.hzfdzbxe = hzfdzbxe;
	}
	public String getYlzfbxe() {
		return ylzfbxe;
	}
	public void setYlzfbxe(String ylzfbxe) {
		this.ylzfbxe = ylzfbxe;
	}
	
	public String getZyrc() {
		return zyrc;
	}
	public void setZyrc(String zyrc) {
		this.zyrc = zyrc;
	}
	public String getQy() {
		return qy;
	}
	public void setQy(String qy) {
		this.qy = qy;
	}
	
	public DepartmentPlan() {
		super();
	}
	public DepartmentPlan(String syear, String ksbm, String cblxbm, String jjxe, String ylzfyxe,
			String zfbxe, String yzbxe, String jcjyzbxe, String zlzbxe, String hczbxe, String zytsxd, String hzfdzbxe,
			String ylzfbxe, String zyrc, String qy) {
		super();
		this.syear = syear;
		this.ksbm = ksbm;
		this.cblxbm = cblxbm;
		this.kfsjfs = "1";
		this.jjxe = jjxe;
		this.ylzfyxe = ylzfyxe;
		this.zfbxe = zfbxe;
		this.yzbxe = yzbxe;
		this.jcjyzbxe = jcjyzbxe;
		this.zlzbxe = zlzbxe;
		this.hczbxe = hczbxe;
		this.zytsxd = zytsxd;
		this.hzfdzbxe = hzfdzbxe;
		this.ylzfbxe = ylzfbxe;
		// 参保类型编码 为390 需要为区域赋值
		if(cblxbm.equals("390")){
			this.qy = qy;
			// 住院人次 为 历城区时 赋值
			if(qy.equals("370112")){
				this.zyrc = zyrc;
			}
		}else{
			this.qy = null;
			this.zyrc = zyrc;
		}
	}
	
	
	
	
	
	
}
