package com.shuxin.service.decisionAnalysis;

import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.CommonModel;

public interface IPatientDrugservice extends IService<CommonModel>{

	/**
	 * 查询患者用药详情
	 * @param pageInfo
	 */
	public void selectPatientDrugVoPage(PageInfo pageInfo);
}
