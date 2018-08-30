package com.shuxin.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
/**
 * 门诊审核--可疑单据审核表
 * @author admin
 *
 */
@TableName(value="dm_mz_sh_OutpatientAudit")
public class ClinicReviewModel implements Serializable{

	@TableField(exist=false)
	private static final long serialVersionUID = 1L;
	
	
	@TableId(type = IdType.UUID)
	private String id;
	
	@TableField(value="changedate")
	private String changedate;
	
	@TableField(value="ksdm")
	private String ksdm;
	
	@TableField(value="ksmc")
	private String ksmc;
	
	@TableField(value="person")
	private String person;
	
	@TableField(value="mzlsh")
	private String mzlsh;
	
	@TableField(value="jyfs")
	private String jyfs;
	
	@TableField(value="klyy")
	private String klyy;
	
	@TableField(value="djztbm")
	private Integer djztbm;
	
	@TableField(value="shyj")
	private String shyj;
	
	

	public ClinicReviewModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ClinicReviewModel(String changedate, String ksdm, String ksmc, String person, String mzlsh, String jyfs,
			String klyy, Integer djztbm, String shyj) {
		super();
		this.changedate = changedate;
		this.ksdm = ksdm;
		this.ksmc = ksmc;
		this.person = person;
		this.mzlsh = mzlsh;
		this.jyfs = jyfs;
		this.klyy = klyy;
		this.djztbm = djztbm;
		this.shyj = shyj;
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getChangedate() {
		return changedate;
	}

	public void setChangedate(String changedate) {
		this.changedate = changedate;
	}

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

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public String getMzlsh() {
		return mzlsh;
	}

	public void setMzlsh(String mzlsh) {
		this.mzlsh = mzlsh;
	}

	public String getJyfs() {
		return jyfs;
	}

	public void setJyfs(String jyfs) {
		this.jyfs = jyfs;
	}

	public String getKlyy() {
		return klyy;
	}

	public void setKlyy(String klyy) {
		this.klyy = klyy;
	}

	public Integer getDjztbm() {
		return djztbm;
	}

	public void setDjztbm(Integer djztbm) {
		this.djztbm = djztbm;
	}

	public String getShyj() {
		return shyj;
	}

	public void setShyj(String shyj) {
		this.shyj = shyj;
	}
	
}
