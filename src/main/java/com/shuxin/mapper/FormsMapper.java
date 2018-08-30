package com.shuxin.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.model.FormsModel;

public interface FormsMapper extends BaseMapper<FormsModel> {

 public	List<Map<String, Object>> defineFormsDataGrid(Page<FormsModel> page,
			Map<String, Object> condition);

public List<Map<String, Object>> defineFormseExport(FormsModel formsModel);

	
	
}
