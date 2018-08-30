package com.shuxin.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.commons.result.Result;
import com.shuxin.commons.utils.BeanUtils;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.model.DiseaseSetModel;
import com.shuxin.model.vo.DiseaseSetModelVo;
import com.shuxin.service.IDiseaseSetService;


@Controller
@RequestMapping("/diseaseSet")
public class DiseaseSetController {

   @Autowired
   IDiseaseSetService<DiseaseSetModel> DiseaseSetService;
    
   /**
    * 执行 新增修改 操作
    * @param diseaseSetModel
    * @return
    * @throws ParseException 
    */
   @ResponseBody
   @RequestMapping("/change")
   public Object changeDiseaseSet(DiseaseSetModelVo diseaseSetModelVo) throws ParseException
   {
	   Result result = new Result();
	   DiseaseSetModel diseaseSetModel = new DiseaseSetModel();
	   
	   BeanUtils.copy(diseaseSetModelVo, diseaseSetModel);
	   
	   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	   
	   if(StringUtils.isNotBlank(diseaseSetModelVo.getEffectime()))
	   {
		   diseaseSetModel.setEffectime(format.parse(diseaseSetModelVo.getEffectime()));
	   }
	   if(StringUtils.isNotBlank(diseaseSetModelVo.getFailuretime()))
	   {
		   diseaseSetModel.setFailuretime(format.parse(diseaseSetModelVo.getFailuretime()));
	   }
	   
	   result.setMsg((String)DiseaseSetService.changeDiseaseSet(diseaseSetModel));
	   
	   return result; 
   } 
    
   /**
    * 查询病种设定指标
    * @param current
    * @param size
    * @return
    */
   @ResponseBody
   @RequestMapping("/diseaseSetDatagrid")
   public Object getDiseaseSetDatagrid(DiseaseSetModelVo diseaseSetModelVo,Integer page,Integer rows)
   {
	   PageInfo pageInfo = new PageInfo(page, rows);
	   
	   Map<String, Object> condition = new HashMap<String,Object>();
	   
	   if(StringUtils.isNotBlank(diseaseSetModelVo.getZlfsmc()))
	   {
		   condition.put("zlfs", diseaseSetModelVo.getZlfsmc());
	   }
	   if(StringUtils.isNotBlank(diseaseSetModelVo.getJbmc()))
	   {
		   condition.put("jbmc", diseaseSetModelVo.getJbmc());
	   }
	   
	   pageInfo.setCondition(condition);
	   
	   DiseaseSetService.getDiseaseSetDatarid( pageInfo);
	   
	   return pageInfo;
   }
   
   /**
    * 通过id删除
    * @param diseaseSetModel
    * @return
    */
   @ResponseBody
   @RequestMapping("/del")
   public Object deleteDiseaseSetById(String id)
   {
	   return DiseaseSetService.deleteById(id);
   }
   
    
}
