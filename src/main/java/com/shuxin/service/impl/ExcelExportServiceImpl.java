package com.shuxin.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.commons.enums.WholeDocument;
import com.shuxin.mapper.ExcelExportMapper;
import com.shuxin.mapper.checkManager.CheckManagerMapper;
import com.shuxin.mapper.decisionAnalysis.CostStructMapper;
import com.shuxin.mapper.doorManager.GeneralClinicMapper;
import com.shuxin.mapper.doorManager.MgquotaMapper;
import com.shuxin.mapper.inHospitalMonitoring.InHospitalMonitoringMapper;
import com.shuxin.mapper.stagereport.FixedReportMapper;
import com.shuxin.model.DepartmentPlan;
import com.shuxin.model.Mgquota;
import com.shuxin.model.SysUser;
import com.shuxin.model.vo.CostStructVo;
import com.shuxin.service.IExcelExportService;

@Service
public class ExcelExportServiceImpl  implements IExcelExportService {

	@Autowired
	private ExcelExportMapper excelExportMapper;
	
	@Autowired
	public MgquotaMapper mgquotaMapper;
	
	@Autowired
	private CheckManagerMapper checkManagerMapper; 
	
	@Autowired
	private CostStructMapper costStructMapper;
	
	@Autowired
	InHospitalMonitoringMapper inHospitalMonitoringMapper;
	
	@Autowired
    private GeneralClinicMapper generalClinicMappermapper;
	
	@Autowired
    private FixedReportMapper fixedReportMapper;
	
	@Override
	public List<Map<String, Object>> getSysUserInfo(SysUser user) {
		List<Map<String, Object>> list = excelExportMapper.getSysUserExport(user);
		return list;
	}

	@Override
	public List<Map<String, Object>> getDepartPlanInfo(DepartmentPlan departmentPlan) {
		List<Map<String, Object>> list = excelExportMapper.getDepartPlanExport(departmentPlan);
		return list;
	}

	@Override
	public List<Map<String, Object>> getWholeHosOfMg(Map<String, Object> condition) {
		List<Map<String, Object>> list = excelExportMapper.getWholeHosOfMg(condition);
		return list;
	}

	@Override
	public List<Map<String, Object>> getWholeHosOfMz(Map<String, Object> condition) {
		List<Map<String, Object>> list = excelExportMapper.getWholeHosOfMz(condition);
		return list;
	}

	@Override
	public List<Map<String, Object>> getInHosPatients(Map<String, Object> condition) {
		List<Map<String, Object>> list = excelExportMapper.getInHosPatients(condition);
		return list;
	}

	@Override
	public List<Map<String, Object>> getDocPerformance(Map<String, Object> condition, String flag) {
		List<Map<String, Object>> list = null;
		switch (flag) {
		case "lj":
			return list = excelExportMapper.getDocPerformanceOfLj(condition);
		case "rj":
			return list = excelExportMapper.getDocPerformanceOfRj(condition);
		case "zb":
			return list = excelExportMapper.getDocPerformanceOfZb(condition);
		default:
			return list;
		}
	}

	@Override
	public List<Map<String, Object>> getmzPatients(Map<String, Object> condition) {
		List<Map<String, Object>> list = excelExportMapper.getmzPatients(condition);
		return list;
	}

	@Override
	public List<Map<String, Object>> getHospitents(Map<String, Object> condition) {
		Page<Mgquota> page = new Page<>();
		List<Map<String, Object>> list = inHospitalMonitoringMapper.getHospitalizedDataGrid(page, condition);
		return list;
	}

	@Override
	public List<Map<String, Object>> getMgbzInfo(Map<String, Object> condition) {
		List<Map<String, Object>> list = excelExportMapper.getMgbzInfo(condition);
		return list;
	}

	@Override
	public List<Map<String, Object>> getMghzInfo(Map<String, Object> condition) {
		List<Map<String, Object>> list = excelExportMapper.getMghzInfo(condition);
		return list;
	}

