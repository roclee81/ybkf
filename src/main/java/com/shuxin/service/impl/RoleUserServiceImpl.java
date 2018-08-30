package com.shuxin.service.impl;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.mapper.RoleUserMapper;
import com.shuxin.mapper.UserRoleMapper;
import com.shuxin.model.RoleUser;
import com.shuxin.model.UserRole;
import com.shuxin.service.IRoleUserService;
import com.shuxin.service.IUserRoleService;

/**
 *
 * UserRole 表数据服务层接口实现类
 *
 */
@Service
public class RoleUserServiceImpl extends ServiceImpl<RoleUserMapper, RoleUser> implements IRoleUserService {

}