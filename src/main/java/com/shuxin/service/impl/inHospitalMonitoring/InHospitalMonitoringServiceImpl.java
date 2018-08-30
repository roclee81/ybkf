package com.shuxin.service.impl.inHospitalMonitoring;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.commons.enums.WholeDocument;
import com.shuxin.commons.utils.DataEncapsulationUtils;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.mapper.DepartmentPlanMapper;
import com.shuxin.mapper.inHospitalMonitoring.InHospitalMonitoringMapper;
import com.shuxin.model.Mgquota;
import com.shuxin.model.vo.MgquotaVo;
import com.shuxin.service.IInHospitalMonitoringService;

/**
 * 描述:   数据监控--出院评价、数据监控--住院患者查询
 * 类名:   InHospitalMonitoringServiceImpl
 * 
 */
@Service
public class InHospitalMonitoringServiceImpl extends ServiceImpl<InHospitalMonitoringMapper, MgquotaVo>
        implements IInHospitalMonitoringService {

	@Autowired
	InHospitalMonitoringMapper inHospitalMonitoringMapper;
	
	@Autowired
	private DepartmentPlanMapper planMapper;
	
	@Override
	public List<Map<String, Object>> monitorBudget(MgquotaVo mgquotaVo) {
		Map<String, Object>  mapM = inHospitalMonitoringMapper.monitorBudget(mgquotaVo);
		//mgquotaVo.setSmonth(null);
		Map<String, Object>  mapY = inHospitalMonitoringMapper.monitorBudget(mgquotaVo);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list.add(mapM);
		list.add(mapY);
		return list;
	}
	
	/*
	 * map1: 当前月的数据
	 * map2： 上个月的数据
	 * map3： 当前月指标数据
	 * map4： 指标预算
	 */
	@Override
	public Object evaluationIndex(MgquotaVo mgquotaVo) {
		Map<String, Object>  map1 = inHospitalMonitoringMapper.evaluationIndex(mgquotaVo);
		Map<String, Object>  map2 = null;
		Map<String, Object>  map3 = inHospitalMonitoringMapper.sharecost(mgquotaVo);
		
		List<Map<String, Object>>  listPlan = planMapper.getDepartPlan(mgquotaVo);
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> dataMap = new HashMap<>();
		
		// map4 包含数据：医疗费  和 各种占比   其中医疗费用需要判断是否有月度详细情况
		if(listPlan!=null&&map1!=null&&listPlan.size()==1){
			String YLF = "";
			Map<String, Object> map4 = listPlan.get(0);
			// 处理医疗费用
			Map<String, Object> params = new HashMap<>();
			params.put("id", map4.get("ID"));
			params.put("ksfptype", "ylf");
			
			if(planMapper.getDataOfMonth(params) != null){
				YLF = planMapper.getDataOfMonth(params).get("MONTH"+mgquotaVo.getSmonth())+"";
			}else{
				YLF= String.format("%.2f", Float.parseFloat(map4.get("YLF").toString())/12);
			}
			
			if(YLF.equals("null")){
				map4.put("YLF", "0");
			}else{
				map4.put("YLF", YLF);
			}
			
			list = DataEncapsulationUtils.compareDepartmentPlan(map1,map4);
			dataMap.put("planData", list);
		}
		
		//查询上一个月的数据
		if(mgquotaVo.getSmonth().equals("01"))
		{
			int syear = Integer.parseInt(mgquotaVo.getSyear());
			mgquotaVo.setSyear(Integer.toString(syear-1));
			mgquotaVo.setSmonth("12");
			map2 = inHospitalMonitoringMapper.evaluationIndex(mgquotaVo);
		}
		else
		{
			int month = Integer.parseInt(mgquotaVo.getSmonth());
			String smonth = (month-1)<10?"0"+(month-1):Integer.toString(month-1);
			mgquotaVo.setSmonth(smonth);
			map2 = inHospitalMonitoringMapper.evaluationIndex(mgquotaVo);
		}
		
		if(map1!=null)
		{
			list = DataEncapsulationUtils.comparecurrentMonth(map1, map2,map3);
			dataMap.put("trueData", list);
		}
		
		return dataMap;
	}

	@Override
	public List<Map<String, Object>> costtSatistics(MgquotaVo mgquotaVo) {
		Map<String, Object>  map1 = inHospitalMonitoringMapper.costtSatistics(mgquotaVo);
		Map<String, Object>  map2 = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		//查询上一个月的数据
		if(mgquotaVo.getSmonth().equals("01")){
			int year = Integer.parseInt(mgquotaVo.getSyear());
			mgquotaVo.setSyear(Integer.toString(year-1));
			mgquotaVo.setSmonth("12");
			map2 = inHospitalMonitoringMapper.costtSatistics(mgquotaVo);
		}else{
			int month = Integer.parseInt(mgquotaVo.getSmonth());
			String smonth = (month-1)<10?"0"+(month-1):Integer.toString(month-1);
			mgquotaVo.setSmonth(smonth);
			map2 = inHospitalMonitoringMapper.costtSatistics(mgquotaVo);
		}
		
		if(map1!=null){
			for (String in : map1.keySet()) {
				Map<String, Object>  map3 = new HashMap<String,Object>();
				//  当前月的数据
	            Object obj =  map1.get(in);
	            float valueCurrent = Float.parseFloat(obj.toString());
	            if(in.contains("ZB")){
	            	if(map2 != null && Float.parseFloat(map2.get(in).toString())>0){
	            		float value = Float.parseFloat(map1.get(in).toString())*100;
	            		map3.put("key", in);
	                	map3.put("value", String.format("%.2f", value)+"%");
	            	}
	            	list.add(map3);
	            }else {
	            	if(map2 != null && Float.parseFloat(map2.get(in).toString())>0){
	                	Object obj1 = map2.get(in);
	                	float valueLast = Float.parseFloat(obj1.toString());
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
	            	list.add(0,map3);
	            }
	        }
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> monthlyTrend(MgquotaVo mgquotaVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void physicianPerformance(PageInfo pageInfo) {
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list  = null;
        if(pageInfo.getCondition().get("lx").equals("lj")){
        	list = inHospitalMonitoringMapper.physicianPerformanceLJ(page, pageInfo.getCondition());
        }else if(pageInfo.getCondition().get("lx").equals("rj")){
        	list = inHospitalMonitoringMapper.physicianPerformanceRJ(page, pageInfo.getCondition());
        }else if(pageInfo.getCondition().get("lx").equals("zb")){
        	list = inHospitalMonitoringMapper.physicianPerformanceZB(page, pageInfo.getCondition());
        }
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}

	@Override
	public List<Map<String, Object>> monthlyTrendControl(MgquotaVo mgquotaVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> trendPerCapitaExpenditure(MgquotaVo mgquotaVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> controlProjectSet(MgquotaVo mgquotaVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> overhospitalization(MgquotaVo mgquotaVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> hospitalStay(MgquotaVo mgquotaVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void inpatientEnquiry(PageInfo pageInfo) {
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list  = inHospitalMonitoringMapper.inpatientEnquiry(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}


	@Override
	public void zywgTable(PageInfo pageInfo) {
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = null;
        if(pageInfo.getCondition().get("lx").equals("order")){
        	list = inHospitalMonitoringMapper.zywggzOrderTable(page, pageInfo.getCondition());
        }else if(pageInfo.getCondition().get("lx").equals("depart")){
        	list = inHospitalMonitoringMapper.zywgdepartOrderTable(page, pageInfo.getCondition());
        }else if(pageInfo.getCondition().get("lx").equals("doctor")){
        	list = inHospitalMonitoringMapper.zywgDoctorOrderTable(page, pageInfo.getCondition());
        }
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}
	
	@Override
	public void illegalDocuments(PageInfo pageInfo) {
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = inHospitalMonitoringMapper.illegalDocuments(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}
	
	@Override
    public void getHospitalizedDataGrid(PageInfo pageInfo) {
        
        Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        
        List<Map<String, Object>> list = inHospitalMonitoringMapper.getHospitalizedDataGrid(page, pageInfo.getCondition());
        
        pageInfo.setRows(list);
        
        pageInfo.setTotal(page.getTotal());
        
    }
	
	@Override
	public void getzyViolationDetails(PageInfo pageInfo) {
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = null;
        if(pageInfo.getCondition().get("lx").equals("order")){
        	String gzbm = (String) pageInfo.getCondition().get("gzbm");
        	if(WholeDocument.getEnumValue(gzbm)!=null){
        		//  整单
        		list = inHospitalMonitoringMapper.getzyWholeViolationDetails(page, pageInfo.getCondition());
        	}else{
        		//  非整单
        		list = inHospitalMonitoringMapper.getzyViolationDetails(page, pageInfo.getCondition());
        	}
        }else{
        	list = inHospitalMonitoringMapper.getzyViolationDetails(page, pageInfo.getCondition());
        }
         
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}
    
	@Override
    public void zyzxksxmmxGrid(PageInfo pageInfo) {
        
        Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        
        List<Map<String, Object>> list = inHospitalMonitoringMapper.zyzxksxmmxGrid(page, pageInfo.getCondition());
        
        pageInfo.setRows(list);
        
        pageInfo.setTotal(page.getTotal());
        
    }
}
