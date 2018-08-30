package com.shuxin.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.shuxin.commons.base.BaseController;
import com.shuxin.model.Role;

/**
 * @description：测试Controller
 */
@Controller
@RequestMapping("/test")
public class TestController extends BaseController {

	@Autowired
//	private TestServiceImpl service;
	
	/**
     * 图标测试
     * 
     * @RequiresRoles shiro 权限注解
     * 
     * @return
     */
    @RequiresRoles("test")
    @GetMapping("/dataGrid")
    public String dataGrid() {
        return "admin/test";
    }
    
    @RequestMapping("/imtest")
    public void test(){
    	//DataGridServiceImpl<Role> service=new DataGridServiceImpl<Role>();
    	EntityWrapper<Role> wrapper=new EntityWrapper<Role>();
    	Map<String, Object> map=new HashMap<String,Object>();
    	map.put("name like {0}", "%1%");
    	map.put("status={0}", 0);
    //	List<Role> list= service.getListByCondition(wrapper,map );
    //	System.out.println(list);
    }



    
    
}
