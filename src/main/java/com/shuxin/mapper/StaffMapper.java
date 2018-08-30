package com.shuxin.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.shuxin.model.Staff;

public interface StaffMapper extends BaseMapper<Staff>{
	public List<Map<String, Object>> selectrylb();
}
