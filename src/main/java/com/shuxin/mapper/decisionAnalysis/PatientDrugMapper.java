package com.shuxin.mapper.decisionAnalysis;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.shuxin.model.CommonModel;

public interface PatientDrugMapper extends BaseMapper<CommonModel>{

	/**
	 * 查询患者用药详情
	 * @param page
	 * @param params
	 * @return
	 */
	public List<Map<String, Object>> selectPatientDrugVoPage(Pagination page, Map<String, Object> params);
}
