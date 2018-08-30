package com.shuxin.controller.doorManager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuxin.commons.base.BaseController;
import com.shuxin.commons.enums.WholeDocument;
import com.shuxin.commons.utils.JsonUtils;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.model.vo.MgquotaVo;
import com.shuxin.service.IMgquotaService;

@Controller
@RequestMapping("/mgquota")
public class MgquotaController extends BaseController{

	@Autowired
	private IMgquotaService mgquotaService;
	
	 /**
     * 门规限额
     *@author summer
     * @param myLimit
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @PostMapping("/mgquotaDataGrid")
    @ResponseBody
    public Object mgquotaDataGrid( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
    	System.out.println(mgquotaVo);
    	PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
        	mgquotaService.selectmgquotaDataGrid(pageInfo);  
        return pageInfo;
    }
    
    /**
     * 门规关键指标
     * @return
     */
    @PostMapping("/mgquotadepartZB")
    @ResponseBody
    public Object mgquotadepartZB(MgquotaVo  mgquotaVo,HttpServletRequest request,HttpServletResponse response)
    {
    	System.out.println(mgquotaVo);
    	
    	mgquotaVo.setCblxbm(getCblx(mgquotaVo.getCblxbm()));
    	List<Map<String, Object>> hospitalMonitordepartZB=mgquotaService.mgquotadepartZB(mgquotaVo);
    	
    	String json= JsonUtils.toJson(hospitalMonitordepartZB);

    	return json;
    }
    
    /**
     * 门诊关键指标
     * @return
     */
    @PostMapping("/mzquotadepartZB")
    @ResponseBody
    public Object mzquotadepartZB(MgquotaVo  mgquotaVo,HttpServletRequest request,HttpServletResponse response)
    {
    	System.out.println(mgquotaVo);
    	
    	List<Map<String, Object>> hospitalMonitordepartZB=mgquotaService.mzquotadepartZB(mgquotaVo);
    	
    	String json= JsonUtils.toJson(hospitalMonitordepartZB);
    	System.out.println(json);
    	return json;
    }
    
    @PostMapping("/mzquotaDataGrid")
    @ResponseBody
    public Object mzquotaDataGrid( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
    	System.out.println(mgquotaVo);
    	PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
        mgquotaService.selectmzquotaDataGrid(pageInfo);  
        return pageInfo;
        
    }
    
    @PostMapping("/mzViolationsDocuments")
    @ResponseBody
    public Object mzViolationsDocuments( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order,String lx) {
    	System.out.println(mgquotaVo);
    	PageInfo pageInfo = queryConditions(mgquotaVo,page,rows,sort,order);
    	

        String enumValue = WholeDocument.getEnumValue(mgquotaVo.getGzbm());
        
        if (enumValue ==null && StringUtils.isBlank(enumValue)) {
            //非整单
            mgquotaService.mzViolationsDocuments(pageInfo); 
        }else{
            //整单违规
            mgquotaService.wholeDocument(pageInfo);
        }
    	
    	return pageInfo;
    }
    
    @PostMapping("/mgViolationsDocuments")
    @ResponseBody
    public Object mgViolationsDocuments( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order,String lx) {
    	System.out.println(mgquotaVo);
    	PageInfo pageInfo = queryConditions(mgquotaVo,page,rows,sort,order);
    	mgquotaService.mgViolationsDocuments(pageInfo); 
        return pageInfo;
    }
    
    @PostMapping("/mzViolationdetails")
    @ResponseBody
    public Object mzViolationdetails( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
    	System.out.println(mgquotaVo);
    	PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
    	//就诊流水号 判断是否是
    	boolean flag = mgquotaService.getWholeDocument(mgquotaVo.getMzlsh());
    	
    	
    	if (flag) {
    	    mgquotaVo.setGzbm("1");
//    	    mgquotaService.mzViolationdetailsDoc(pageInfo);  
        }
            //非整单
            mgquotaService.mzViolationdetails(pageInfo);  
        return pageInfo;
    }
    
    @PostMapping("/mgViolationsDocumentsDepart")
    @ResponseBody
    public Object mgViolationsDocumentsDepart( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order,String lx) {
    	System.out.println(mgquotaVo);
    	PageInfo pageInfo = queryConditions(mgquotaVo,page,rows,sort,order);
    	mgquotaService.mgViolationsDocumentsDepart(pageInfo); 
    	System.out.println(pageInfo);
        return pageInfo;
    }
    
