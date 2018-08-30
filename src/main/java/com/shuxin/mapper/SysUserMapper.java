package com.shuxin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.shuxin.model.SysUser;
import com.shuxin.model.User;
import com.shuxin.model.vo.SysUserVo;
import com.shuxin.model.vo.UserVo;

/**
 *
 * User 表数据库控制层接口
 *
 */
public interface SysUserMapper extends BaseMapper<SysUser> {

    SysUserVo selectUserVoById(@Param("id") String id);

    List<SysUserVo> selectUserVoPage(Pagination page, Map<String, Object> params);

}