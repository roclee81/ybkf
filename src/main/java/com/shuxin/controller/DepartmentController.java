package com.shuxin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.ArrayList; 
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuxin.commons.base.BaseController;
import com.shuxin.commons.shiro.ShiroUser;
import com.shuxin.commons.utils.DigestUtils;
import com.shuxin.commons.utils.JsonUtils;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.model.Department;
import com.shuxin.model.Role;
import com.shuxin.model.SysUser;
import com.shuxin.model.vo.SysUserVo;
import com.shuxin.service.IDepartmentService;


@Controller
@RequestMapping("/department")
public class DepartmentController extends BaseController  {

	@Autowired 
	private IDepartmentService departmentService;
	
	/**
	 *用户管理
	 * @param 
	 * @return
	 */
	@RequestMapping("/manager")
	/*@RequiresPermissions("/department/manager")*/
	public String manager(HttpServletRequest request,  Model model){
		  model=getMenuId(request, model);
	    	
		 // model.addAttribute("flag", 0);
	     return "zidian/depart";
		
	}
	
	 /**
     * 科室管理列表
     *@author summer
     * @param userVo
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    /*@PostMapping("/dataGrid")
    @ResponseBody
    public Object dataGrid(Department depart, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows, "", "");
        if(depart.getKsbm()==null &&depart.getKsmc()==null  && depart.getKslb()==null){
       departmentService.selectDepartByCondition(pageInfo);
     
        }else{
        	  Map<String, Object> condition = new HashMap<String, Object>();
        	if(depart.getKsbm()!=null && StringUtils.isNotBlank(depart.getKsbm())){
        	   condition.put("ksbm", depart.getKsbm());
        	}
        	if(depart.getKsmc()!=null && StringUtils.isNotBlank(depart.getKsmc())){
         	   condition.put("ksmc", depart.getKsmc());
         	}
        	if(depart.getKslb()!=null && StringUtils.isNotBlank(depart.getKslb())){
         	   condition.put("kslb", depart.getKslb());
         	}
        	if(depart.getKsqybz()!=null){
        		
         		condition.put("ksqybz", depart.getKsqybz());
         	}
        	
        	pageInfo.setCondition(condition);
        	 departmentService.selectDepartByCondition(pageInfo);
        	
        }
         
         
        
        return pageInfo;
        
    }*/
	
	/**
	 * 
	 * @param depart
	 * @param page
	 * @param rows
	 * @param sort
	 * @param order
	 * @return
	 */
    @RequestMapping("/getType")
    @ResponseBody
    public Object getType(String clum,String kslx) {
       
         List<Department> departType=departmentService.findDepartType(clum,null,kslx);
         
         String json= JsonUtils.toJson(departType);
        
        return json;
        
    }
    
    /**
     * 
     * @param ksbm
     */
    @RequestMapping("/getdoctorByksbm")
    @ResponseBody
    public Object getdoctorByksbm(String ksbm) {      	
    	List<Map<String, Object>> paramterType=departmentService.getdoctorByksbm(ksbm);    
    	String json= JsonUtils.toJson(paramterType);
    	return json;
    	
    	
    }
    
    /**
     * 根据登录用户信息查询科室
     * @param kslx  门诊使用、医技使用、住院使用、病区使用
     * @return
     */
    @RequestMapping("/getDepartmentOfUser")
    @ResponseBody
    public Object getDepartmentOfUser(@RequestParam(value="kslx",required=false) String kslx)
    {
    	ShiroUser user = getShiroUser();
    	List<Department> departType=departmentService.findDepartType("ksmc",user.getDepartmentId(),kslx);
                 
        String json= JsonUtils.toJson(departType);
        
        return json;
    }
    /**
     * 根据登录用户信息查询科室
     * @return
     */
    @RequestMapping("/getDepartmentOfUser2")
    @ResponseBody
    public Object getDepartmentOfUser2()
    {
    	ShiroUser user = getShiroUser();
    	
    	List<Department> departType=departmentService.findDepartType2("ksmc",user.getDepartmentId());
    	
    	String json= JsonUtils.toJson(departType);
    	
    	return json;

    }
    
