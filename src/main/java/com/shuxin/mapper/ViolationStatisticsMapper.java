package com.shuxin.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.model.DoctorGroup;

public interface ViolationStatisticsMapper  extends BaseMapper<DoctorGroup> {

	public List<Map<String, String>> getRuleOrderingData(Map<String, Object> params);
	
	public List<Map<String, String>> getDepartmentOrderingData(Map<String, Object> params);
	
	public List<Map<String, String>> getDoctorOrderingData(Map<String, Object> params);
	
	public List<Map<String, Object>> getSHViolationSummary(Page<?> page,Map<String, Object> condition);
	
	public List<Map<String, Object>> getSHviolationDetails(Page<?> page,Map<String, Object> condition);
	
	public List<Map<String, Object>> getSHWholeviolationDetails(Page<?> page,Map<String, Object> condition);
	
}
