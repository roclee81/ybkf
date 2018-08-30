package com.shuxin.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.model.DepartmentPlan;
import com.shuxin.model.vo.DepartPlanModelVo;
import com.shuxin.model.vo.MgquotaVo;


public interface DepartmentPlanMapper extends BaseMapper<DepartmentPlan> {

	List<Map<String, Object>> selectDepartmentPlanDatagrid(Page<DepartmentPlan> page,
			Map<String, Object> condition);
	
	List<String> selectDepPlanOfMonth(DepartPlanModelVo vo);

	Integer updateDepPlanOfMonth(DepartPlanModelVo vo);

	Integer insertDepPlanOfMonth(DepartPlanModelVo vo);

	Map<String, Object> getDataOfMonth(Map<String, Object> params);

	Map<String, Object> getDataOfSeason(Map<String, Object> params);

	List<String> selectDepPlanOfSeason(DepartPlanModelVo vo);

	int updateDepPlanOfSeason(DepartPlanModelVo vo);

	int insertDepPlanOfSeason(DepartPlanModelVo vo);

	boolean deletePlanOfMonthByids(List<String> idsList);

	boolean deletePlanOfSeasonByids(List<String> idsList);

	void delDepPlanOfMonthByid(String id);

	void delDepPlanOfSeasonByid(String id);

	List<Map<String, Object>> getDepartPlan(MgquotaVo mgquotaVo);

	void insertDPlans(List<DepartmentPlan> dPlans);

}
