package com.shuxin.mapper.checkManager;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.shuxin.model.ClinicReviewModel;
import com.shuxin.model.checkManager.ChargeInvoiceDetail;

public interface CheckManagerMapper extends BaseMapper<ClinicReviewModel> {
	public Map<String, Object> selectByLsh(@Param("mzlsh") String mzlsh);
	public List<Map<String, Object>> warningInfoDataGrid(String lsh);
	public String selectZDMCbyZDBM(String zdbm);
	public List<Map<String, Object>> selectBreakingRule(String lsh);
	public void changeCheckStatu(@Param("shzt")Integer shzt,
			@Param("mzlsh")String mzlsh,
			@Param("shyj")String shyj);
	public String selectDoctorByLsh(@Param("lsh")String lsh);
	
	public List<Map<String, Object>> invoiceExport(
			ChargeInvoiceDetail chargeInvoiceDetail);
	public List<Map<String, Object>> selectMonthandYear(@Param("syear")int syear,@Param("smonth")String smonth, @Param("sfzhm")String sfzhm);
	
	public String judgeSuspicious(@Param("mzlsh") String mzlsh);
	
	public String getKlyyBymzlsh(@Param("mzlsh") String malsh,@Param("jyfs") String jyfs);
	
	public String getKsmcByKsdm(@Param("ksdm") String ksdm);
	
	public Map<String, Object> medicalInformation(@Param("zyh") String zyh);
	
	public Map<String, Object> costIndicator(@Param("zyh") String zyh);
	
}
