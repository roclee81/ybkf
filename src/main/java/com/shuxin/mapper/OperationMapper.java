package com.shuxin.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.shuxin.model.Operation;

public interface OperationMapper extends BaseMapper<Operation>{
	public List<Map<String, Object>> selectssjb();
}
