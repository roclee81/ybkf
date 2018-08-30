package com.shuxin.mapper.doorManager;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.shuxin.model.DoorpatientDrug;

public interface DoorpatientDrugMapper extends BaseMapper<DoorpatientDrug>{

	String getZdmcByZdbm(@Param("sfzhm")String sfzhm,@Param("zdbm")String zdbm);
	
	List<DoorpatientDrug> getPatientDrugBySFZHM(@Param("sfzhm")String sfzhm);
}
