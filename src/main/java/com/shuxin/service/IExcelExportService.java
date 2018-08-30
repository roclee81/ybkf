package com.shuxin.service;

import java.util.List;
import java.util.Map;

import com.shuxin.model.DepartmentPlan;
import com.shuxin.model.SysUser;

/**
 * excel 表格导出业务层
 * @author admin
 *
 */
public interface IExcelExportService {

	public List<Map<String, Object>> getSysUserInfo(SysUser user);
	
	public List<Map<String, Object>> getDepartPlanInfo(DepartmentPlan departmentPlan);
	
	public List<Map<String, Object>> getWholeHosOfMg(Map<String, Object> condition);

	public List<Map<String, Object>> getWholeHosOfMz(Map<String, Object> condition);

	public List<Map<String, Object>> getInHosPatients(Map<String, Object> condition);

	public List<Map<String, Object>> getDocPerformance(Map<String, Object> condition, String flag);

	public List<Map<String, Object>> getmzPatients(Map<String, Object> condition);

	public List<Map<String, Object>> getHospitents(Map<String, Object> condition);

	public List<Map<String, Object>> getMgbzInfo(Map<String, Object> condition);

	public List<Map<String, Object>> getMghzInfo(Map<String, Object> condition);

	public List<Map<String, Object>> getMzshInfo(Map<String, Object> condition);

	public Map<String, Object> getMzshDetails(String lsh);

	public Map<String, Object> getZyshDetails(String lsh);

	public Map<String, Object> getMgjzDetailsInfos(String lsh);

	public Map<String, Object> getZy_wghz(Map<String, Object> condition,String flag);

	public List<Map<String, Object>> getcypj_wghz(Map<String, Object> condition);

	public List<Map<String, Object>> getcypj_wghzDetails(Map<String, Object> condition);

	public List<Map<String, Object>> getPatINFO(String zyh,String brxz);

	public List<Map<String, Object>> getmgbz_wghz_order(Map<String, Object> condition);

	public List<Map<String, Object>> getmgbz_wghz(Map<String, Object> condition);

	public List<Map<String, Object>> getmgbz_wghzDetails(Map<String, Object> condition);

	public List<Map<String, Object>> getmgbz_wghzDetails_zd(Map<String, Object> condition);

	public List<Map<String, Object>> getptmz_wghz_order(Map<String, Object> condition);

	public List<Map<String, Object>> getptmz_wghzDetails(Map<String, Object> condition);

	public List<Map<String, Object>> getClassBInfo(Map<String, Object> condition);

	public List<Map<String, Object>> getSumViolation(Map<String, Object> condition);
	
	public List<Map<String, Object>> zyzxksxmmxExport(Map<String, Object> condition);
	
	public Integer zyzxksxmmxCount(Map<String, Object> map);
}