    @PostMapping("/mgViolationdetails")
    @ResponseBody
    public Object mgViolationdetails( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
    	System.out.println(mgquotaVo);
    	PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
        mgquotaService.mgViolationdetails(pageInfo);  
        return pageInfo;
    }
    
    @PostMapping("/mzwggzOrderTable")
    @ResponseBody
    public Object mzwggzOrderTable( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
    	PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
        mgquotaService.mzwggzOrderTable(pageInfo);  
        return pageInfo;
    }
    
    @PostMapping("/wggzOrderTable")
    @ResponseBody
    public Object wggzOrderTable( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
    	PageInfo pageInfo = queryConditions(mgquotaVo,page,rows,sort,order);
        mgquotaService.wggzOrderTable(pageInfo);  
        return pageInfo;
    }
    
    @PostMapping("/mzwgDoctorOrderTable")
    @ResponseBody
    public Object mzwgDoctorOrderTable( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
    	System.out.println(mgquotaVo);
    	PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
        mgquotaService.mzwgDoctorOrderTable(pageInfo);  
        return pageInfo;
    }
    
    @PostMapping("/mgwgDoctorOrderTable")
    @ResponseBody
    public Object mgwgDoctorOrderTable( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
    	System.out.println(mgquotaVo);
    	PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
        mgquotaService.mgwgDoctorOrderTable(pageInfo);  
        return pageInfo;
        
    }
    
    @PostMapping("/mzwgdepartOrderTable")
    @ResponseBody
    public Object mzwgdepartOrderTable( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
    	System.out.println(mgquotaVo);
    	PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
        mgquotaService.mzwgdepartOrderTable(pageInfo);  
        return pageInfo;
        
    }
   
    @PostMapping("/wgdepartOrderTable")
    @ResponseBody
    public Object wgdepartOrderTable( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
    	System.out.println(mgquotaVo);
    	PageInfo pageInfo = queryConditions(mgquotaVo,page,rows,sort,order);
        mgquotaService.wgdepartOrderTable(pageInfo);  
        return pageInfo;
    }
    
    @PostMapping("/mzwgdjDocuments")
    @ResponseBody
    public Object mzwgDocuments( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
    	System.out.println(mgquotaVo);
    	PageInfo pageInfo =queryConditions(mgquotaVo,page,rows,sort,order);
        mgquotaService.mzwgdjDocuments(pageInfo);  
        return pageInfo;
    }
    
    @PostMapping("/mzmgdetails_depart")
    @ResponseBody
    public Object mzmgdetails_depart( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
    	System.out.println(mgquotaVo);
    	PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
        mgquotaService.mzmgdetails_depart(pageInfo);  
        return pageInfo;
        
    }
    
    @PostMapping("/mzmgdetails")
    @ResponseBody
    public Object mzmgdetails( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
    	PageInfo pageInfo =queryConditions(mgquotaVo,page,rows,sort,order);
    	
    	String enumValue = WholeDocument.getEnumValue(mgquotaVo.getGzbm());
        
        if (enumValue ==null && StringUtils.isBlank(enumValue)) {
            //非整单
        	mgquotaService.mzmgdetails(pageInfo); 
        }else{
            //整单违规
            mgquotaService.wholemgdetails(pageInfo);
        }
    	
        return pageInfo;
    }
    
    @PostMapping("/getmzpatientDataGrid")
    @ResponseBody
    public Object getmzpatientDataGrid( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
    	System.out.println(mgquotaVo);
    	PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
    	//pageInfo.getCondition().put("sfzhm", mgquotaVo.getSfzhm());
        mgquotaService.getmzpatientDataGrid(pageInfo);  
        return pageInfo;
        
    }
    
    @PostMapping("/mzwgdjDocuments_dapart")
    @ResponseBody
    public Object mzwgdjDocuments_dapart( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
    	System.out.println(mgquotaVo);
    	PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
        mgquotaService.mzwgdjDocuments_dapart(pageInfo);  
        return pageInfo;
        
    }
    
    
    @PostMapping("/cumulativeMonthly")
    @ResponseBody
    public Object cumulativeMonthly(MgquotaVo  mgquotaVo){
    	String accumulate=mgquotaService.cumulativeMonthly(mgquotaVo);
		return accumulate;
    }
    
