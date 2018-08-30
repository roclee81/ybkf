package com.shuxin.service.impl.doorManager;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.commons.shiro.ShiroUser;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.mapper.doorManager.MgLimitMapper;
import com.shuxin.model.Department;
import com.shuxin.model.DoctorGroupPlan;
import com.shuxin.model.MgLimit;
import com.shuxin.model.vo.MgDiseasesVo;
import com.shuxin.service.doorManager.IMgLimitService;

@Service
public class MgLimitServiceImpl extends ServiceImpl<MgLimitMapper,MgLimit>   implements IMgLimitService{

	@Autowired
	private MgLimitMapper limitMapper;

	@Override
	public void selectmglistdataGrid(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		 Page<MgLimit> page = new Page<MgLimit>(pageInfo.getNowpage(), pageInfo.getSize());
	        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
	        page.setOrderByField(orderField);
	        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
	        List<MgLimit> list = limitMapper.selectmglistdataGrid(page, pageInfo.getCondition());
	        pageInfo.setRows(list);
	        pageInfo.setTotal(page.getTotal());
	}

	@Override
	public void deleteMg(List<String> ids, ShiroUser user) {
		// TODO Auto-generated method stub
		this.deleteBatchIds(ids);
	}

	@Override
	public List<MgLimit> selectByVo(MgLimit myLimit) {
		// TODO Auto-generated method stub
		MgLimit newmylLimit=new MgLimit();
		newmylLimit.setZdbm(myLimit.getZdbm());
		  EntityWrapper<MgLimit> wrapper = new EntityWrapper<MgLimit>(newmylLimit);
	        if(myLimit.getId()!=null&&StringUtils.isNotBlank(myLimit.getId())){
	       	 wrapper.where("id != {0}", myLimit.getId());
			}
			return limitMapper.selectList(wrapper);
	}

	@Override
	public void updateMg(MgLimit myLimit) {
		// TODO Auto-generated method stub
		if(myLimit.getId()!=null&&StringUtils.isNotBlank(myLimit.getId())){
			this.updateById(myLimit);
		}else{
			this.insert(myLimit);
		}
	}

	@Override
	public List<Map<String, Object>> getbzmcbyfl(String bzfl) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list=new ArrayList<Map<String, Object>>();
		if(StringUtils.isNotBlank(bzfl)&&bzfl!=null){
			 list=limitMapper.getbzmcbyfl(bzfl);

		}else{
			 list=limitMapper.getALLbzmc();
		}
		return list;
	}
	
	@Override
	public List<Map<String, Object>> getmzjbmc() {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list=new ArrayList<Map<String, Object>>();		
			 list=limitMapper.getmzjbmc();
			 return list;
	}

	@Override
	public List<Map<String, Object>> getbybzmc(String bzmc) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list=limitMapper.getbybzmc(bzmc);
		return list;
	}
	@Override
	public List<Map<String, Object>> getbyzdbm(String zdbm) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list=limitMapper.getbyzdbm(zdbm);
		return list;
	}

	@Override
	public void selectmgbzlistdataGrid(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<MgLimit> page = new Page<MgLimit>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<MgLimit> list = limitMapper.selectmgbzlistdataGrid(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}

	@Override
	public List<Map<String, Object>> getAllbz() {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list=limitMapper.getALLbzmc();
		return list;
	}

	@Override
	public List<Map<String, Object>> getJbmcByfl(String fl) {
		List<Map<String, Object>> list=limitMapper.getJbmcByfl(fl);
		return list;
	}

	@Override
	public List<Map<String, Object>> getZdbmByJbmc(String jbmc) {
		List<Map<String, Object>> list=limitMapper.getZdbmByJbmc(jbmc);
		return list;
	}
	
	
}