    /**
     * 添加科室
     *
     * @param userVo
     * @return
     */
    /*@RequestMapping("/add")
    @ResponseBody
    public Object add(Department depart) {
    	List<Department> getDepart=departmentService.selectByksbm(depart.getKsbm());

    	//List<Department> getupDepart=departmentService.selectByksbm(depart.getKsjbgl());

  //  	List<Department> getupDepart=departmentService.selectByksbm(depart.getKsjbgl());

    	
    	 if(getDepart.size()>0){
    		 return renderError("科室编码已存在!");
    	 }

//    	 if(getupDepart.size()==0){
//    		 return renderError("上级科室编码错误!");
//    	 }

   // 	 if(getupDepart.size()==0){
    //		 return renderError("上级科室编码错误!");
    //	 }

        List<Department> list = departmentService.selectByLoginName(depart);
        if (list != null && !list.isEmpty()) {
            return renderError("科室名已存在!");
        }
        
        departmentService.insertDepart(depart);
        insertOperationLog(getShiroUser().getLoginName(),
				"add","T_ZD_KSZDB",depart.toString());
        return renderSuccess("添加成功");
    }*/
    /**
     * 添加科室页
     *
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "zidian/addDepart";
    }
    
    /**
     * 编辑用户页
     *
     * @param id
     * @param model
     * @return
     */
    @PostMapping("/editPage")
    @ResponseBody
    public Object editPage(HttpServletRequest request,Model model, String deparrtId) {
    	
    	
    	Department depart = departmentService.selectdepartById(deparrtId);
        

		String jsonStr = JsonUtils.toJson(depart); 
		return jsonStr;
    	//	  model=getMenuId(request, model);
      //  model.addAttribute("depart", depart);
    //   model.addAttribute("flag", 1);
     //   return "zidian/depart";
    }
    
    /**
     * 根据科室编码查科室
     *
     * @param ksbm
     * @param model
     * @return
     */
    @PostMapping("/finddepartBybm")
    @ResponseBody
    public Object finddepartBybm(HttpServletRequest request,Model model, String ksbm) {
    	
    	
    	List<Department> departlist = departmentService.selectByksbm(ksbm);
    	Department  depart=null;
    	if(departlist.size()>0){
    		depart=departlist.get(0);
    	}
    	String jsonStr = JsonUtils.toJson(depart); 
    	return jsonStr;
    	//	  model=getMenuId(request, model);
    	//  model.addAttribute("depart", depart);
    	//   model.addAttribute("flag", 1);
    	//   return "zidian/depart";
    }
    
    /**
     * 编辑用户
     *
     * @param userVo
     * @return
     */
    /*@RequestMapping("/edit")
    @ResponseBody
    public Object edit(Department depart) {
        List<Department> list = departmentService.selectByLoginName(depart);

    	//List<Department> getupDepart=departmentService.selectByksbm(depart.getKsjbgl());

//    	List<Department> getupDepart=departmentService.selectByksbm(depart.getKsjbgl());

    	List<Department> Departlist=departmentService.selectByksbm(depart.getKsbm());
//    	 if(getupDepart.size()==0){
//    		 return renderError("上级科室编码错误!");
//    	 }
        if (list != null && !list.isEmpty()) {
        	for (int i = 0; i < list.size(); i++) {
				if(!list.get(i).getKsbm().equals(depart.getKsbm())){
					return renderError("科室已存在!");
				}
			}
            
        }
        //由于页面可以修改编码则需判断
        if (Departlist != null && !Departlist.isEmpty()) {
        	for (int i = 0; i < Departlist.size(); i++) {
        		if(!Departlist.get(i).getId().equals(depart.getId())){
        			return renderError("科室已存在!");
        		}
        	}
        	
        }
        
        departmentService.updateDepart(depart);
        insertOperationLog(getShiroUser().getLoginName(),
				"update","T_ZD_KSZDB",depart.toString());
        return renderSuccess("修改成功！");
    }*/
    /**
     * 删除科室
     * 
     *
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete( HttpServletRequest request) {
    	 String  ids=request.getParameter("id");
    	String[]  allIds=ids.split(",");
    	 List<String> departIds=new  ArrayList<String>();
    	  for (int j = 0; j < allIds.length; j++) {
    		  departIds.add(allIds[j]);
		}
    	  departmentService.deleteDepartById(departIds);
    	  insertOperationLog(getShiroUser().getLoginName(),
  				"delete","T_ZD_KSZDB",ids);
        return renderSuccess("删除成功！");
    }
    
    /**
     * 获取分页科室数据
     * @param clum
     * @param kslx
     * @return
     */
    @RequestMapping("/getDepartDatagrid")
    @ResponseBody
    public Object getDepartDatagrid(String kslx,Integer page, Integer rows) {
         PageInfo pageInfo = new PageInfo(page, rows, "", "");
         
         Map<String, Object> condition = new HashMap<String, Object>();
         
         condition.put("kslx", kslx);
         
         pageInfo.setCondition(condition);
    	
         departmentService.selectDepartByCondition(pageInfo);
        
        return pageInfo;
        
    }
    
    /**
     * 获取社保局信息
     * @return
     */
    @RequestMapping("/sbInfo")
    @ResponseBody
    public Object getSbInfo(){
    	List<Map<String, Object>> list = departmentService.getSbInfo();
    	
    	return renderSuccess(list);
    }
    
}
