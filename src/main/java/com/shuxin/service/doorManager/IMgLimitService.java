package com.shuxin.service.doorManager;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.shiro.ShiroUser;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.MgLimit;

public interface IMgLimitService extends IService<MgLimit>{

public	void selectmglistdataGrid(PageInfo pageInfo);

public	void selectmgbzlistdataGrid(PageInfo pageInfo);

public void deleteMg(List<String> ids, ShiroUser user);

public List<MgLimit> selectByVo(MgLimit myLimit);

public void updateMg(MgLimit myLimit);

public List<Map<String, Object>> getbzmcbyfl(String bzfl);

public List<Map<String, Object>> getmzjbmc();

public List<Map<String, Object>> getbybzmc(String bzmc);

public List<Map<String, Object>> getbyzdbm(String zdbm);

public List<Map<String, Object>> getAllbz();

public List<Map<String, Object>> getJbmcByfl(String fl);

public List<Map<String, Object>> getZdbmByJbmc(String jbmc);



	
	
}
