package com.shuxin.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.shuxin.model.DoorPatientType;

public interface IDoorPatientTypeService extends IService<DoorPatientType> {

	//  新增
	public void insertmgbz(DoorPatientType doorPatientType);
	
	//  修改 
	public void updatemgbz(DoorPatientType doorPatientType);
	
	//  删除
	public void deletemgbz(String bzxh);
	
	//  查询 
	public DoorPatientType selectBybzxh(String bzxh);
	public List<DoorPatientType> selectByVo(DoorPatientType doorPatientType);
	
}
