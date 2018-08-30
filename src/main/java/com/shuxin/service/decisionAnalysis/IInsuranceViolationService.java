package com.shuxin.service.decisionAnalysis;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.CommonModel;
import com.shuxin.model.vo.InsuranceViolationVo;

public interface IInsuranceViolationService extends IService<CommonModel>{

	/**
	 * 为echars图表查询数据
	 * @param insuranceViolationVo
	 * @return
	 */
	public Map<String, List<String>> selectEcharsData(InsuranceViolationVo insuranceViolationVo) throws Exception;
	
	public void SelectInsuranceViolationVoPage(PageInfo pageInfo,String tableFlag)throws Exception;
	
}
