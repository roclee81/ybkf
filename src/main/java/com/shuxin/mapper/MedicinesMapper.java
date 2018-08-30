package com.shuxin.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.model.Medicines;


public interface MedicinesMapper extends BaseMapper<Medicines>  {

	List<Medicines> selectMedicineByCondition(Page<Medicines> page,
			Map<String, Object> condition);

}
