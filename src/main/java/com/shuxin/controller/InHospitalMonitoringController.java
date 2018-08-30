package com.shuxin.controller;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuxin.commons.base.BaseController;
import com.shuxin.commons.utils.JsonUtils;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.model.vo.MgquotaVo;
import com.shuxin.service.IInHospitalMonitoringService;

/**
 * @description：数据监控--出院评价、数据监控--住院患者查询
 */
@Controller
@RequestMapping("/inHospital")
public class InHospitalMonitoringController extends BaseController {
	
    @Autowired
    private IInHospitalMonitoringService inHospitalMonitoring;
    
    /**
     * 预算监控
     * @param mgquotaVo
     * @return
     */
    @PostMapping("/monitorBudget")
    @ResponseBody
    public Object  monitorBudget(MgquotaVo mgquotaVo){
    	List<Map<String, Object>>  list = inHospitalMonitoring.monitorBudget(mgquotaVo);
    	return JsonUtils.toJson(list);
    }
    
    /**
     * 评价指标
     * @param mgquotaVo
     * @return
     */
    @PostMapping("/evaluationIndex")
    @ResponseBody
    public Object  evaluationIndex(MgquotaVo mgquotaVo){
    	@SuppressWarnings("unchecked")
		Map<String, Object> map = (Map<String, Object>) inHospitalMonitoring.evaluationIndex(mgquotaVo);
    	return JsonUtils.toJson(map);
    }
    
    /**
     * 费用统计
     * @param mgquotaVo
     * @return
     */
    @PostMapping("/costtSatistics")
    @ResponseBody
    public Object  costtSatistics(MgquotaVo mgquotaVo){
    	mgquotaVo.setQybm(null);
    	List<Map<String, Object>> list = inHospitalMonitoring.costtSatistics(mgquotaVo);
    	return JsonUtils.toJson(list);
    }
    
    /**
     * 费用统计--月度变化趋势
     * @param mgquotaVo
     * @return
     */
    @PostMapping("/monthlyTrend")
    @ResponseBody
    public List<Map<String, Object>>  monthlyTrend(MgquotaVo mgquotaVo){
    	mgquotaVo.setQybm(null);
    	inHospitalMonitoring.monthlyTrend(mgquotaVo);
    	return null;
    }
    
    /**
     * 医师绩效
     * @param mgquotaVo
     * @return
     */
    @PostMapping("/physicianPerformance")
    @ResponseBody
    public Object  physicianPerformance(MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order){
    	PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
    	inHospitalMonitoring.physicianPerformance(pageInfo);  
        return pageInfo;
    }
    
    /**
     * 月度费用趋势
     * @param mgquotaVo
     * @return
     */
    @PostMapping("/monthlyTrendControl")
    @ResponseBody
    public List<Map<String, Object>>  monthlyTrendControl(MgquotaVo mgquotaVo){
    	inHospitalMonitoring.monthlyTrendControl(mgquotaVo);
    	return null;
    }
    
    /**
     * 人均费用趋势
     * @param mgquotaVo
     * @return
     */
    @PostMapping("/trendPerCapitaExpenditure")
    @ResponseBody
    public List<Map<String, Object>>  trendPerCapitaExpenditure(MgquotaVo mgquotaVo){
    	inHospitalMonitoring.trendPerCapitaExpenditure(mgquotaVo);
    	return null;
    }
    
    /**
     * 管控项目设定
     * @param mgquotaVo
     * @return
     */
    @PostMapping("/controlProjectSet")
    @ResponseBody
    public List<Map<String, Object>>  controlProjectSet(MgquotaVo mgquotaVo){
    	inHospitalMonitoring.controlProjectSet(mgquotaVo);
    	return null;
    }
    
    /**
     * 住院费用超额
     * @param mgquotaVo
     * @return
     */
    @PostMapping("/overhospitalization")
    @ResponseBody
    public List<Map<String, Object>>  overhospitalization(MgquotaVo mgquotaVo){
    	inHospitalMonitoring.overhospitalization(mgquotaVo);
    	return null;
    }
    
