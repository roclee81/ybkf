package com.shuxin.model.checkManager;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 *
 * 异地就医
 *
 */
@TableName("T_DM_YDJY")
public class YDMedical implements Serializable {
	

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;
	/** 系统年月 */
	private String  syearmonth ;
	/** 这年 */	
	private String  syear ;
	/** 这月*/
	
	private String  smonth ;
	/**科室编码 */
	private String  ksbm ;
	/** 科室名称 */
	private String  ksmc ;
	/**就医类型编码 */
	private String  jylxbm ;
	/**就医类型名称*/
	private String  jylx ;
	/**患者id */
	private String  hzid ;
	/**姓名*/
	private String  xm ;
	/**医疗总费用 */
	private String  ylzfy ;
	/**医保统筹支付费用*/
	private String  ybtczffy ;
	/**报销比例 */
	private String  bxbl ;
	/**医保拒付金额*/
	private String  ybjfje ;
	/**药品总费用 */
	private String  ypzfy ;
	/**检查检验总费用*/
	private String  jcjyzfy ;
	
	/**诊疗总费用 */
	private String  zlzfy ;
	/**材料总费用*/
	private String  clzfy ;
	public String getSyearmonth() {
		return syearmonth;
	}
	public void setSyearmonth(String syearmonth) {
		this.syearmonth = syearmonth;
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
	
	public String getJylxbm() {
		return jylxbm;
	}
	public void setJylxbm(String jylxbm) {
		this.jylxbm = jylxbm;
	}
	public String getJylx() {
		return jylx;
	}
	public void setJylx(String jylx) {
		this.jylx = jylx;
	}
	public String getHzid() {
		return hzid;
	}
	public void setHzid(String hzid) {
		this.hzid = hzid;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getYlzfy() {
		return ylzfy;
	}
	public void setYlzfy(String ylzfy) {
		this.ylzfy = ylzfy;
	}
	public String getYbtczffy() {
		return ybtczffy;
	}
	public void setYbtczffy(String ybtczffy) {
		this.ybtczffy = ybtczffy;
	}
	public String getBxbl() {
		return bxbl;
	}
	public void setBxbl(String bxbl) {
		this.bxbl = bxbl;
	}
	public String getYbjfje() {
		return ybjfje;
	}
	public void setYbjfje(String ybjfje) {
		this.ybjfje = ybjfje;
	}
	public String getYpzfy() {
		return ypzfy;
	}
	public void setYpzfy(String ypzfy) {
		this.ypzfy = ypzfy;
	}
	public String getJcjyzfy() {
		return jcjyzfy;
	}
	public void setJcjyzfy(String jcjyzfy) {
		this.jcjyzfy = jcjyzfy;
	}
	public String getZlzfy() {
		return zlzfy;
	}
	public void setZlzfy(String zlzfy) {
		this.zlzfy = zlzfy;
	}
	public String getClzfy() {
		return clzfy;
	}
	public void setClzfy(String clzfy) {
		this.clzfy = clzfy;
	}
	
	
	
	
	
	
	
}
