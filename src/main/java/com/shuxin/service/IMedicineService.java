package com.shuxin.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.Department;
import com.shuxin.model.Medicines;

public interface IMedicineService  extends IService<Medicines> {

	void selectMedicineByCondition(PageInfo pageInfo);

	List<Medicines> findMedicineType(String clum);

	List<Medicines> selectByLoginName(Medicines medicine);
	List<Medicines> selectBydm(Medicines medicine);

	void insertMedicine(Medicines medicine);

	Medicines selectMedicineById(String id);

	void updateMedicine(Medicines medicine);

	void deleteMedicineById(List<String> medicineIds);

	List<Medicines> selectByYpdm(String ypdm);

	
	
	
}
