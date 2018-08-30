/**
 *	Develop by summer at  2017-3-10 下午04:10:54
 *	Copyright ? 2017济南数昕医疗信息技术有限公司
 *	注意：SysUserController.java不是开源产品，任何未经许可的源码修改、重新发布、反编译，都会被追究法律责任
 *
 */
package com.shuxin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuxin.commons.base.BaseController;
import com.shuxin.commons.utils.DigestUtils;
import com.shuxin.commons.utils.JsonUtils;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.model.Department;
import com.shuxin.model.Role;
import com.shuxin.model.SysUser;
import com.shuxin.model.User;
import com.shuxin.model.vo.SysUserVo;
import com.shuxin.model.vo.UserVo;
import com.shuxin.service.IDepartmentService;
import com.shuxin.service.ISysUserService;

/**
 * 用户管理
 * @author summeryuan
 * @email  905532187qq.com
 */
@Controller
@RequestMapping("/user")
public class SysUserController extends BaseController  {
	@Autowired
	private ISysUserService sysUserService;
	@Autowired 
	private IDepartmentService departmentService;
	
	
	   /**
     * 用户管理页
     *
     * @return
     */
    @RequestMapping("/manager")
    
    public String manager(HttpServletRequest request,  Model model){
		  model=getMenuId(request, model);
	//	   model.addAttribute("flag", 0);
		   model.addAttribute("roleIds", "");
		   
        return "admin/user";
    }

    /**
     * 用户管理列表
     *@author summer
     * @param userVo
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @PostMapping("/dataGrid")
    @ResponseBody
    public Object dataGrid(SysUserVo userVo, Integer page, Integer rows, String sort, String order) {
        System.out.println(userVo);
    	PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        Map<String, Object> condition = new HashMap<String, Object>();

        if (StringUtils.isNotBlank(userVo.getName())) {
            condition.put("name", userVo.getName());
        }
        if (StringUtils.isNotBlank(userVo.getDepartmentId())) {
            condition.put("ksbm", userVo.getDepartmentId());
        }
        if (userVo.getStatus()!=null) {
        	condition.put("status", userVo.getStatus());
        }
        pageInfo.setCondition(condition);
        sysUserService.selectDataGrid(pageInfo);
        return pageInfo;
    }

    /**
     * 添加用户页
     *
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "admin/userAdd";
    }

    /**
     * 添加用户
     *
     * @param userVo
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(SysUserVo userVo) {
        List<SysUser> list = sysUserService.selectByLoginName(userVo);
        if (list != null && !list.isEmpty()) {
            return renderError("用户名已存在!");
        }
        userVo.setUserPassword(DigestUtils.md5Hex(userVo.getUserPassword()));
        sysUserService.insertByVo(userVo);
        insertOperationLog(getShiroUser().getLoginName(),
    			"add","T_USER",userVo.toString());
        return renderSuccess("添加成功");
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
    public String editPage(Model model, String userId,HttpServletRequest request){
		  model=getMenuId(request, model);

    	SysUserVo userVo = sysUserService.selectVoById(userId);
        List<Role> rolesList = userVo.getRolesList();
        List<String> ids = new ArrayList<String>();
   //     StringBuffer ids = new StringBuffer("'");
        if( rolesList.size()>0){
        for (int i = 0; i < rolesList.size(); i++) {
        	     if(rolesList.get(0).getId()!=null){
        	    	 ids.add(rolesList.get(0).getId());
        	     }
        	
			/* if(i==0){
				 ids=ids.append(rolesList.get(0).getId());
			 }else{
				 ids=ids.append(",");
				 ids=ids.append(rolesList.get(i).getId());
			 }*/
        	
		}
        }
        HashMap<String, Object> datamap=new HashMap<String, Object>();
        List<String> ksdmList = new ArrayList<String>();
        List<String> ksmcList = new ArrayList<String>();
        HashMap<String, List<String>> departmap=new HashMap<String, List<String>>();
        List<Department> departments = departmentService.selectByksbm(userVo.getDepartmentId());
        departmap.put("ksdm", ksdmList);
        departmap.put("ksmc", ksmcList);
        for(int i=0;i<departments.size();i++){
        	ksdmList.add(departments.get(i).getKsdm());
        	ksmcList.add(departments.get(i).getKsmc());
        }
        datamap.put("depart", departmap);
        datamap.put("user", userVo);
        datamap.put("roleIds", ids);
    	String jsonStr = JsonUtils.toJson(datamap); 
		return jsonStr;
    }

    /**
     * 编辑用户
     *
     * @param userVo
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(SysUserVo userVo) {
        List<SysUser> list = sysUserService.selectByLoginName(userVo);
        if (list != null && !list.isEmpty()) {
            return renderError("用户名已存在!");
        }
        if (StringUtils.isNotBlank(userVo.getUserPassword())) {
            userVo.setUserPassword(DigestUtils.md5Hex(userVo.getUserPassword()));
        }
        sysUserService.updateByVo(userVo);
        insertOperationLog(getShiroUser().getLoginName(),
    			"update","T_USER",userVo.toString());
        return renderSuccess("修改成功！");
    }

    /**
     * 修改密码页
     *
     * @return
     */
    @GetMapping("/editPwdPage")
    public String editPwdPage() {
        return "admin/userEditPwd";
    }

    /**
     * 修改密码
     *
     * @param oldPwd
     * @param pwd
     * @return
     */
    @RequestMapping("/editUserPwd")
    @ResponseBody
    public Object editUserPwd(String oldPwd, String pwd) {
    	SysUser user = sysUserService.selectById(getUserId());
        if (!user.getUserPassword().equals(DigestUtils.md5Hex(oldPwd))) {
            return renderError("密码错误，请重新输入!");
        }
        sysUserService.updatePwdByUserId(getUserId(), DigestUtils.md5Hex(pwd));
        return renderSuccess("密码修改成功！");
    }

    /**
     * 删除用户
     *
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(  HttpServletRequest request) {
    	 String  ids=request.getParameter("id");
    		String[]  allIds=ids.split(",");
   		 List<String>  userIds=new  ArrayList<String>();
   		  for (int j = 0; j < allIds.length; j++) {
   			userIds.add(allIds[j]);
   		}
        sysUserService.deleteUserById(userIds);
        insertOperationLog(getShiroUser().getLoginName(),
    			"delete","T_USER",userIds.toString());
        return renderSuccess("删除成功！");
    }
	
    
    /**
     * 获取当前用户信息
     * @return
     */
    @RequestMapping("/getUserInfo")
    @ResponseBody
    public Object getUserInfo() {
    	SysUserVo user = sysUserService.selectVoById(getUserId());
    	Map<String, Object> userMap = new HashMap<>();
    	if(user.getAge()==null){
    		userMap.put("age", "--");
    	}else{
    		userMap.put("age", user.getAge());
    	}
    	if(user.getSex() != null){
    		if(user.getSex()==0){
    			userMap.put("sex", '男');
    		}else if(user.getSex()==0){
    			userMap.put("sex", '女');
    		}
    	}
    	userMap.put("ksmc", user.getDepartment_name());
    	userMap.put("role", user.getRolesList().get(0).getName());
    	userMap.put("phone", user.getPhone());
    	
        return JsonUtils.toJson(userMap);
    }
    
    /**
     * 修改当前用户的电话号码
     * @param phone
     */
    @RequestMapping("/savePerInfo")
    @ResponseBody
    public void savePerInfo(String phone){
    	sysUserService.updateUserInfo(phone,getUserId());
    }
}
