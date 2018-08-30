package com.shuxin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuxin.commons.base.BaseController;
import com.shuxin.commons.utils.JsonUtils;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.model.DoorPatientType;
import com.shuxin.model.MgLimit;
import com.shuxin.model.vo.CostStructVo;
import com.shuxin.service.IDoorPatientTypeService;
import com.shuxin.service.decisionAnalysis.ICostStructService;

@Controller
@RequestMapping("/doorPatientType")
public class doorPatientTypeSetController extends BaseController{
	
	@Autowired
	IDoorPatientTypeService doorPatientTypeService;
	
	@RequestMapping("/updateMgPatientType")
	@ResponseBody
	public Object updateDoorPatientType(DoorPatientType doorPatientType){
			DoorPatientType doorPatientType2=doorPatientTypeService.selectBybzxh( doorPatientType.getBzxh());
			if(doorPatientType2==null){
				doorPatientTypeService.insert(doorPatientType);
				return renderSuccess("添加成功");
			}else {
				doorPatientTypeService.updatemgbz(doorPatientType);
				return renderSuccess("修改成功");
			}
		
	}
	
	@RequestMapping("/detele")
	@ResponseBody
	public Object deteleDoorPatientType(String bzxh ){
		doorPatientTypeService.deletemgbz(bzxh);
		return renderSuccess("删除成功");
	}
}
