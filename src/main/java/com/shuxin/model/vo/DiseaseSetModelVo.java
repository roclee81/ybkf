package com.shuxin.model.vo;

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
public class DiseaseSetModelVo implements Serializable{

	private static final long serialVersionUID = 1L;
	//id
	private String id;
	//病种序号
	private String bzxh;
	//病种分类
	private String bzfl;
	//疾病编码
	private String jbbm;
	//疾病名称
	private String jbmc;
	//治疗方式编码
	private String zlfsbm;
	//治疗方式名称
	private String zlfsmc;
	//医疗费限额
	private Integer ylfxe;
	//医保统筹支付限额
	private Integer ybtcfxe;
	//限定住院时间
	private Integer xdzyts;
	//药品费
	private Integer ypf;
	//手术费
	private Integer ssf;
	//麻醉费
	private Integer mzf;
	//检查费
	private Integer jcf;
	//检验费
	private Integer jyf;
	//诊疗费
	private Integer zlf;
	//材料费
	private Integer clf;
	//生效时间
	private String effectime;
	//失效时间
	private String failuretime;


	public DiseaseSetModelVo() {
		super();
		// TODO Auto-generated constructor stub
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


	public String getEffectime() {
		return effectime;
	}


	public void setEffectime(String effectime) {
		this.effectime = effectime;
	}


	public String getFailuretime() {
		return failuretime;
	}

	public void setFailuretime(String failuretime) {
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
	
	
}
