package com.shuxin.mapper.decisionAnalysis;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.model.CommonModel;
import com.shuxin.model.vo.CostStructVo;
import com.shuxin.model.vo.InsuranceViolationVo;

public interface InsuranceViolationMappe extends BaseMapper<CommonModel>{

	public List<Map<String, String>> violationDepartmentSort(InsuranceViolationVo insuranceViolationVo);
	
	public List<Map<String, String>> violationDoctorSort(InsuranceViolationVo insuranceViolationVo);
	
	public List<Map<String, String>> violationRuleSort(InsuranceViolationVo insuranceViolationVo);
	
	public List<Map<String, Object>> selectViolationDetail(Page<InsuranceViolationVo> page,
			Map<String, Object> condition);
	
	public List<Map<String, Object>> selectPatientBillDetail(Page<InsuranceViolationVo> page,
			Map<String, Object> condition);
}
