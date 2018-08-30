package com.shuxin.service.decisionAnalysis;

import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.CommonModel;

public interface IPatientCheckservice extends IService<CommonModel>{

	/**
	 * 查询患者检查详情
	 * @param pageInfo
	 */
	public void selectPatientCheckVoPage(PageInfo pageInfo);
}
