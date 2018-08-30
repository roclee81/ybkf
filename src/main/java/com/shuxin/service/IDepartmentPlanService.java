package com.shuxin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.DepartmentPlan;
import com.shuxin.model.vo.DepartPlanModelVo;

public interface IDepartmentPlanService extends IService<DepartmentPlan> {

	public void selectDepartmentPlanDatagrid(PageInfo info);
	
	public Object insertDepartmentPlan(DepartmentPlan departmentPlan,List<DepartPlanModelVo> list);
	
	public void getDepartmentDatagrid(PageInfo info);

	public int updateDepPlanOfMonth(DepartPlanModelVo vo);

	public Object getDataOfMonth(Map<String, Object> params);

	public int updateDepPlanOfSeason(DepartPlanModelVo vo);

	public String deleteByids(String ids);

	public void delDepPlanByid(String id);

	public String uploadDePlans(HttpServletRequest request, HttpServletResponse response, String path);

}
