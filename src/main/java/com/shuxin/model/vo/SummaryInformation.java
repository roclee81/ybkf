package com.shuxin.model.vo;

/**
 * 描述:   全院概览汇总信息
 * 详细:  
 * 类名:   SummaryInformation
 * 所属包: com.shuxin.model.vo
 * 作者:   ThinkPad
 * 版本:   1.0
 * 日期 :   2017年10月26日 上午9:48:25
 */
public class SummaryInformation {

    /**
     * 总人次(出院人次,就诊人次)
     */
    private String totalPeople;
    /**
     * 医疗总费用
     */
    private String totalMedicalExpenses;
    /**
     * 平均住院日
     */
    private String averageHospitalDay;

    /**
     * 医保统筹支付
     */
    private String totalMedicarePayment;
    /**
     * 医保统筹支付人次
     */
    private String totalMedicarePaymentCounts;

    /**
     * 患者负担比例
     */
    private String burdenRatio;
    /**
     * 违规单据数
     */
    private String totalViolation;
    /**
     * 次均医疗费用
     */
    private String averageMedicalExpenses;
    /**
     * 次均药材费用
     */
    private String averageHerbsExpenses;
    /**
     * 次均检查检验费(耗材)
     */
    private String averageExaminationExpenses;

    /**
     * 乙类自付比
     */
    private String classBPaysRatio;
    /**
     * 自费比
     */
    private String ownExpenseRatio;
    /**
     * 大型检查比
     */
    private String largeInspectionRatio;

    /**
     * 超定额人次
     */
    private String excessiveQuota;
    /**
     * 超定额总费用
     */
    private String totalCostExcess;

    /**
     * 年累计医疗总费用
     */
    private String yearTotalMedicalExpenses;
    /**
     * 年累计统筹支付费用
     */
    private String yearTotalPaymentFees;

    /**
     * 月份
     */
    private String smonth;

    /**
     * 年份
     */
    private String syear;

    public SummaryInformation() {

    }

    public String getTotalPeople() {
        return totalPeople;
    }

    public SummaryInformation(String totalPeople, String totalMedicalExpenses, String averageHospitalDay,
            String totalMedicarePayment, String totalMedicarePaymentCounts, String burdenRatio, String totalViolation,
            String averageMedicalExpenses, String averageHerbsExpenses, String averageExaminationExpenses,
            String classBPaysRatio, String ownExpenseRatio, String largeInspectionRatio, String excessiveQuota,
            String totalCostExcess, String yearTotalMedicalExpenses, String yearTotalPaymentFees, String smonth,
            String syear) {
        super();
        this.totalPeople = totalPeople;
        this.totalMedicalExpenses = totalMedicalExpenses;
        this.averageHospitalDay = averageHospitalDay;
        this.totalMedicarePayment = totalMedicarePayment;
        this.totalMedicarePaymentCounts = totalMedicarePaymentCounts;
        this.burdenRatio = burdenRatio;
        this.totalViolation = totalViolation;
        this.averageMedicalExpenses = averageMedicalExpenses;
        this.averageHerbsExpenses = averageHerbsExpenses;
        this.averageExaminationExpenses = averageExaminationExpenses;
        this.classBPaysRatio = classBPaysRatio;
        this.ownExpenseRatio = ownExpenseRatio;
        this.largeInspectionRatio = largeInspectionRatio;
        this.excessiveQuota = excessiveQuota;
        this.totalCostExcess = totalCostExcess;
        this.yearTotalMedicalExpenses = yearTotalMedicalExpenses;
        this.yearTotalPaymentFees = yearTotalPaymentFees;
        this.smonth = smonth;
        this.syear = syear;
    }

    public void setTotalPeople(String totalPeople) {
        this.totalPeople = totalPeople;
    }

    public String getTotalMedicalExpenses() {
        return totalMedicalExpenses;
    }

    public void setTotalMedicalExpenses(String totalMedicalExpenses) {
        this.totalMedicalExpenses = totalMedicalExpenses;
    }

    public String getAverageHospitalDay() {
        return averageHospitalDay;
    }

    public void setAverageHospitalDay(String averageHospitalDay) {
        this.averageHospitalDay = averageHospitalDay;
    }

    public String getTotalMedicarePayment() {
        return totalMedicarePayment;
    }

    public void setTotalMedicarePayment(String totalMedicarePayment) {
        this.totalMedicarePayment = totalMedicarePayment;
    }

    public String getBurdenRatio() {
        return burdenRatio;
    }

    public void setBurdenRatio(String burdenRatio) {
        this.burdenRatio = burdenRatio;
    }

    public String getTotalViolation() {
        return totalViolation;
    }

    public void setTotalViolation(String totalViolation) {
        this.totalViolation = totalViolation;
    }

    public String getAverageMedicalExpenses() {
        return averageMedicalExpenses;
    }

    public void setAverageMedicalExpenses(String averageMedicalExpenses) {
        this.averageMedicalExpenses = averageMedicalExpenses;
    }

    public String getAverageHerbsExpenses() {
        return averageHerbsExpenses;
    }

    public void setAverageHerbsExpenses(String averageHerbsExpenses) {
        this.averageHerbsExpenses = averageHerbsExpenses;
    }

    public String getAverageExaminationExpenses() {
        return averageExaminationExpenses;
    }

    public void setAverageExaminationExpenses(String averageExaminationExpenses) {
        this.averageExaminationExpenses = averageExaminationExpenses;
    }

    public String getClassBPaysRatio() {
        return classBPaysRatio;
    }

    public void setClassBPaysRatio(String classBPaysRatio) {
        this.classBPaysRatio = classBPaysRatio;
    }

    public String getOwnExpenseRatio() {
        return ownExpenseRatio;
    }

    public void setOwnExpenseRatio(String ownExpenseRatio) {
        this.ownExpenseRatio = ownExpenseRatio;
    }

    public String getLargeInspectionRatio() {
        return largeInspectionRatio;
    }

    public void setLargeInspectionRatio(String largeInspectionRatio) {
        this.largeInspectionRatio = largeInspectionRatio;
    }

    public String getExcessiveQuota() {
        return excessiveQuota;
    }

    public void setExcessiveQuota(String excessiveQuota) {
        this.excessiveQuota = excessiveQuota;
    }

    public String getTotalCostExcess() {
        return totalCostExcess;
    }

    public void setTotalCostExcess(String totalCostExcess) {
        this.totalCostExcess = totalCostExcess;
    }

    public String getYearTotalMedicalExpenses() {
        return yearTotalMedicalExpenses;
    }

    public void setYearTotalMedicalExpenses(String yearTotalMedicalExpenses) {
        this.yearTotalMedicalExpenses = yearTotalMedicalExpenses;
    }

    public String getYearTotalPaymentFees() {
        return yearTotalPaymentFees;
    }

    public void setYearTotalPaymentFees(String yearTotalPaymentFees) {
        this.yearTotalPaymentFees = yearTotalPaymentFees;
    }

    public String getSmonth() {
        return smonth;
    }

    public void setSmonth(String smonth) {
        this.smonth = smonth;
    }

    public String getSyear() {
        return syear;
    }

    public void setSyear(String syear) {
        this.syear = syear;
    }

    public String getTotalMedicarePaymentCounts() {
        return totalMedicarePaymentCounts;
    }

    public void setTotalMedicarePaymentCounts(String totalMedicarePaymentCounts) {
        this.totalMedicarePaymentCounts = totalMedicarePaymentCounts;
    }

}
