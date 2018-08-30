package com.shuxin.controller.doorManager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.xmlbeans.impl.xb.xmlschema.impl.BaseAttributeImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuxin.commons.base.BaseController;
import com.shuxin.commons.shiro.ShiroUser;
import com.shuxin.commons.utils.JsonUtils;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.model.Department;
import com.shuxin.model.DoctorGroup;
import com.shuxin.model.DoctorGroupPlan;
import com.shuxin.model.MgLimit;
import com.shuxin.model.vo.MgDiseasesVo;
import com.shuxin.service.doorManager.IMgLimitService;

@Controller
@RequestMapping("/mglimit")
public class MgLimitController  extends BaseController {

	@Autowired
	private IMgLimitService  mgLimitService;
	 
	
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
    @PostMapping("/mglist")
    @ResponseBody
    public Object mglistdataGrid( MgLimit myLimit, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows, "", "");
     Map<String, Object> condition = new HashMap<String, Object>();
        	pageInfo.setCondition(condition);
        	mgLimitService.selectmglistdataGrid(pageInfo);

        return pageInfo;
        
    }
    
    @PostMapping("/mgbzlist")
    @ResponseBody
    public Object mgbzlistdataGrid( MgDiseasesVo mgDiseasesVo, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows, "", "");
     Map<String, Object> condition = new HashMap<String, Object>();
        	pageInfo.setCondition(condition);
        	mgLimitService.selectmgbzlistdataGrid(pageInfo);
        	return pageInfo;
        
    }
    /**
     * 门规修改新增
     *@author summer
     * @param mylimit
     */
    @PostMapping("/updateMg")
    @ResponseBody
    public Object updateMg( MgLimit myLimit) {
    	List<MgLimit> getMgLimit=mgLimitService.selectByVo(myLimit);
    	
		if(getMgLimit.size()>0){
			return renderError("病种已设置!");
		} 
		List<Map<String, Object>>  druglist=mgLimitService.getbyzdbm(myLimit.getZdbm());
        if(druglist.size()>0){
        	myLimit.setBzmc(druglist.get(0).get("bzmc").toString());
        	myLimit.setZdmc(druglist.get(0).get("zdmc").toString());
        }
		mgLimitService.updateMg(myLimit);
		
		return renderSuccess("添加成功");
    }
    
    /**
     *门规限额删除
     *@author summer
     */
    @PostMapping("/deleteMg")
    @ResponseBody
    public Object deleteMg( HttpServletRequest request) {
    	ShiroUser user = getShiroUser();
   	 String  ids=request.getParameter("id");
   		String[]  allIds=ids.split(",");
  		 List<String>  Ids=new  ArrayList<String>();
  		  for (int j = 0; j < allIds.length; j++) {
  			Ids.add(allIds[j]);
  		}
  		mgLimitService.deleteMg(Ids,user);
  /*     insertOperationLog(getShiroUser().getLoginName(),
   			"delete","T_USER",userIds.toString());*/
       return renderSuccess("删除成功！");
    }
    /**
     *得到病种分类
     * @param id
     * @return
     */
    @RequestMapping("/getbzmcbyfl")
    @ResponseBody
    public Object getbzmcbyfl( String bzfl,   HttpServletRequest request) {
    	 List<Map<String, Object>> paramterType=mgLimitService.getbzmcbyfl(bzfl);    
         String json= JsonUtils.toJson(paramterType);
        return json;
    }
    
    @RequestMapping("/getmzjbmc")
    @ResponseBody
    public Object getmzjbmc( HttpServletRequest request) {
    	 List<Map<String, Object>> paramterType=mgLimitService.getmzjbmc();    
         String json= JsonUtils.toJson(paramterType);
        return json;
    }
 
    /**
     *得到病种分类
     * @param id
     * @return
     */
    @RequestMapping("/getbybzmc")
    @ResponseBody
    public Object getbybzmc( String bzmc,   HttpServletRequest request) {
    	List<Map<String, Object>> paramterType=mgLimitService.getbybzmc(bzmc);    
    	String json= JsonUtils.toJson(paramterType);
    	return json;
    }
    
    @RequestMapping("/getAllbz")
    @ResponseBody
    public Object getAllbz(HttpServletRequest request) {
    	List<Map<String, Object>> paramterType=mgLimitService.getAllbz();    
    	String json= JsonUtils.toJson(paramterType);
    	return json;
    }
    
    /*================================================================================*/
    @RequestMapping("/getJbmcByfl")
    @ResponseBody
    public Object getJbmcByfl(String fl) {
    	List<Map<String, Object>> paramterType=mgLimitService.getJbmcByfl(fl);    
    	String json= JsonUtils.toJson(paramterType);
    	return json;
    }
    
    @RequestMapping("/getZdbmByJbmc")
    @ResponseBody
    public Object getZdbmByJbmc(String jbmc) {
    	List<Map<String, Object>> paramterType=mgLimitService.getZdbmByJbmc(jbmc);    
    	String json= JsonUtils.toJson(paramterType);
    	return json;
    }
}