    @PostMapping("/cumulativeYear")
    @ResponseBody
    public Object cumulativeYear(MgquotaVo  mgquotaVo){
    	String accumulate=mgquotaService.cumulativeYear(mgquotaVo);
		return accumulate;
    }
    
    @PostMapping("/analysisIndicators")
    @ResponseBody
    public Object analysisIndicators(MgquotaVo  mgquotaVo){
		return JsonUtils.toJson(mgquotaService.analysisIndicators(mgquotaVo));
    }
    
    
    // ksbm syear smonth cblxbm ysgh bzxh gzbm mzlsh bzbm sfzhm
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
      	if(mgquotaVo.getQybm()!=null && StringUtils.isNotBlank(mgquotaVo.getQybm())){
      		
       		condition.put("qybm", mgquotaVo.getQybm());
       	}
      	if(mgquotaVo.getYsgh()!=null && StringUtils.isNotBlank(mgquotaVo.getYsgh())){
     		
     		condition.put("ysgh", mgquotaVo.getYsgh());
     	}
      	if(mgquotaVo.getBzxh()!=null && StringUtils.isNotBlank(mgquotaVo.getBzxh())){
     		
     		condition.put("bzxh", mgquotaVo.getBzxh());
     	}	
    	if(mgquotaVo.getGzbm()!=null && StringUtils.isNotBlank(mgquotaVo.getGzbm())){
   		
   		condition.put("gzbm", mgquotaVo.getGzbm());
    	}
    	if(mgquotaVo.getMzlsh()!=null && StringUtils.isNotBlank(mgquotaVo.getMzlsh())){
       		
   		condition.put("mzlsh", mgquotaVo.getMzlsh());
    	}
    	if(mgquotaVo.getBzmc()!=null && StringUtils.isNotBlank(mgquotaVo.getBzmc())){
       		
   		condition.put("bzmc", mgquotaVo.getBzmc());
    	}
		if(mgquotaVo.getBzbm()!=null && StringUtils.isNotBlank(mgquotaVo.getBzbm())){
			 		
		condition.put("bzbm", mgquotaVo.getBzbm());
		}
		if(mgquotaVo.getSfzhm()!=null && StringUtils.isNotBlank(mgquotaVo.getSfzhm())){
	 		
		condition.put("sfzhm", mgquotaVo.getSfzhm());
		}if(mgquotaVo.getLx()!=null && StringUtils.isNotBlank(mgquotaVo.getLx())){
	 		
		condition.put("lx", mgquotaVo.getLx());
		}if(mgquotaVo.getJzrq()!=null && StringUtils.isNotBlank(mgquotaVo.getJzrq())){
	 		
		condition.put("jzrq", mgquotaVo.getJzrq());
		}if(mgquotaVo.getHzxm()!=null && StringUtils.isNotBlank(mgquotaVo.getHzxm())){
            
		    condition.put("hzxm", mgquotaVo.getHzxm());
        }
          	pageInfo.setCondition(condition);
          	return pageInfo;
    }
    
    public String getCblx(String cblxbm){
    	switch (cblxbm) {
		case "390":
			return "城乡居民";
		case "391":
			return "城镇职工";
		case "392":
			return "省直医保";

		default:
			return "000";
		}
    }
    
    @PostMapping("/selectPatient")
    @ResponseBody
    public Object selectPatient(MgquotaVo mgquotaVo) {
    	List<Map<String, Object>> list = mgquotaService.selectPatient(mgquotaVo);
        return JsonUtils.toJson(list.get(0));

    }
    
    @PostMapping("/mgViolationsDocumentsBZ")
    @ResponseBody
    public Object mgViolationsDocumentsBZ( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order,String lx) {
    	System.out.println(mgquotaVo);
    	PageInfo pageInfo = queryConditions(mgquotaVo,page,rows,sort,order);
    	mgquotaService.mgViolationsDocumentsBZ(pageInfo); 
        return pageInfo;
    }
}