    /**
     * 住院时间超长
     * @param mgquotaVo
     * @return
     */
    @PostMapping("/hospitalStay")
    @ResponseBody
    public List<Map<String, Object>>  hospitalStay(MgquotaVo mgquotaVo){
    	inHospitalMonitoring.hospitalStay(mgquotaVo);
    	return null;
    }
    
    /**
     * 出院患者查询
     * @param mgquotaVo
     * @return
     */
    @PostMapping("/inpatientEnquiry")
    @ResponseBody
    public Object  inpatientEnquiry(MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order){
    	PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
    	inHospitalMonitoring.inpatientEnquiry(pageInfo); 
        return pageInfo;
    }
    
    /**
     * 违规排序
     * @param mgquotaVo
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @PostMapping("/zywgTable")
    @ResponseBody
    public Object zywgTable( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
    	PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
    	inHospitalMonitoring.zywgTable(pageInfo);  
        return pageInfo;
    }
    
    /**
     * 住院违规汇总
     * @return
     */
    @PostMapping("/illegalDocuments")
    @ResponseBody
    public Object illegalDocuments( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order,String data) {
    	if(mgquotaVo.getLx().equals("order")){
    		mgquotaVo.setGzbm(data);
    	}else if(mgquotaVo.getLx().equals("depart")){
    		mgquotaVo.setKsbm(data);
    	}else if(mgquotaVo.getLx().equals("doctor")){
    		mgquotaVo.setYsgh(data);
    	}
    	PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
    	inHospitalMonitoring.illegalDocuments(pageInfo);  
        return pageInfo;
    }
    
    /**
     * 描述:  出院患者查询
     * 名称:  getHospitalizedDataGrid
     * 作者 :  LiuYang
     * 时间 :  2017年10月31日 下午1:48:39  
     * 参数:  @param mgquotaVo
     * 参数:  @param page
     * 参数:  @param rows
     * 参数:  @param sort
     * 参数:  @param order
     * 参数:  @return     
     */
    @PostMapping("/getHospitalizedDataGrid")
    @ResponseBody
    public Object getHospitalizedDataGrid(MgquotaVo mgquotaVo,String ldate,String hdate, Integer page, Integer rows, String sort, String order) {
    	
        PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
        
        if(StringUtils.isNotBlank(ldate)){
        	pageInfo.getCondition().put("ldate", ldate);
        }
        if(StringUtils.isNotBlank(hdate)){
        	pageInfo.getCondition().put("hdate", hdate);
        }

        inHospitalMonitoring.getHospitalizedDataGrid(pageInfo);

        return pageInfo;

    }
    
    
    public PageInfo queryConditions(MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order){
    	PageInfo pageInfo = new PageInfo(page, rows, "", "");
        Map<String, Object> condition = new HashMap<String, Object>();
        
        if(mgquotaVo.getKsbm()!=null && StringUtils.isNotBlank(mgquotaVo.getKsbm())){
      	   condition.put("ksbm", mgquotaVo.getKsbm());
      	}
      	if(mgquotaVo.getSyear()!=null && StringUtils.isNotBlank(mgquotaVo.getSyear())){
       	   condition.put("syear", mgquotaVo.getSyear());
       	}
      	if(mgquotaVo.getSmonth()!=null && StringUtils.isNotBlank(mgquotaVo.getSmonth())){
        	   condition.put("smonth", mgquotaVo.getSmonth());
        	}	
      	if(mgquotaVo.getCblxbm()!=null && StringUtils.isNotBlank(mgquotaVo.getCblxbm())){
      		
       		condition.put("cblxbm", mgquotaVo.getCblxbm());
       	}
      	if(mgquotaVo.getYsgh()!=null && StringUtils.isNotBlank(mgquotaVo.getYsgh())){
     		
     		condition.put("ysgh", mgquotaVo.getYsgh());
     	}
    	if(mgquotaVo.getGzbm()!=null && StringUtils.isNotBlank(mgquotaVo.getGzbm())){
   		
   		condition.put("gzbm", mgquotaVo.getGzbm());
    	}
    	if(mgquotaVo.getLx()!=null && StringUtils.isNotBlank(mgquotaVo.getLx())){
       		
   		condition.put("lx", mgquotaVo.getLx());
    	}
    	if(mgquotaVo.getHzxm()!=null && StringUtils.isNotBlank(mgquotaVo.getHzxm())){
       		
   		condition.put("hzxm", mgquotaVo.getHzxm());
    	}
    	if(mgquotaVo.getSfzhm()!=null && StringUtils.isNotBlank(mgquotaVo.getSfzhm())){
       		
   		condition.put("sfzhm", mgquotaVo.getSfzhm());
    	}
    	if(mgquotaVo.getJyfs()!=null && StringUtils.isNotBlank(mgquotaVo.getJyfs())){
       		
   		condition.put("jyfs", mgquotaVo.getJyfs());
    	}
    	if(mgquotaVo.getZyh()!=null && StringUtils.isNotBlank(mgquotaVo.getZyh())){
       		
   		condition.put("zyh", mgquotaVo.getZyh());
    	}
          	pageInfo.setCondition(condition);
          	return pageInfo;
    }
    
