package com.shuxin.model.vo;

public class CostStructVo {
	
	/**
	 * 开始年月日
	 */
	private String syearmonthday;
		
	/**
	 * 年
	 */
	private String syear;
	
	/**
	 * 月
	 */
	private String smonth;

	/**
	 * 日
	 */
	private String sday;
	
	/**
	 * 部门编码
	 */
	private String ksbm;


	/**
	 * 动态调用方法标识(多个用逗号隔开)
	 */
	private String methodFlag;
	
	/**
	 * 排序类型
	 */
	private String orderType="0";
	
	/**
	 * 參保类型
	 */
	private String cblxbm;
	
	/**
	 * 病种序号
	 */
	private String bzxh;
	/**
	 * 病种序号
	 */
	private String qybm;

	
	private String ldate;//时间段中的最小值
	
	private String hdate;//时间段中的最大值
	
	private String ysxm;//医生姓名
	private String ysgh;//医生工号	
	private String shzt;//审核状态
	private String gzxh;//违规规则
	private String sfzhm;//身份证号码
	private String hzxm;//患者姓名
	private String bah;//病案号
	private String lsh;//流水号
	private String lmonth;
	private String mzlsh;
	private String mzjbmc;
	private String jyfs;
	private String bzbm;
	private String bzmc;
	private String zyzt;//住院状态
	private String ryzd;//入院诊断
	private String cyzd;//出院诊断
	private String zlfs;//治疗方式
	private String lcyrq;//出院日期（起始）
	private String hcyrq;//出院日期（结束）
	
	
	public String getBzmc() {
		return bzmc;
	}

	public void setBzmc(String bzmc) {
		this.bzmc = bzmc;
	}

	public String getBzbm() {
		return bzbm;
	}

	public void setBzbm(String bzbm) {
		this.bzbm = bzbm;
	}

	public String getLdate() {
		return ldate;
	}

	public void setLdate(String ldate) {
		this.ldate = ldate;
	}

	public String getHdate() {
		return hdate;
	}

	public void setHdate(String hdate) {
		this.hdate = hdate;
	}

	public String getCblxbm() {
		return cblxbm;
	}

	public void setCblxbm(String cblxbm) {
		this.cblxbm = cblxbm;
	}


	public String getMethodFlag() {
		return methodFlag;
	}

	public void setMethodFlag(String methodFlag) {
		this.methodFlag = methodFlag;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
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

	public String getBzxh() {
		return bzxh;
	}

	public void setBzxh(String bzxh) {
		this.bzxh = bzxh;
	}

	public String getQybm() {
		return qybm;
	}

	public void setQybm(String qybm) {
		this.qybm = qybm;
	}

	public String getYsxm() {
		return ysxm;
	}

	public void setYsxm(String ysxm) {
		this.ysxm = ysxm;
	}

	public String getYsgh() {
		return ysgh;
	}

	public void setYsgh(String ysgh) {
		this.ysgh = ysgh;
	}

	public String getShzt() {
		return shzt;
	}

	public void setShzt(String shzt) {
		this.shzt = shzt;
	}

	public String getGzxh() {
		return gzxh;
	}

	public void setGzxh(String gzxh) {
		this.gzxh = gzxh;
	}

	public String getSfzhm() {
		return sfzhm;
	}

	public void setSfzhm(String sfzhm) {
		this.sfzhm = sfzhm;
	}

	public String getHzxm() {
		return hzxm;
	}

	public void setHzxm(String hzxm) {
		this.hzxm = hzxm;
	}

	public String getBah() {
		return bah;
	}

	public void setBah(String bah) {
		this.bah = bah;
	}

	public String getLsh() {
		return lsh;
	}

	public void setLsh(String lsh) {
		this.lsh = lsh;
	}

	public String getSday() {
		return sday;
	}

	public void setSday(String sday) {
		this.sday = sday;
	}

	public String getSyearmonthday() {
		return syearmonthday;
	}

	public void setSyearmonthday(String syearmonthday) {
		this.syearmonthday = syearmonthday;
	}

	public String getLmonth() {
		return lmonth;
	}

	public void setLmonth(String lmonth) {
		this.lmonth = lmonth;
	}

	public String getMzlsh() {
		return mzlsh;
	}

	public void setMzlsh(String mzlsh) {
		this.mzlsh = mzlsh;
	}

	
	public String getMzjbmc() {
		return mzjbmc;
	}

	public void setMzjbmc(String mzjbmc) {
		this.mzjbmc = mzjbmc;
	}

	public String getJyfs() {
		return jyfs;
	}

	public void setJyfs(String jyfs) {
		this.jyfs = jyfs;
	}

	
	
	public String getZyzt() {
		return zyzt;
	}

	public void setZyzt(String zyzt) {
		this.zyzt = zyzt;
	}

	
	
	public String getRyzd() {
		return ryzd;
	}

	public void setRyzd(String ryzd) {
		this.ryzd = ryzd;
	}

	
	
	public String getZlfs() {
		return zlfs;
	}

	public void setZlfs(String zlfs) {
		this.zlfs = zlfs;
	}

	public String getLcyrq() {
		return lcyrq;
	}

	public void setLcyrq(String lcyrq) {
		this.lcyrq = lcyrq;
	}

	public String getHcyrq() {
		return hcyrq;
	}

	public void setHcyrq(String hcyrq) {
		this.hcyrq = hcyrq;
	}
	

	public String getCyzd() {
		return cyzd;
	}

	public void setCyzd(String cyzd) {
		this.cyzd = cyzd;
	}

	@Override
	public String toString() {
		return "CostStructVo [syearmonthday=" + syearmonthday + ", syear=" + syear + ", smonth=" + smonth + ", sday="
				+ sday + ", ksbm=" + ksbm + ", methodFlag=" + methodFlag + ", orderType=" + orderType + ", cblxbm="
				+ cblxbm + ", bzxh=" + bzxh + ", qybm=" + qybm + ", ldate=" + ldate + ", hdate=" + hdate + ", ysxm="
				+ ysxm + ", ysgh=" + ysgh + ", shzt=" + shzt + ", gzxh=" + gzxh + ", sfzhm=" + sfzhm + ", hzxm=" + hzxm
				+ ", bah=" + bah + ", lsh=" + lsh + ", lmonth=" + lmonth + ", mzlsh=" + mzlsh + ", mzjbmc=" + mzjbmc
				+ ", jyfs=" + jyfs + ", bzbm=" + bzbm + ", bzmc=" + bzmc + ", zyzt=" + zyzt + ", ryzd=" + ryzd
				+ ", cyzd=" + cyzd + ", zlfs=" + zlfs + ", lcyrq=" + lcyrq + ", hcyrq=" + hcyrq + "]";
	}


}
