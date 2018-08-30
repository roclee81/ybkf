package com.shuxin.model.vo;

/**
 * 描述:  
 * 详细:   额度grid 表
 * 类名:   QuotaVo
 * 所属包: com.shuxin.model.vo
 * 作者:   ThinkPad
 * 版本:   1.0
 * 日期 :   2017年10月23日 下午4:23:42
 */
public class QuotaVo {

    /* 查询条件 */
    private String syear;

    private String smonth;

    private String cblxbm;

    /**
     * 科室名称
     */
    private String departmentName;

    /**
     * 是否超额 0-- 否 1--是 
     */
    private Integer excess;

    /**
     * 月预算额度
     */
    private Integer monthlyQuoat;
    /**
     * 月使用额度
     */
    private Integer monthlyUserQuota;

    /**
     * 年累计额度
     */
    private Integer yearQuoat;

    /**
     * 年预算额度
     */
    private Integer yearUserQuoat;

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public Integer getExcess() {
        return excess;
    }

    public void setExcess(Integer excess) {
        this.excess = excess;
    }

    public Integer getMonthlyQuoat() {
        return monthlyQuoat;
    }

    public void setMonthlyQuoat(Integer monthlyQuoat) {
        this.monthlyQuoat = monthlyQuoat;
    }

    public Integer getMonthlyUserQuota() {
        return monthlyUserQuota;
    }

    public void setMonthlyUserQuota(Integer monthlyUserQuota) {
        this.monthlyUserQuota = monthlyUserQuota;
    }

    public Integer getYearQuoat() {
        return yearQuoat;
    }

    public void setYearQuoat(Integer yearQuoat) {
        this.yearQuoat = yearQuoat;
    }

    public Integer getYearUserQuoat() {
        return yearUserQuoat;
    }

    public void setYearUserQuoat(Integer yearUserQuoat) {
        this.yearUserQuoat = yearUserQuoat;
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

    public String getCblxbm() {
        return cblxbm;
    }

    public void setCblxbm(String cblxbm) {
        this.cblxbm = cblxbm;
    }

}
