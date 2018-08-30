package com.shuxin.model;

import java.io.Serializable;
import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@TableName("dim_ylzzdb")
public class DoctorGroup implements Serializable{

	
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;
	/**
	 * 医疗组编码
	 */
    private String ylzbm;
    /**
	 * 医疗组名称
	 */
    private String ylzmc;
    /**
   	 * 所属上街科室
   	 */
    private String ssksbm;
    /**
   	 * 医疗组启用标志
   	 */
    private String ylzqybz;
	
    @TableId(type = IdType.UUID)
    private String id;

	public String getYlzbm() {
		return ylzbm;
	}

	public void setYlzbm(String ylzbm) {
		this.ylzbm = ylzbm;
	}

	public String getYlzmc() {
		return ylzmc;
	}

	public void setYlzmc(String ylzmc) {
		this.ylzmc = ylzmc;
	}

	public String getSsksbm() {
		return ssksbm;
	}

	public void setSsksbm(String ssksbm) {
		this.ssksbm = ssksbm;
	}

	public String getYlzqybz() {
		return ylzqybz;
	}

	public void setYlzqybz(String ylzqybz) {
		this.ylzqybz = ylzqybz;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "DoctorGroup [ylzbm=" + ylzbm + ", ylzmc=" + ylzmc + ", ssksbm="
				+ ssksbm + ", ylzqybz=" + ylzqybz + ", id=" + id + "]";
	}
	
    
    
}
