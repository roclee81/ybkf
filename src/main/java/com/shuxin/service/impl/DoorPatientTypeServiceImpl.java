package com.shuxin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.mapper.DoctorGroupMapper;
import com.shuxin.mapper.DoorPatientTypeMapper;
import com.shuxin.model.Department;
import com.shuxin.model.DoctorGroup;
import com.shuxin.model.DoorPatientType;
import com.shuxin.service.IDoctorGroupService;
import com.shuxin.service.IDoorPatientTypeService;

@Service
public class DoorPatientTypeServiceImpl  extends ServiceImpl<DoorPatientTypeMapper,DoorPatientType>   implements IDoorPatientTypeService {
	
	@Autowired
	DoorPatientTypeMapper doorPatientTypeMapper;
	
	@Override
	public void insertmgbz(DoorPatientType doorPatientType) {
		List<DoorPatientType> list = doorPatientTypeMapper.selectDoorPatientTypeByDoorPatientType(doorPatientType);
		if(list.isEmpty()){
			doorPatientTypeMapper.insert(doorPatientType);
		}
	}

	@Override
	public void updatemgbz(DoorPatientType doorPatientType) {
		// TODO Auto-generated method stub
		System.out.println(doorPatientType);
			//doorPatientTypeMapper.updateDoorPatientType(doorPatientType);
		doorPatientTypeMapper.updateById(doorPatientType);
	}

	@Override
	public void deletemgbz(String bzxh) {
		// TODO Auto-generated method stub
		doorPatientTypeMapper.deleteDoorPatientType(bzxh);
	}

	@Override
	public DoorPatientType selectBybzxh(String bzxh) {
		// TODO Auto-generated method stub
		DoorPatientType doorPatientType=doorPatientTypeMapper.selectDoorPatientTypeByOrder(bzxh);
		return doorPatientType;
	}

	@Override
	public List<DoorPatientType> selectByVo(DoorPatientType doorPatientType) {
		// TODO Auto-generated method stub
		List<DoorPatientType> list=doorPatientTypeMapper.selectDoorPatientTypeByDoorPatientType(doorPatientType);
		return list;
	}

	
	
	
}
