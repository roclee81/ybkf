package com.shuxin.model;

import java.io.Serializable;
import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
@TableName("DM_KSZD")
public class Department implements Serializable{
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;
	
	private String ksdm;

    private String ksmc;

    private Integer edcw;
    
    private String mzsy;
    
    private String yjsy;
    
    private String zysy;
    
    private String bqsy;

	public String getKsdm() {
		return ksdm;
	}

	public void setKsdm(String ksdm) {
		this.ksdm = ksdm;
	}

	public String getKsmc() {
		return ksmc;
	}

	public void setKsmc(String ksmc) {
		this.ksmc = ksmc;
	}

	public Integer getEdcw() {
		return edcw;
	}

	public void setEdcw(Integer edcw) {
		this.edcw = edcw;
	}

	public String getMzsy() {
		return mzsy;
	}

	public void setMzsy(String mzsy) {
		this.mzsy = mzsy;
	}

	public String getYjsy() {
		return yjsy;
	}

	public void setYjsy(String yjsy) {
		this.yjsy = yjsy;
	}

	public String getZysy() {
		return zysy;
	}

	public void setZysy(String zysy) {
		this.zysy = zysy;
	}

	public String getBqsy() {
		return bqsy;
	}

	public void setBqsy(String bqsy) {
		this.bqsy = bqsy;
	}

	@Override
	public String toString() {
		return "Department [ksdm=" + ksdm + ", ksmc=" + ksmc + ", edcw=" + edcw + ", mzsy=" + mzsy + ", yjsy=" + yjsy
				+ ", zysy=" + zysy + ", bqsy=" + bqsy + "]";
	}
    
    
}