    @PostMapping("/zyviolationDetails")
    @ResponseBody
    public Object zyviolationDetails( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order,String data) {
    	if(mgquotaVo.getLx().equals("order")){
    		mgquotaVo.setGzbm(data);
    	}
    	PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
    	inHospitalMonitoring.getzyViolationDetails(pageInfo);  
        return pageInfo;
    } 

    /**
     * 获取住院执行科室项目明细数据
     *  2018年7月11日17:17:03
     */
    @RequestMapping("/zyzxksxmmxGrid")
    @ResponseBody
    public Object zyzxksxmmxGrid(MgquotaVo mgquotaVo,String ldate,String hdate, Integer page, Integer rows, String sort, String order) {
    	
        PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
        
        if(StringUtils.isNotBlank(ldate)){
        	pageInfo.getCondition().put("ldate", ldate);
        }
        if(StringUtils.isNotBlank(hdate)){
        	pageInfo.getCondition().put("hdate", hdate);
        }

        inHospitalMonitoring.zyzxksxmmxGrid(pageInfo);
        
        List<Map<String, Object>>list = pageInfo.getRows();
        for (Iterator<Map<String, Object>> iterator = list.iterator(); iterator.hasNext();) {
			Map<String, Object> map = (Map<String, Object>) iterator.next();
			Float fyje = Float.parseFloat(map.get("FYJE").toString());	//总费用金额
			Float seflpay = Float.parseFloat(map.get("SEFLPAY").toString());	//自费金额
			Float ypf = Float.parseFloat(map.get("YPF").toString());	//药品费
			Float jyf = Float.parseFloat(map.get("JYF").toString());	//检查检验费
			Float zlf = Float.parseFloat(map.get("ZLF").toString());	//诊疗费
			Float clf = Float.parseFloat(map.get("CLF").toString());	//材料费
			DecimalFormat df = new DecimalFormat("##.##%");
			
			map.put("ZFZB", fyje<0.000001 ? 0 : df.format(seflpay/fyje));	//自费占比
			map.put("YZB", fyje<0.000001 ? 0 : df.format(ypf/fyje));	//药占比
			map.put("JCJYFZB", fyje<0.000001 ? 0 : df.format(jyf/fyje));//检查检验占比
			map.put("ZLFZB", fyje<0.000001 ? 0 : df.format(zlf/fyje));	//诊疗占比
			map.put("CLFZB", fyje<0.000001 ? 0 : df.format(clf/fyje));	//材料占比
        }
        return pageInfo;

    }
    
}
