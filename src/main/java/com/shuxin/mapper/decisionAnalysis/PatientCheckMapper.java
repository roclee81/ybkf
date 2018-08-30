package com.shuxin.mapper.decisionAnalysis;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.shuxin.model.CommonModel;

public interface PatientCheckMapper extends BaseMapper<CommonModel>{

	/**
	 * 查询患者检查详情
	 * @param page
	 * @param params
	 * @return
	 */
	public List<Map<String, Object>> selectPatientCheckVoPage(Pagination page, Map<String, Object> params);
}
