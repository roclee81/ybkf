package com.shuxin.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.result.Tree;
import com.shuxin.commons.shiro.ShiroUser;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.Menu;
import com.shuxin.model.Resource;

/**
 *
 * Resource 表数据服务层接口
 *
 */
public interface IMenuService extends IService<Menu> {

    List<Menu> selectAll();

    List<Tree> selectAllMenu();

    List<Tree> selectAllTree();

    List<Tree> selectTree(ShiroUser shiroUser);

	void selectTreeByCondition(PageInfo pageInfo,int id);
	
	List<Menu> selectMenuByUser(ShiroUser shiroUser);

    List<Menu> selectUserRoleMenuList(String roleId);

}