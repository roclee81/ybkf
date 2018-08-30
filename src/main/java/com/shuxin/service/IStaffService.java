package com.shuxin.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.Staff;

public interface IStaffService extends IService<Staff>{
	//查询显示所有工作人员并分页的方法（包含模糊查询）
	public void selectDataGrid(PageInfo pageInfo,Staff staff);
	//联想动态查询效果，方案被否
	//public void selectDataGrid(PageInfo pageInfo,String filterRules);
	public List<Map<String, Object>> selectrylb();
}
