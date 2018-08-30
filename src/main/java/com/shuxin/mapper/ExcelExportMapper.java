package com.shuxin.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.shuxin.model.DepartmentPlan;
import com.shuxin.model.SysUser;
import com.shuxin.model.vo.MgquotaVo;

public interface ExcelExportMapper extends BaseMapper<SysUser>{

	public List<Map<String, Object>> getSysUserExport(SysUser sysUser);
	
	public List<Map<String, Object>> getDepartPlanExport(DepartmentPlan departmentPlan);

	public List<Map<String, Object>> getWholeHosOfMg(Map<String, Object> condition);

	public List<Map<String, Object>> getWholeHosOfMz(Map<String, Object> condition);

	public List<Map<String, Object>> getInHosPatients(Map<String, Object> condition);

	public List<Map<String, Object>> getDocPerformanceOfLj(Map<String, Object> condition);

	public List<Map<String, Object>> getDocPerformanceOfRj(Map<String, Object> condition);

	public List<Map<String, Object>> getDocPerformanceOfZb(Map<String, Object> condition);

	public List<Map<String, Object>> getmzPatients(Map<String, Object> condition);

	public List<Map<String, Object>> getHospitents(Map<String, Object> condition);

	public List<Map<String, Object>> getMgbzInfo(Map<String, Object> condition);

	public List<Map<String, Object>> getMghzInfo(Map<String, Object> condition);

	public List<Map<String, Object>> getMzshKyInfo(Map<String, Object> condition);

	public List<Map<String, Object>> getMzshInfo(Map<String, Object> condition);

	public List<Map<String, Object>> getMgJzInfo(String lsh);

	public List<Map<String, Object>> getWgInfo_zy(Map<String, Object> condition);

	public List<Map<String, Integer>> getWgxmNum_zy(Map<String, Object> condition);
	
	public List<Map<String, Object>> getWgInfo_mg(Map<String, Object> condition);
	
	public List<Map<String, Integer>> getWgxmNum_mg(Map<String, Object> condition);
	
	public List<Map<String, Object>> getWgInfo_mz(Map<String, Object> condition);
	
	public List<Map<String, Integer>> getWgxmNum_mz(Map<String, Object> condition);

	public List<Map<String, Object>> getcyPatINFO(String zyh);

	public List<Map<String, Object>> getmgPatINFO(String mzlsh);

	public List<Map<String, Object>> getmzPatINFO(String mzlsh);
}