package com.shuxin.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.commons.result.Tree;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.mapper.RoleMapper;
import com.shuxin.mapper.RoleResourceMapper;
import com.shuxin.mapper.UserRoleMapper;
import com.shuxin.model.Menu;
import com.shuxin.model.Role;
import com.shuxin.model.RoleResource;
import com.shuxin.service.IRoleService;

/**
 *
 * Role 表数据服务层接口实现类
 *
 */
@Service
public class RoleServiceImpl extends DataGridServiceImpl<Role> implements IRoleService{

    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private UserRoleMapper userRoleMapper;
    @Autowired
    private RoleResourceMapper roleResourceMapper;
    
    public List<Role> selectAll() {
        EntityWrapper<Role> wrapper = new EntityWrapper<Role>();
        wrapper.orderBy("id");
        return roleMapper.selectList(wrapper);
    }
    
    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<Role> page = new Page<Role>(pageInfo.getNowpage(), pageInfo.getSize());
        EntityWrapper<Role> wrapper = new EntityWrapper<Role>();
        wrapper.orderBy(pageInfo.getSort(), pageInfo.getOrder().equalsIgnoreCase("ASC"));
        selectPage(page, wrapper);
        pageInfo.setRows(page.getRecords());
        pageInfo.setTotal(page.getTotal());
    }

    @Override
    public Object selectTree() {
        List<Tree> trees = new ArrayList<Tree>();
        List<Role> roles = this.selectAll();
        for (Role role : roles) {
            Tree tree = new Tree();
            tree.setId(role.getId());
            tree.setText(role.getName());

            trees.add(tree);
        }
        return trees;
    }

    @Override
    public void updateRoleResource(String roleId, String resourceIds) {
        // 先删除后添加,有点爆力
        RoleResource roleResource = new RoleResource();
        roleResource.setRoleId(roleId);
        roleResourceMapper.delete(new EntityWrapper<RoleResource>(roleResource));
        
        String[] resourceIdArray = resourceIds.split(",");
        for (String resourceId : resourceIdArray) {
            roleResource = new RoleResource();
            roleResource.setRoleId(roleId);
            roleResource.setResourceId(resourceId);
            roleResourceMapper.insert(roleResource);
        }
    }

    @Override
    public List<String> selectResourceIdListByRoleId(String id) {
        return roleMapper.selectResourceIdListByRoleId(id);
    }
    
    @Override
    public Map<String, Set<String>> selectResourceMapByUserId(String userId) {
        Map<String, Set<String>> resourceMap = new HashMap<String, Set<String>>();
        List<String> roleIdList = userRoleMapper.selectRoleIdListByUserId(userId);
        Set<String> urlSet = new HashSet<String>();
        Set<String> roles = new HashSet<String>();
//        for (String roleId : roleIdList) {
            List<Menu> resourceList = roleMapper.selectResourceListByRoleIdList(roleIdList);
            if (resourceList != null) {
                for (Menu menu : resourceList) {
                    if (StringUtils.isNotBlank(menu.getUrl())) {//Other
                        urlSet.add(menu.getUrl());
                    }
                }
            }
            if(roleIdList!=null && roleIdList.size()>0)
            {
	            Role role = roleMapper.selectById(roleIdList.get(0));
	            if (role != null) {
	                roles.add(role.getName());
	            }
            }
//        }
        resourceMap.put("urls", urlSet);
        resourceMap.put("roles", roles);
        return resourceMap;
    }

}