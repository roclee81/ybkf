package com.shuxin.service.checkManager;

import java.util.List;
import java.util.Map;


import com.baomidou.mybatisplus.service.IService;
import com.shuxin.model.ClinicReviewModel;
import com.shuxin.model.checkManager.ChargeInvoiceDetail;

public interface IInvoiceCheckService extends IService<ClinicReviewModel>{
	public Map<String, Object> selectByLsh(String mzlsh);
	public Object warningInfoDataGrid(String lsh);
	public List<Map<String, Object>> selectBreakingRule(String lsh);
	public void changeCheckStatu(Integer shzt,String shryhm,String ksdm,String mzlsh,String shyj);
	public String selectDoctorByLsh(String lsh);
	public List<Map<String, Object>> invoiceExport(
			ChargeInvoiceDetail chargeInvoiceDetail);
	public List<Map<String, Object>> selectMonthandYear(  String sfzhm);
	
	public Boolean judgeSuspicious(String mzlsh);
	
	public Map<String, Object> medicalInformation(String zyh);
	
	public Map<String, Object> costIndicator(String zyh);
	
}
