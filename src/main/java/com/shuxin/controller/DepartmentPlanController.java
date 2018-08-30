package com.shuxin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuxin.commons.base.BaseController;
import com.shuxin.commons.utils.JsonUtils;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.model.DepartmentPlan;
import com.shuxin.model.vo.DepartPlanModelVo;
import com.shuxin.service.IDepartmentPlanService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 科室预算分配控制层
 * @author admin
 *
 */
@Controller
@RequestMapping("/departmentPlan")
public class DepartmentPlanController extends BaseController  {

	@Autowired
	private IDepartmentPlanService planService;
	
	@RequestMapping("/uploadDePlans")
    @ResponseBody
    public Object uploadDePlans(HttpServletRequest request, HttpServletResponse response){
		String msg = planService.uploadDePlans(request,response,"d://temp.xml");
		return renderSuccess(msg);
	}
	
	@RequestMapping("/departmentPlanDatagrid")
    @ResponseBody
    public Object selectDepartmentPlanDatagrid( DepartmentPlan departmentPlan, Integer page, Integer rows, String sort, String order) {
		PageInfo pageInfo = new PageInfo(page, rows, "", "");
        Map<String, Object> condition = new HashMap<String, Object>();
        
        if(departmentPlan.getCblxbm()!=null && StringUtils.isNotBlank(departmentPlan.getCblxbm())){
      	   condition.put("cblxbm", departmentPlan.getCblxbm());
      	}
      	if(departmentPlan.getSyear()!=null && StringUtils.isNotBlank(departmentPlan.getSyear())){
       	   condition.put("syear", departmentPlan.getSyear());
       	}
      	if(departmentPlan.getKsbm()!=null && StringUtils.isNotBlank(departmentPlan.getKsbm())){
           condition.put("ksbm", departmentPlan.getKsbm());
        }	
      	if(departmentPlan.getQy()!=null && StringUtils.isNotBlank(departmentPlan.getQy())){
            condition.put("qy", departmentPlan.getQy());
         }
        pageInfo.setCondition(condition);
		planService.selectDepartmentPlanDatagrid(pageInfo);  
    	return pageInfo;
    }
	
	@RequestMapping("/insertDepartmentPlan")
    @ResponseBody
    public Object insertDepartmentPlan(@RequestBody String data) throws Exception{
		JSONObject dataObject = JSONObject.fromObject(data);
		
		JSONObject objJson =JSONObject.fromObject(dataObject.get("obj"));
		DepartmentPlan departmentPlan = (DepartmentPlan) JSONObject.toBean(objJson, DepartmentPlan.class);
		
		JSONArray listJson=JSONArray.fromObject(dataObject.get("list"));
		@SuppressWarnings("unchecked")
		List<DepartPlanModelVo> list = (List<DepartPlanModelVo>) JSONArray.toCollection(listJson, DepartPlanModelVo.class);
		
		return JsonUtils.toJson(planService.insertDepartmentPlan(departmentPlan,list));
    }
	
	@RequestMapping("/deleteDepartmentPlan")
    @ResponseBody
    public Object deleteDepartmentPlan( String ids) {
		return renderSuccess(planService.deleteByids(ids));
    }
	
	@RequestMapping("/getDepartmentPlan")
    @ResponseBody
    public Object getDepartmentPlanById( String id) {
		return JsonUtils.toJson(planService.selectById(id));
    }
	
	@RequestMapping("/DepPlanOfMonth")
    @ResponseBody
    public Object insertDepPlanOfMonth(DepartPlanModelVo vo) {
		vo.setKsfptype(getKsfptypeBm(vo.getKsfptype()));
		int num = planService.updateDepPlanOfMonth(vo);
		if(num==0){
			return renderError("修改失败");
		}
		return renderSuccess("修改成功"); 
    }
	
	@RequestMapping("/DepPlanOfSeason")
    @ResponseBody
    public Object insertDepPlanOfSeason(DepartPlanModelVo vo) {
		vo.setKsfptype(getKsfptypeBm(vo.getKsfptype()));
		int num = planService.updateDepPlanOfSeason(vo);
		if(num==0){
			return renderError("修改失败");
		}
		return renderSuccess("修改成功"); 
    }
	
	@RequestMapping("/getDataOfMonth")
    @ResponseBody
    public Object getDataOfMonth(DepartPlanModelVo vo) {
		Map<String, Object> params = new HashMap<>();
		params.put("ksfptype", getKsfptypeBm(vo.getKsfptype()));
		params.put("id", vo.getId());
		return JsonUtils.toJson(planService.getDataOfMonth(params));
    }
	
	@RequestMapping("/delDepPlan")
	@ResponseBody
    public void getDataOfMonth(String id) {
		planService.delDepPlanByid(id);
    }
	
	
	private String getKsfptypeBm(String ksfptype){
		if(ksfptype.equals("医疗总费用定额设定")||ksfptype.equals("ylzfyxe")){
			return "ylf";
		}else if(ksfptype.equals("住院人次定额设定")||ksfptype.equals("zyrc")){
			return "zyrc";
		}else if(ksfptype.equals("基金限额设定")||ksfptype.equals("jjxe")){
			return "jjxe";
		}
		return null;
	}
	
}
