package com.shuxin.mapper.doorManager;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.model.DoorPatient;
import com.shuxin.model.vo.DoorPatientVo;

public interface DoorPatientMapper extends BaseMapper<DoorPatient>{

	List<Map<String, Object>> selectpatientregislistdataGrid(Page<DoorPatientVo> page,
			Map<String, Object> condition);

}
