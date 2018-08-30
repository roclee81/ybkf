package com.shuxin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.model.DoorPatientType;
import com.shuxin.model.MgLimit;
/**
 * 实现门规病种的设定
 * 增、删、改、查
 */
public interface DoorPatientTypeMapper extends BaseMapper<DoorPatientType> {

	/*List<MgLimit> selectmgbzlistdataGrid(Page<MgLimit> page,
			Map<String, Object> condition);
	
	List<Map<String, Object>> getbyzdbm(@Param("zdbm")String zdbm);*/
	
	// 增
	public void insertDoorPatientType(DoorPatientType doorPatientType);
	// 删 
	public void deleteDoorPatientType(String bzxh);
	// 改 
	public void updateDoorPatientType(DoorPatientType doorPatientType);
	// 查  病种序号
	public DoorPatientType selectDoorPatientTypeByOrder(String bzxh);
	
	// 查  实体类
	public List<DoorPatientType> selectDoorPatientTypeByDoorPatientType(DoorPatientType doorPatientType);
	
}
