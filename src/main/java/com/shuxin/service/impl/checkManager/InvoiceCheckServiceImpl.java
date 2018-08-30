package com.shuxin.service.impl.checkManager;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.mapper.checkManager.CheckManagerMapper;
import com.shuxin.model.ClinicReviewModel;
import com.shuxin.model.checkManager.ChargeInvoiceDetail;
import com.shuxin.service.checkManager.IInvoiceCheckService;



@Service
public class InvoiceCheckServiceImpl extends ServiceImpl<CheckManagerMapper, ClinicReviewModel> implements IInvoiceCheckService{

	@Autowired
	private CheckManagerMapper mapper;
	@Override
	public Map<String, Object> selectByLsh( String mzlsh ) {
		// TODO Auto-generated method stub
		Map<String, Object> map= mapper.selectByLsh(mzlsh);
		return map;
	}
	@Override
	public Object warningInfoDataGrid(String lsh) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list= mapper.warningInfoDataGrid(lsh);
		Map<String, Object> map=list.get(0);
		return map;
	}
	@Override
	public List<Map<String, Object>> selectBreakingRule(String lsh) {
		// TODO Auto-generated method stub
		return mapper.selectBreakingRule(lsh);
	}
	@Override
	public void changeCheckStatu(Integer shzt,String shryhm,String ksdm,
			String mzlsh,String shyj) {
		// TODO Auto-generated method stub
		/*String klyy = mapper.getKlyyBymzlsh(mzlsh,jyfs);
		String ksmc;
		if(ksdm.equals("0000")){
			ksmc = "全院";
		}else{
			ksmc = mapper.getKsmcByKsdm(ksdm);
		}
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(d);
		ClinicReviewModel entity = new ClinicReviewModel(date, ksdm, 
				ksmc, shryhm, mzlsh, jyfs, klyy, shzt, shyj);
		mapper.insert(entity);*/
		mapper.changeCheckStatu(shzt, mzlsh, shyj);
	}
	@Override
	public String selectDoctorByLsh(String lsh) {
		// TODO Auto-generated method stub
		return mapper.selectDoctorByLsh(lsh);
	}
	@Override
	public List<Map<String, Object>> invoiceExport(
			ChargeInvoiceDetail chargeInvoiceDetail) {
		List<Map<String, Object>> list=mapper.invoiceExport(chargeInvoiceDetail);
		return list;
	}
	@Override
	public List<Map<String, Object>> selectMonthandYear(String sfzhm) {
		// TODO Auto-generated method stub
	    Calendar cal = Calendar.getInstance();
			  int month =	cal.get(Calendar.MONTH)+1;
			  int syear =	cal.get(Calendar.YEAR);
			  String smonth =(String) (month<10 ? "0"+month:month); 
		List<Map<String, Object>> list=mapper.selectMonthandYear( syear,smonth,sfzhm);
		return list;
	}
	@Override
	public Boolean judgeSuspicious(String mzlsh) {
		Boolean flag = false;
		String count = mapper.judgeSuspicious(mzlsh);
		if("0".equals(count)){
			flag=true;
		}
		return flag;
	}
	@Override
	public Map<String, Object> medicalInformation(String zyh) {
		Map<String, Object> map = mapper.medicalInformation(zyh);
		return map;
	}
	
	@Override
	public Map<String, Object> costIndicator(String zyh) {
		Map<String, Object> map = mapper.costIndicator(zyh);
		return map;
	}
	
	
	

}
