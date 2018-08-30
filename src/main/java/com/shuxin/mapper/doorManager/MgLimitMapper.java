package com.shuxin.mapper.doorManager;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.model.MgLimit;

public interface MgLimitMapper extends BaseMapper<MgLimit>{

	List<MgLimit> selectmglistdataGrid(Page<MgLimit> page,
			Map<String, Object> condition);
	
	List<MgLimit> selectmgbzlistdataGrid(Page<MgLimit> page,
			Map<String, Object> condition);

	List<Map<String, Object>> getbzmcbyfl(@Param("bzfl")String bzfl);

	List<Map<String, Object>> getbybzmc( @Param("bzmc")String bzmc);

	List<Map<String, Object>> getbyzdbm(@Param("zdbm")String zdbm);

	List<Map<String, Object>> getALLbzmc();
	
	List<Map<String, Object>> getmzjbmc();
	
	List<Map<String, Object>> selectByMgDiseasesVo();
	
	List<Map<String, Object>> getJbmcByfl(String fl);  
	
	List<Map<String, Object>> getZdbmByJbmc(String jbmc);
	
}
