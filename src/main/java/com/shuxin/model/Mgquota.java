package com.shuxin.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableName;

@TableName("T_TB_MGHZDJ_HZ")
public class Mgquota implements Serializable {
	

	/** 年月日*/
	private String syearmonthday;
	/** 年*/
	private String syear;
	/** 月*/
	private String smonth;
	/** 日*/
	private String sday;
	/** 科室编码*/
	private String ksbm;
	/** 科室名称*/
	private String ksmc;
	/** 医生工号*/
	private String ysgh;
	/** 医生姓名*/
	private String ysxm;
	/** 参保类型编码*/
	private String cblxbm;
	/** 参保类型*/
	private String cblx;
	/** 病种序号*/
	private String bzxh;
	/** 病种名称*/
	private String bzmc;
	
	/** 区域编码*/
	private String qybm;
	
	/** 区域*/
	private String qy;
	
	/** 患者例数*/
	private String hzls;
	
	/** 就诊人数*/
	private String jzrs;
	/** 就诊人次*/
	private String jzrc;
	/** 医疗费*/
	private String ylf;
	/** 医保统筹支付*/
	private String ybtczf;
	/** 患者负担*/
	private String hzfd;
	/** 次均费用*/
	private String cjfy;
	/** 次均药费*/
	private String cjyf;
	/** 次均检查检验费*/
	private String cjjcjyf;
	/** 违规单据数*/
	private String wgdjs;
	/** 违规金额*/
	private String wgje;
	/**月度超额人数*/
	private String ydcers;
	/**月度超额人次*/
	private String ydcerc;
	/**年度超额人数*/
	private String ndcers;

	
	public String getSyearmonthday() {
		return syearmonthday;
	}
	public void setSyearmonthday(String syearmonthday) {
		this.syearmonthday = syearmonthday;
	}
	public String getSday() {
		return sday;
	}
	public void setSday(String sday) {
		this.sday = sday;
	}
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
	public String getHzls() {
		return hzls;
	}
	public void setHzls(String hzls) {
		this.hzls = hzls;
	}
	public String getJzrs() {
		return jzrs;
	}
	public void setJzrs(String jzrs) {
		this.jzrs = jzrs;
	}
	public String getJzrc() {
		return jzrc;
	}
	public void setJzrc(String jzrc) {
		this.jzrc = jzrc;
	}
	public String getYlf() {
		return ylf;
	}
	public void setYlf(String ylf) {
		this.ylf = ylf;
	}
	public String getYbtczf() {
		return ybtczf;
	}
	public void setYbtczf(String ybtczf) {
		this.ybtczf = ybtczf;
	}
	public String getHzfd() {
		return hzfd;
	}
	public void setHzfd(String hzfd) {
		this.hzfd = hzfd;
	}
	public String getCjfy() {
		return cjfy;
	}
	public void setCjfy(String cjfy) {
		this.cjfy = cjfy;
	}
	public String getCjyf() {
		return cjyf;
	}
	public void setCjyf(String cjyf) {
		this.cjyf = cjyf;
	}
	public String getCjjcjyf() {
		return cjjcjyf;
	}
	public void setCjjcjyf(String cjjcjyf) {
		this.cjjcjyf = cjjcjyf;
	}
	public String getWgdjs() {
		return wgdjs;
	}
	public void setWgdjs(String wgdjs) {
		this.wgdjs = wgdjs;
	}
	public String getWgje() {
		return wgje;
	}
	public void setWgje(String wgje) {
		this.wgje = wgje;
	}
	public String getYdcers() {
		return ydcers;
	}
	public void setYdcers(String ydcers) {
		this.ydcers = ydcers;
	}
	public String getYdcerc() {
		return ydcerc;
	}
	public void setYdcerc(String ydcerc) {
		this.ydcerc = ydcerc;
	}
	public String getNdcers() {
		return ndcers;
	}
	public void setNdcers(String ndcers) {
		this.ndcers = ndcers;
	}
	@Override
	public String toString() {
		return "Mgquota [syearmonthday=" + syearmonthday + ", syear=" + syear + ", smonth=" + smonth + ", sday=" + sday
				+ ", ksbm=" + ksbm + ", ksmc=" + ksmc + ", ysgh=" + ysgh + ", ysxm=" + ysxm + ", cblxbm=" + cblxbm
				+ ", cblx=" + cblx + ", bzxh=" + bzxh + ", bzmc=" + bzmc + ", qybm=" + qybm + ", qy=" + qy + ", hzls="
				+ hzls + ", jzrs=" + jzrs + ", jzrc=" + jzrc + ", ylf=" + ylf + ", ybtczf=" + ybtczf + ", hzfd=" + hzfd
				+ ", cjfy=" + cjfy + ", cjyf=" + cjyf + ", cjjcjyf=" + cjjcjyf + ", wgdjs=" + wgdjs + ", wgje=" + wgje
				+ ", ydcers=" + ydcers + ", ydcerc=" + ydcerc + ", ndcers=" + ndcers + "]";
	}
	
	
}
