package com.shuxin.service.impl.wholehospitaloverview;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.commons.utils.DataEncapsulationUtils;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.mapper.QuoatMapper;
import com.shuxin.mapper.wholeHospitaloverview.QuotaMapper;
import com.shuxin.model.vo.QuotaVo;
import com.shuxin.service.QuotaService;

@Service
public class QuotaServiceImpl extends ServiceImpl<QuoatMapper, QuotaVo> implements QuotaService {

    @Autowired
    private QuotaMapper quotaMapper;

    /** 
     * 描述: 预算监控分页操作
     * 重写: selectPageInfo
     * 作者: ThinkPad
     * 时间: 2017年10月24日 上午9:27:41
     * @param quotaVo 
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @Override
    public PageInfo selectPageInfo(QuotaVo quotaVo, Integer pageNum, Integer rows, String sort, String order) {

        // 定义分页类和查询条件map
        PageInfo pageInfo = new PageInfo(pageNum, rows, "", "");
        Map<String, Object> condition = new HashMap<String, Object>();

        // 验证组装数据
        if (quotaVo.getSyear() != null && StringUtils.isNotBlank(quotaVo.getSyear())) {
            condition.put("syear", quotaVo.getSyear());
        }
        if (quotaVo.getSmonth() != null && StringUtils.isNotBlank(quotaVo.getSmonth())) {
            condition.put("smonth", quotaVo.getSmonth());
        }
        if (quotaVo.getCblxbm() != null && StringUtils.isNotBlank(quotaVo.getCblxbm())) {
            condition.put("cblxbm", quotaVo.getCblxbm());
        }

        /**分页操作*/
        Page<QuotaVo> page = new Page<QuotaVo>(pageInfo.getNowpage(), pageInfo.getSize());

        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        
        //查询list 
        List<Map<String, Object>> list = quotaMapper.getQuotaGrid(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());

        return pageInfo;
    }

	@Override
	public List<Map<String, Object>> getKeyIndexZY(QuotaVo quotaVo) {
		Map<String, Object>  map1 = quotaMapper.getKeyIndexZY(quotaVo);
		Map<String, Object>  map2 = null;
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		//查询上一个月的数据
		if(quotaVo.getSmonth().equals("01"))
		{
			int syear = Integer.parseInt(quotaVo.getSyear());
			quotaVo.setSyear(Integer.toString(syear-1));
			quotaVo.setSmonth("12");
			map2 = quotaMapper.getKeyIndexZY(quotaVo);
		}
		else
		{
			int month = Integer.parseInt(quotaVo.getSmonth());
			String smonth = (month-1)<10?"0"+(month-1):Integer.toString(month-1);
			quotaVo.setSmonth(smonth);
			map2 = quotaMapper.getKeyIndexZY(quotaVo);
		}
		if(map1!=null){
			list = DataEncapsulationUtils.comparecurrentMonth(map1, map2, null);
		}
		return list;
	}
	
	@Override
	public List<Map<String, Object>> getKeyIndexBZ(QuotaVo quotaVo) {
		Map<String, Object>  map1 = quotaMapper.getKeyIndexBZ(quotaVo);
		Map<String, Object>  map2 = null;
		int month = Integer.parseInt(quotaVo.getSmonth());
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		//查询上一个月的数据
		if(month!=1){
			String smonth = (month-1)<10?"0"+(month-1):Integer.toString(month-1);
			quotaVo.setSmonth(smonth);
			map2 = quotaMapper.getKeyIndexBZ(quotaVo);
		}
		if(map1!=null){
			for (String in : map1.keySet()) {
				Map<String, Object>  map3 = new HashMap<String,Object>();
				//  当前月的数据
	            Object obj =  map1.get(in);
	            float valueCurrent = Integer.parseInt(obj.toString());
	            if(map2 != null && Integer.parseInt(map2.get(in).toString())>0){
	            	Object obj1 = map2.get(in);
	            	float valueLast = Integer.parseInt(obj1.toString());
	            	int flag = (valueCurrent-valueLast)>0?1:-1;
	            	String gain = String.format("%.2f", (Math.abs((valueCurrent-valueLast)*100))/valueLast)+"%";
	            	map3.put("key", in);
	            	map3.put("value", map1.get(in));
	            	map3.put("flag", flag);
	            	map3.put("gain", gain);
	            }else {
	            	map3.put("key", in);
	            	map3.put("value", map1.get(in));
	            	map3.put("flag", 0);
	            	map3.put("gain", 0);
	            }
	            list.add(map3);
	        }
		}
		return list;
	}
	
	@Override
	public List<Map<String, Object>> getKeyIndexZL(QuotaVo quotaVo) {
		Map<String, Object>  map1 = quotaMapper.getKeyIndexZL(quotaVo);
		Map<String, Object>  map2 = null;
		int month = Integer.parseInt(quotaVo.getSmonth());
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		//查询上一个月的数据
		if(month!=1){
			String smonth = (month-1)<10?"0"+(month-1):Integer.toString(month-1);
			quotaVo.setSmonth(smonth);
			map2 = quotaMapper.getKeyIndexZL(quotaVo);
		}
		if(map1!=null){
			for (String in : map1.keySet()) {
				Map<String, Object>  map3 = new HashMap<String,Object>();
				//  当前月的数据
	            Object obj =  map1.get(in);
	            float valueCurrent = Integer.parseInt(obj.toString());
	            if(map2 != null && Integer.parseInt(map2.get(in).toString())>0){
	            	Object obj1 = map2.get(in);
	            	float valueLast = Integer.parseInt(obj1.toString());
	            	int flag = (valueCurrent-valueLast)>0?1:-1;
	            	String gain = String.format("%.2f", (Math.abs((valueCurrent-valueLast)*100))/valueLast)+"%";
	            	map3.put("key", in);
	            	map3.put("value", map1.get(in));
	            	map3.put("flag", flag);
	            	map3.put("gain", gain);
	            }else {
	            	map3.put("key", in);
	            	map3.put("value", map1.get(in));
	            	map3.put("flag", 0);
	            	map3.put("gain", 0);
	            }
	            list.add(map3);
	        }
		}
		return list;
	}

}
