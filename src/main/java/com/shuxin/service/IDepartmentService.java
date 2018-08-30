package com.shuxin.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.Department;

public interface IDepartmentService extends IService<Department> {

	List<Department> selectAll(PageInfo pageInfo);

	List<Department> findDepartType(String  clum,String ksbm,String kslx);

	void selectDepartByCondition(PageInfo pageInfo);

	List<Department> selectByLoginName(Department depart);

	void insertDepart(Department depart);

	Department selectdepartById(String id);

	void updateDepart(Department depart);

	void deleteDepartById(List<String> departIds);

	List<Department> selectByksbm(String ksbm);

	List<Department> findDepartType2(String  clum,String ksbm);

	List<Map<String, Object>> getdoctorByksbm(String ksbm);

	Map<String, String> getDoctorByysgh(String ysgh);

	List<Map<String, Object>> getSbInfo();
	

//	List<Department> findDepartType(String clum, String ksbm);

}
