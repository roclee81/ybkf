package com.shuxin.model.vo;
/**
 * 门规病种设定
 * @author admin
 *
 */
public class MgDiseasesVo {
	
	private String bzfl;
	
	private String bzxh;
	
	private String zdbm;

	private String zdmc;
	
	private Integer  ylzfyxe;
	
	private Integer  ybtczfxe;
	
	private Integer  bxbl;

	public String getBzfl() {
		return bzfl;
	}

	public void setBzfl(String bzfl) {
		this.bzfl = bzfl;
	}

	public String getBzxh() {
		return bzxh;
	}

	public void setBzxh(String bzxh) {
		this.bzxh = bzxh;
	}

	public String getZdbm() {
		return zdbm;
	}

	public void setZdbm(String zdbm) {
		this.zdbm = zdbm;
	}

	public String getZdmc() {
		return zdmc;
	}

	public void setZdmc(String zdmc) {
		this.zdmc = zdmc;
	}


	public Integer getYlzfyxe() {
		return ylzfyxe;
	}

	public void setYlzfyxe(Integer ylzfyxe) {
		this.ylzfyxe = ylzfyxe;
	}

	public Integer getYbtczfxe() {
		return ybtczfxe;
	}

	public void setYbtczfxe(Integer ybtczfxe) {
		this.ybtczfxe = ybtczfxe;
	}

	public Integer getBxbl() {
		return bxbl;
	}

	public void setBxbl(Integer bxbl) {
		this.bxbl = bxbl;
	}

	@Override
	public String toString() {
		return "MgDiseasesVo [bzfl=" + bzfl + ", bzxh=" + bzxh + ", zdbm=" + zdbm + ", zdmc=" + zdmc + ", ylzfyxe="
				+ ylzfyxe + ", ybtczfxe=" + ybtczfxe + ", bxbl=" + bxbl + "]";
	}

}
