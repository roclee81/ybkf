package com.shuxin.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.FormsModel;
import com.shuxin.model.MTDrgsCheck;

public interface IFormsService extends IService<FormsModel>{

 public	List<Map<String, Object>> defineFormsDataGrid(PageInfo pageInfo);

public List<Map<String, Object>> defineFormseExport(FormsModel formsModel);

}
