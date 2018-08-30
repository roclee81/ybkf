package com.shuxin.model;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
/**
 * 系统配置--病种指标设定
 * @author admin
 *
 */
@TableName(value="dm_sys_bzzbsd")
public class DiseaseSetModel implements Serializable{

	@TableField(exist=false)
	private static final long serialVersionUID = 1L;
	//id
	@TableId(type = IdType.UUID)
	private String id;
	//病种序号
	@TableField(value="bzxh")
	private String bzxh;
	//病种分类
	@TableField(value="bzfl")
	private String bzfl;
	//疾病编码
	@TableField(value="jbbm")
	private String jbbm;
	//疾病名称
	@TableField(value="jbmc")
	private String jbmc;
	//治疗方式编码
	@TableField(value="zlfsbm")
	private String zlfsbm;
	//治疗方式名称
	@TableField(value="zlfsmc")
	private String zlfsmc;
	//医疗费限额
	@TableField(value="ylfxe")
	private Integer ylfxe;
	//医保统筹支付限额
	@TableField(value="ybtcfxe")
	private Integer ybtcfxe;
	//限定住院时间
	@TableField(value="xdzyts")
	private Integer xdzyts;
	//药品费
	@TableField(value="ypf")
	private Integer ypf;
	//手术费
	@TableField(value="ssf")
	private Integer ssf;
	//麻醉费
	@TableField(value="mzf")
	private Integer mzf;
	//检查费
	@TableField(value="jcf")
	private Integer jcf;
	//检验费
	@TableField(value="jyf")
	private Integer jyf;
	//诊疗费
	@TableField(value="zlf")
	private Integer zlf;
	//材料费
	@TableField(value="clf")
	private Integer clf;
	//生效时间
	@TableField(value="effectime")
	private Date effectime;
	//失效时间
	@TableField(value="failuretime")
	private Date failuretime;


	public DiseaseSetModel() {
		super();
		// TODO Auto-generated constructor stub
	}


	public DiseaseSetModel(String bzxh, String bzfl, String jbbm, String jbmc, Integer ylfxe, Integer ybtcfxe,
			Integer xdzyts, Integer ypf, Integer ssf, Integer mzf, Integer jcf, Integer jyf, Integer zlf, Integer clf,
			Date effectime, Date failuretime) {
		super();
		this.bzxh = bzxh;
		this.bzfl = bzfl;
		this.jbbm = jbbm;
		this.jbmc = jbmc;
		this.ylfxe = ylfxe;
		this.ybtcfxe = ybtcfxe;
		this.xdzyts = xdzyts;
		this.ypf = ypf;
		this.ssf = ssf;
		this.mzf = mzf;
		this.jcf = jcf;
		this.jyf = jyf;
		this.zlf = zlf;
		this.clf = clf;
		this.effectime = effectime;
		this.failuretime = failuretime;
	}


	public String getBzxh() {
		return bzxh;
	}


	public void setBzxh(String bzxh) {
		this.bzxh = bzxh;
	}


	public String getBzfl() {
		return bzfl;
	}


	public void setBzfl(String bzfl) {
		this.bzfl = bzfl;
	}


	public String getJbbm() {
		return jbbm;
	}


	public void setJbbm(String jbbm) {
		this.jbbm = jbbm;
	}


	public String getJbmc() {
		return jbmc;
	}


	public void setJbmc(String jbmc) {
		this.jbmc = jbmc;
	}


	public Integer getYlfxe() {
		return ylfxe;
	}


	public void setYlfxe(Integer ylfxe) {
		this.ylfxe = ylfxe;
	}


	public Integer getYbtcfxe() {
		return ybtcfxe;
	}


	public void setYbtcfxe(Integer ybtcfxe) {
		this.ybtcfxe = ybtcfxe;
	}


	public Integer getXdzyts() {
		return xdzyts;
	}


	public void setXdzyts(Integer xdzyts) {
		this.xdzyts = xdzyts;
	}


	public Integer getYpf() {
		return ypf;
	}


	public void setYpf(Integer ypf) {
		this.ypf = ypf;
	}


	public Integer getSsf() {
		return ssf;
	}


	public void setSsf(Integer ssf) {
		this.ssf = ssf;
	}


	public Integer getMzf() {
		return mzf;
	}


	public void setMzf(Integer mzf) {
		this.mzf = mzf;
	}


	public Integer getJcf() {
		return jcf;
	}


	public void setJcf(Integer jcf) {
		this.jcf = jcf;
	}


	public Integer getJyf() {
		return jyf;
	}


	public void setJyf(Integer jyf) {
		this.jyf = jyf;
	}


	public Integer getZlf() {
		return zlf;
	}


	public void setZlf(Integer zlf) {
		this.zlf = zlf;
	}


	public Integer getClf() {
		return clf;
	}


	public void setClf(Integer clf) {
		this.clf = clf;
	}


	public Date getEffectime() {
		return effectime;
	}


	public void setEffectime(Date effectime) {
		this.effectime = effectime;
	}


	public Date getFailuretime() {
		return failuretime;
	}

	public void setFailuretime(Date failuretime) {
		this.failuretime = failuretime;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public String getZlfsbm() {
		return zlfsbm;
	}

	public void setZlfsbm(String zlfsbm) {
		this.zlfsbm = zlfsbm;
	}

	public String getZlfsmc() {
		return zlfsmc;
	}

	public void setZlfsmc(String zlfsmc) {
		this.zlfsmc = zlfsmc;
	}


	@Override
	public String toString() {
		return "DiseaseSetModel [id=" + id + ", bzxh=" + bzxh + ", bzfl=" + bzfl + ", jbbm=" + jbbm + ", jbmc=" + jbmc
				+ ", zlfsbm=" + zlfsbm + ", zlfsmc=" + zlfsmc + ", ylfxe=" + ylfxe + ", ybtcfxe=" + ybtcfxe
				+ ", xdzyts=" + xdzyts + ", ypf=" + ypf + ", ssf=" + ssf + ", mzf=" + mzf + ", jcf=" + jcf + ", jyf="
				+ jyf + ", zlf=" + zlf + ", clf=" + clf + ", effectime=" + effectime + ", failuretime=" + failuretime
				+ "]";
	}
	
	
	
}
