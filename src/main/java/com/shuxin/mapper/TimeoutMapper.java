package com.shuxin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.model.HospitalClaim;

public interface TimeoutMapper {

	List<Map<String, Object>> getTimeoutCheck(List<String> list);
	
	List<Map<String, Object>> getString();
	
	List<Map<String, Object>> getTimeoutHasCheckedDataGrid(Page<?> page,Map<String, Object> condition);
	
	List<String> getTimeoutJzxh(Map<String, Object> condition);

}
