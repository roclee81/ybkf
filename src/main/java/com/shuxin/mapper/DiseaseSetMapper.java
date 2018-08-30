package com.shuxin.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.model.DiseaseSetModel;
import com.shuxin.model.vo.DoorPatientVo;


public interface DiseaseSetMapper extends BaseMapper<DiseaseSetModel> {

	public List<Map<String, Object>> getDiseaseSetDatarid(Page<DiseaseSetModel> page,
			Map<String, Object> condition);
}