	@Override
	public List<Map<String, Object>> getMzshInfo(Map<String, Object> condition) {
		List<Map<String, Object>> list = null;
		if(condition.get("shzt").equals("3")){
			// 可疑单据
			list = excelExportMapper.getMzshKyInfo(condition);
		}else{
			list = excelExportMapper.getMzshInfo(condition);
		}
		return list;
	}

	@Override
	public Map<String, Object> getMzshDetails(String lsh) {
		Map<String, Object> info = new HashMap<>();
		
		Map<String, Object> condition = new HashMap<>();
		condition.put("lsh", lsh);
		// 患者 相关信息
		List<Map<String, Object>> patient = new ArrayList<>();
		patient.add(checkManagerMapper.selectByLsh(lsh));
		// 处方明细
		List<Map<String, String>>  cfmx = costStructMapper.getCFMXByLSH(new Page<CostStructVo>(),condition);
		// 收费明细
		List<Map<String, String>>  sfmx = costStructMapper.getSFMXByLSH(new Page<CostStructVo>(), condition);
		
		info.put("patient", patient);
		info.put("cfmx", cfmx);
		info.put("sfmx", sfmx);
		return info;
	}

	@Override
	public Map<String, Object> getZyshDetails(String lsh) {
		Map<String, Object> info = new HashMap<>();
		
		Map<String, Object> condition = new HashMap<>();
		condition.put("lsh", lsh);
		condition.put("zyh", lsh);
		// 患者 相关信息
		List<Map<String, Object>> patient = new ArrayList<>();
		patient.add(checkManagerMapper.medicalInformation(lsh));
		// 处方明细
		List<Map<String, String>>  cfmx = costStructMapper.docDetail(new Page<CostStructVo>(),condition);
		// 收费明细
		List<Map<String, String>>  sfmx = costStructMapper.costDetail(new Page<CostStructVo>(), condition);
		
		info.put("patient", patient);
		info.put("cfmx", cfmx);
		info.put("sfmx", sfmx);
		return info;
	}

	@Override
	public Map<String, Object> getMgjzDetailsInfos(String lsh) {
		// 获取就诊记录
		List<Map<String, Object>> jzInfo = excelExportMapper.getMgJzInfo(lsh);
		// 获取处方明细
		Map<String, Object> condition = new HashMap<>();
		condition.put("lsh", lsh);
		List<Map<String, Object>> cfmx = costStructMapper.getYZMXByLSH(new Page<CostStructVo>(), condition);
		// 获取费用明细
		List<Map<String, Object>> sfmx = costStructMapper.getFYMXByLSH(new Page<CostStructVo>(), condition);
		
		Map<String, Object> map = new HashMap<>();
		map.put("jzInfo", jzInfo);
		map.put("cfmx", cfmx);
		map.put("sfmx", sfmx);
		return map;
	}

