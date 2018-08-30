package com.shuxin.service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.utils.PageInfo;

public interface IDataGridService<T> extends IService<T>{
	public void getListByCondition(EntityWrapper<T> wrapper,PageInfo pageInfo);
}