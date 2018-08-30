package com.shuxin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.model.Department;


public interface DepartmentMapper extends BaseMapper<Department> {

	List<String> selectAllType();

	List<Department> selectDepartByCondition(Page<Department> page,Map<String, Object> condition);

	Department selectdepartByID(String id);

	List<Map<String, Object>> getdoctorByksbm( String ksbm);

	Map<String, String> getDoctorByysgh(String ysgh);

	List<Map<String, Object>> getSbInfo();

}
