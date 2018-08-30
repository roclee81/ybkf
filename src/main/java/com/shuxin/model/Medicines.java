package com.shuxin.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

@TableName("dim_ypzdb")
public class Medicines  implements Serializable {
	
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;
	
	
	@TableField(value = "ypbm")
    private String ypdm;

    private String ypmc;

    @TableField(value = "yptymc")
    private String yptym;

    @TableField(value = "yptymc")
    private String ypbm;

    @TableField(value = "ypgg")
    private String gg;

    private String dw;

    private String jx;

    @TableField(value = "yldw")
    private String jldw;

    private String ypxdl;

    private String sfjbyw;

    private String kjywjb;

    private String yplbbz;

    private String ypfldm;

    private String ypflmc;

    private String kjywbz;

    private String zlyybz;

    private String zyzsjbz;

    private String jsbz;

    private String fzzlywbz;

    private String zxybz;

    private String mlylb;

    
    @TableId(type = IdType.UUID)
    private String id;

    
    @Override
	public String toString() {
		return "Medicines [ypdm=" + ypdm + ", ypmc=" + ypmc + ", yptym="
				+ yptym + ", ypbm=" + ypbm + ", gg=" + gg + ", dw=" + dw
				+ ", jx=" + jx + ", jldw=" + jldw + ", ypxdl=" + ypxdl
				+ ", sfjbyw=" + sfjbyw + ", kjywjb=" + kjywjb + ", yplbbz="
				+ yplbbz + ", ypfldm=" + ypfldm + ", ypflmc=" + ypflmc
				+ ", kjywbz=" + kjywbz + ", zlyybz=" + zlyybz + ", zyzsjbz="
				+ zyzsjbz + ", jsbz=" + jsbz + ", fzzlywbz=" + fzzlywbz
				+ ", zxybz=" + zxybz + ", mlylb=" + mlylb + ", id=" + id + "]";
	}

	public String getYpdm() {
        return ypdm;
    }

    public void setYpdm(String ypdm) {
        this.ypdm = ypdm == null ? null : ypdm.trim();
    }

    public String getYpmc() {
        return ypmc;
    }

    public void setYpmc(String ypmc) {
        this.ypmc = ypmc == null ? null : ypmc.trim();
    }

    public String getYptym() {
        return yptym;
    }

    public void setYptym(String yptym) {
        this.yptym = yptym == null ? null : yptym.trim();
    }

    public String getYpbm() {
        return ypbm;
    }

    public void setYpbm(String ypbm) {
        this.ypbm = ypbm == null ? null : ypbm.trim();
    }

    public String getGg() {
        return gg;
    }

    public void setGg(String gg) {
        this.gg = gg == null ? null : gg.trim();
    }

    public String getDw() {
        return dw;
    }

    public void setDw(String dw) {
        this.dw = dw == null ? null : dw.trim();
    }

    public String getJx() {
        return jx;
    }

    public void setJx(String jx) {
        this.jx = jx == null ? null : jx.trim();
    }

    public String getJldw() {
        return jldw;
    }

    public void setJldw(String jldw) {
        this.jldw = jldw == null ? null : jldw.trim();
    }

    public String getYpxdl() {
        return ypxdl;
    }

    public void setYpxdl(String ypxdl) {
        this.ypxdl = ypxdl == null ? null : ypxdl.trim();
    }

    public String getSfjbyw() {
        return sfjbyw;
    }

    public void setSfjbyw(String sfjbyw) {
        this.sfjbyw = sfjbyw == null ? null : sfjbyw.trim();
    }

    public String getKjywjb() {
        return kjywjb;
    }

    public void setKjywjb(String kjywjb) {
        this.kjywjb = kjywjb == null ? null : kjywjb.trim();
    }

    public String getYplbbz() {
        return yplbbz;
    }

    public void setYplbbz(String yplbbz) {
        this.yplbbz = yplbbz == null ? null : yplbbz.trim();
    }

    public String getYpfldm() {
        return ypfldm;
    }

    public void setYpfldm(String ypfldm) {
        this.ypfldm = ypfldm == null ? null : ypfldm.trim();
    }

    public String getYpflmc() {
        return ypflmc;
    }

    public void setYpflmc(String ypflmc) {
        this.ypflmc = ypflmc == null ? null : ypflmc.trim();
    }

    public String getKjywbz() {
        return kjywbz;
    }

    public void setKjywbz(String kjywbz) {
        this.kjywbz = kjywbz == null ? null : kjywbz.trim();
    }

    public String getZlyybz() {
        return zlyybz;
    }

    public void setZlyybz(String zlyybz) {
        this.zlyybz = zlyybz == null ? null : zlyybz.trim();
    }

    public String getZyzsjbz() {
        return zyzsjbz;
    }

    public void setZyzsjbz(String zyzsjbz) {
        this.zyzsjbz = zyzsjbz == null ? null : zyzsjbz.trim();
    }

    public String getJsbz() {
        return jsbz;
    }

    public void setJsbz(String jsbz) {
        this.jsbz = jsbz == null ? null : jsbz.trim();
    }

    public String getFzzlywbz() {
        return fzzlywbz;
    }

    public void setFzzlywbz(String fzzlywbz) {
        this.fzzlywbz = fzzlywbz == null ? null : fzzlywbz.trim();
    }

    public String getZxybz() {
        return zxybz;
    }

    public void setZxybz(String zxybz) {
        this.zxybz = zxybz == null ? null : zxybz.trim();
    }

    public String getMlylb() {
        return mlylb;
    }

    public void setMlylb(String mlylb) {
        this.mlylb = mlylb == null ? null : mlylb.trim();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }
}