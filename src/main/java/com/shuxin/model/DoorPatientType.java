package com.shuxin.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@TableName("dim_bzzdb")
public class DoorPatientType implements Serializable{

	
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;
	/**
	 * 病种分类
	 */
    private String bzfl;
    /**
	 * 病种序号
	 */
    @TableId
    private String bzxh;
    /**
   	 * 诊断编码
   	 */
    private String bzbm;
    /**
   	 * 诊断名称
   	 */
    private String bzmc;
    /**
   	 * 1：单病种，2：门特病
   	 */
    private String bzlx;
    /**
   	 * 手术操作名称
   	 */
    private String zlfsmc;
    /**
   	 * 手术操作编码
   	 */
    private String zlfsbm;
    /**
   	 * 医疗总费用限额
   	 */
    private Integer ylzfyxe;
    /**
   	 * 医保统筹支付限额
   	 */
    private Integer ybtczfxe;
    /**
   	 * 限定住院时间
   	 */
    private Integer xdzysj;
    /**
   	 * 报销比例
   	 */
    private Integer bxbl;
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
	public String getBzbm() {
		return bzbm;
	}
	public void setBzbm(String bzbm) {
		this.bzbm = bzbm;
	}
	public String getBzmc() {
		return bzmc;
	}
	public void setBzmc(String bzmc) {
		this.bzmc = bzmc;
	}
	public String getBzlx() {
		return bzlx;
	}
	public void setBzlx(String bzlx) {
		this.bzlx = bzlx;
	}
	public String getZlfsmc() {
		return zlfsmc;
	}
	public void setZlfsmc(String zlfsmc) {
		this.zlfsmc = zlfsmc;
	}
	public String getZlfsbm() {
		return zlfsbm;
	}
	public void setZlfsbm(String zlfsbm) {
		this.zlfsbm = zlfsbm;
	}
	public Integer getYlzfyxe() {
		return ylzfyxe;
	}
	public void setYlzfyxe(Integer ylzfyxe) {
		this.ylzfyxe = ylzfyxe;
	}
	public Integer getYbtczfxe() {
		return ybtczfxe;
	}
	public void setYbtczfxe(Integer ybtczfxe) {
		this.ybtczfxe = ybtczfxe;
	}
	public Integer getXdzysj() {
		return xdzysj;
	}
	public void setXdzysj(Integer xdzysj) {
		this.xdzysj = xdzysj;
	}
	public Integer getBxbl() {
		return bxbl;
	}
	public void setBxbl(Integer bxbl) {
		this.bxbl = bxbl;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "DoorPatientType [bzfl=" + bzfl + ", bzxh=" + bzxh + ", bzbm=" + bzbm + ", bzmc=" + bzmc + ", bzlx="
				+ bzlx + ", zlfsmc=" + zlfsmc + ", zlfsbm=" + zlfsbm + ", ylzfyxe=" + ylzfyxe + ", ybtczfxe=" + ybtczfxe
				+ ", xdzysj=" + xdzysj + ", bxbl=" + bxbl + "]";
	}
}