	@Override
	public Map<String, Object> getZy_wghz(Map<String, Object> condition,String flag) {
		
		// 获取违规记录
		List<Map<String, Object>> wgInfo = null;
		// 获取科室对应的违规项数目
		List<Map<String, Integer>> wgxmNum = null;
		
		if(flag.equals("ptzy")){
			wgInfo = excelExportMapper.getWgInfo_zy(condition);
			wgxmNum = excelExportMapper.getWgxmNum_zy(condition);
		}else if(flag.equals("mgbz")){
			wgInfo = excelExportMapper.getWgInfo_mg(condition);
			wgxmNum = excelExportMapper.getWgxmNum_mg(condition);
		}else if(flag.equals("ptmz")){
			wgInfo = excelExportMapper.getWgInfo_mz(condition);
			wgxmNum = excelExportMapper.getWgxmNum_mz(condition);
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("wgInfo", wgInfo);
		map.put("wgxmNum", wgxmNum);
		return map;
	}

	@Override
	public List<Map<String, Object>> getcypj_wghz(Map<String, Object> condition) {
		Page<Mgquota> page = new Page<>();
		List<Map<String, Object>> list = inHospitalMonitoringMapper.illegalDocuments(page, condition);
		return list;
	}

	@Override
	public List<Map<String, Object>> getcypj_wghzDetails(Map<String, Object> condition) {
		Page<Mgquota> page = new Page<>();
        List<Map<String, Object>> list = null;
        if(condition.get("lx").equals("order")){
        	String gzbm = (String) condition.get("gzbm");
        	if(WholeDocument.getEnumValue(gzbm)!=null){
        		//  整单
        		list = inHospitalMonitoringMapper.getzyWholeViolationDetails(page, condition);
        	}else{
        		//  非整单
        		list = inHospitalMonitoringMapper.getzyViolationDetails(page, condition);
        	}
        }else{
        	list = inHospitalMonitoringMapper.getzyViolationDetails(page, condition);
        }
		return list;
	}

	@Override
	public List<Map<String, Object>> getPatINFO(String zyh,String brxz) {
		List<Map<String, Object>> list = null;
		if(brxz.equals("ptzy")){
			list = excelExportMapper.getcyPatINFO(zyh);
		}else if(brxz.equals("mgbz")){
			list = excelExportMapper.getmgPatINFO(zyh);
		}else if(brxz.equals("ptmz")){
			list = excelExportMapper.getmzPatINFO(zyh);
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> getmgbz_wghz_order(Map<String, Object> condition) {
		Page<Mgquota> page = new Page<>();
		List<Map<String, Object>> list = mgquotaMapper.mgViolationsDocuments(page, condition);
		return list;
	}

	@Override
	public List<Map<String, Object>> getmgbz_wghz(Map<String, Object> condition) {
		Page<Mgquota> page = new Page<>();
		List<Map<String, Object>> list = mgquotaMapper.mgViolationsDocumentsDepart(page, condition);
		return list;
	}

	@Override
	public List<Map<String, Object>> getmgbz_wghzDetails(Map<String, Object> condition) {
		Page<Mgquota> page = new Page<>();
		List<Map<String, Object>> list = mgquotaMapper.mzmgdetails(page, condition);
		return list;
	}

	@Override
	public List<Map<String, Object>> getmgbz_wghzDetails_zd(Map<String, Object> condition) {
		Page<Mgquota> page = new Page<>();
		List<Map<String, Object>> list = mgquotaMapper.wholemgdetails(page, condition);
		return list;
	}

	@Override
	public List<Map<String, Object>> getptmz_wghz_order(Map<String, Object> condition) {
		Page<Mgquota> page = new Page<>();
		List<Map<String, Object>> list = generalClinicMappermapper.mzViolationsDocuments(page, condition);
		return list;
	}

	@Override
	public List<Map<String, Object>> getptmz_wghzDetails(Map<String, Object> condition) {
		Page<Mgquota> page = new Page<>();
		List<Map<String, Object>> list = null;
		
		if(condition.containsKey("gzbm")){
			list = generalClinicMappermapper.mzViolationdetails(page, condition);
		}else{
			list = generalClinicMappermapper.getwholedocumentdetails(page, condition);
			if(list.size()==0){
				list = generalClinicMappermapper.mzViolationdetails(page, condition);
			}
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> getClassBInfo(Map<String, Object> condition) {
		Page<?> page = new Page<>();
		List<Map<String, Object>> list = fixedReportMapper.getHosPatInfoGrid(page, condition);
		return list;
	}

	@Override
	public List<Map<String, Object>> getSumViolation(Map<String, Object> condition) {
		Page<?> page = new Page<>();
		List<Map<String, Object>> list = fixedReportMapper.getSummaryVioDetailsGrid(page, condition);
		return list;
	}
	
	@Override
	public List<Map<String, Object>> zyzxksxmmxExport(Map<String, Object> condition) {
		Page<Mgquota> page = new Page<>();
		List<Map<String, Object>> list = inHospitalMonitoringMapper.zyzxksxmmxGrid(page, condition);
		return list;
	}
	
	@Override
	public Integer zyzxksxmmxCount(Map<String, Object> map) {
		return inHospitalMonitoringMapper.zyzxksxmmxCount(map);
	}

}
