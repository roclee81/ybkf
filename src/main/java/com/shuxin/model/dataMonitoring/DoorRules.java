package com.shuxin.model.dataMonitoring;

import java.io.Serializable;
import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
@TableName("T_DM_MG_GJZB")
public class DoorRules implements Serializable{
	
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;
	
	private String syear;
	
	private String smonth;
	
	private String ksbm;
	
	private String ksmc;
	
	private String ysgh;
	
	private String ysxm;
	
	private String cblxbm;
	
	private String cblx;
	
	private String bzxh;
	
	private String bzmc;
	
	private String qybm;
	
	private String qy;
	
	private Integer hzls;
	
	private Integer jzrs;
	
	private Integer jzrc;
	
	private Integer ylf;
	
	private Integer ybtczf;
	
	private Integer hzfd;
	
	private Integer cjfy;
	
	private Integer chyf;
	
	private Integer cjjcjye;
	
	private Integer wgdjs;
	
	private Integer wgje;
	
	private Integer ydcers;
	
	private Integer ndcers;

	public String getSyear() {
		return syear;
	}

	public void setSyear(String syear) {
		this.syear = syear;
	}

	public String getSmonth() {
		return smonth;
	}

	public void setSmonth(String smonth) {
		this.smonth = smonth;
	}

	public String getKsbm() {
		return ksbm;
	}

	public void setKsbm(String ksbm) {
		this.ksbm = ksbm;
	}

	public String getKsmc() {
		return ksmc;
	}

	public void setKsmc(String ksmc) {
		this.ksmc = ksmc;
	}

	public String getYsgh() {
		return ysgh;
	}

	public void setYsgh(String ysgh) {
		this.ysgh = ysgh;
	}

	public String getYsxm() {
		return ysxm;
	}

	public void setYsxm(String ysxm) {
		this.ysxm = ysxm;
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

	public String getQybm() {
		return qybm;
	}

	public void setQybm(String qybm) {
		this.qybm = qybm;
	}

	public String getQy() {
		return qy;
	}

	public void setQy(String qy) {
		this.qy = qy;
	}

	public Integer getHzls() {
		return hzls;
	}

	public void setHzls(Integer hzls) {
		this.hzls = hzls;
	}

	public Integer getJzrs() {
		return jzrs;
	}

	public void setJzrs(Integer jzrs) {
		this.jzrs = jzrs;
	}

	public Integer getJzrc() {
		return jzrc;
	}

	public void setJzrc(Integer jzrc) {
		this.jzrc = jzrc;
	}

	public Integer getYlf() {
		return ylf;
	}

	public void setYlf(Integer ylf) {
		this.ylf = ylf;
	}

	public Integer getYbtczf() {
		return ybtczf;
	}

	public void setYbtczf(Integer ybtczf) {
		this.ybtczf = ybtczf;
	}

	public Integer getHzfd() {
		return hzfd;
	}

	public void setHzfd(Integer hzfd) {
		this.hzfd = hzfd;
	}

	public Integer getCjfy() {
		return cjfy;
	}

	public void setCjfy(Integer cjfy) {
		this.cjfy = cjfy;
	}

	public Integer getChyf() {
		return chyf;
	}

	public void setChyf(Integer chyf) {
		this.chyf = chyf;
	}

	public Integer getCjjcjye() {
		return cjjcjye;
	}

	public void setCjjcjye(Integer cjjcjye) {
		this.cjjcjye = cjjcjye;
	}

	public Integer getWgdjs() {
		return wgdjs;
	}

	public void setWgdjs(Integer wgdjs) {
		this.wgdjs = wgdjs;
	}

	public Integer getWgje() {
		return wgje;
	}

	public void setWgje(Integer wgje) {
		this.wgje = wgje;
	}

	public Integer getYdcers() {
		return ydcers;
	}

	public void setYdcers(Integer ydcers) {
		this.ydcers = ydcers;
	}

	public Integer getNdcers() {
		return ndcers;
	}

	public void setNdcers(Integer ndcers) {
		this.ndcers = ndcers;
	}

	@Override
	public String toString() {
		return "DoorRules [syear=" + syear + ", smonth=" + smonth + ", ksbm=" + ksbm + ", ksmc=" + ksmc + ", ysgh="
				+ ysgh + ", ysxm=" + ysxm + ", cblxbm=" + cblxbm + ", cblx=" + cblx + ", bzxh=" + bzxh + ", bzmc="
				+ bzmc + ", qybm=" + qybm + ", qy=" + qy + ", hzls=" + hzls + ", jzrs=" + jzrs + ", jzrc=" + jzrc
				+ ", ylf=" + ylf + ", ybtczf=" + ybtczf + ", hzfd=" + hzfd + ", cjfy=" + cjfy + ", chyf=" + chyf
				+ ", cjjcjye=" + cjjcjye + ", wgdjs=" + wgdjs + ", wgje=" + wgje + ", ydcers=" + ydcers + ", ndcers="
				+ ndcers + "]";
	}
	
	
    
    
}