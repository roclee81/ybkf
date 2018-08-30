package com.shuxin.model;

import java.io.Serializable;
import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * 病种
 */
@TableName("T_ZD_BZZD")
public class Disease implements Serializable{
	
	@TableField(exist = false)
	private static final long serialVersionUID = -8362871812343769749L;

	/**
	 * 病种分类
	 */
	@TableField(value = "bzfl")
	private String diseaseType;
	
	/**
	 * 病种序列
	 */
	@TableField(value = "bzxh")
	private String diseaseSeq;
	
	/**
	 * 病种名字
	 */
	@TableField(value = "bzmc")
	private String diseaseName;
	
	@TableId(type = IdType.UUID)
	private String id;
	
	/**
	 * 病种编码
	 */
	@TableField(value = "zdbm")
	private String diseaseCode;
	
	/**
	 * 病种类型
	 */
	@TableField(value = "bzlx")
	private String diseaseMode;
	
	/**
	 * 描述信息
	 */
	@TableField(value = "bz")
	private String diseaseDesc;
	
	/**
	 * 治疗方式
	 */
	@TableField(value = "zlfs")
	private String treatmentMethod;
	
	/**
	 * 是否临床路径管理（0否1是）
	 */
	@TableField(value = "sflcljgl")
	private String pathWayFlag;

	public String getDiseaseType() {
		return diseaseType;
	}

	public void setDiseaseType(String diseaseType) {
		this.diseaseType = diseaseType;
	}

	public String getDiseaseSeq() {
		return diseaseSeq;
	}

	public void setDiseaseSeq(String diseaseSeq) {
		this.diseaseSeq = diseaseSeq;
	}

	public String getDiseaseName() {
		return diseaseName;
	}

	public void setDiseaseName(String diseaseName) {
		this.diseaseName = diseaseName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDiseaseCode() {
		return diseaseCode;
	}

	public void setDiseaseCode(String diseaseCode) {
		this.diseaseCode = diseaseCode;
	}

	public String getDiseaseMode() {
		return diseaseMode;
	}

	public void setDiseaseMode(String diseaseMode) {
		this.diseaseMode = diseaseMode;
	}

	public String getDiseaseDesc() {
		return diseaseDesc;
	}

	public void setDiseaseDesc(String diseaseDesc) {
		this.diseaseDesc = diseaseDesc;
	}

	public String getTreatmentMethod() {
		return treatmentMethod;
	}

	public void setTreatmentMethod(String treatmentMethod) {
		this.treatmentMethod = treatmentMethod;
	}

	public String getPathWayFlag() {
		return pathWayFlag;
	}

	public void setPathWayFlag(String pathWayFlag) {
		this.pathWayFlag = pathWayFlag;
	}

	

}
