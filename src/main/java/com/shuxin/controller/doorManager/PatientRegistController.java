package com.shuxin.controller.doorManager;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuxin.commons.base.BaseController;
import com.shuxin.commons.shiro.ShiroUser;
import com.shuxin.commons.utils.BeanUtils;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.model.DoorPatient;
import com.shuxin.model.DoorpatientDrug;
import com.shuxin.model.MgLimit;
import com.shuxin.model.vo.DoorPatientVo;
import com.shuxin.service.doorManager.IDoorpatientDrugService;
import com.shuxin.service.doorManager.IMgLimitService;
import com.shuxin.service.doorManager.IPatientRegistService;
import com.shuxin.service.impl.doorManager.MgLimitServiceImpl;

@Controller
@RequestMapping("/patientRegist")
public class PatientRegistController  extends  BaseController{
    @Autowired
	private IPatientRegistService patientRegistService;
    @Autowired
    private IMgLimitService  mgLimitService;
    @Autowired
    private IDoorpatientDrugService doorpatientDrugService  ;
	
	
	 /**
     * 门诊病人登记
     *@author summer
     * @param myLimit
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @PostMapping("/patientregislist")
    @ResponseBody
    public Object patientregislistdataGrid( DoorPatientVo doorPatientvo, Integer page, Integer rows, String sort, String order) {
		PageInfo pageInfo = new PageInfo(page, rows, "", "");
		Map<String, Object> condition = new HashMap<String, Object>();
		if(StringUtils.isNotBlank(doorPatientvo.getHzxm()))
		{
			condition.put("hzxm", doorPatientvo.getHzxm());
		}
		if(StringUtils.isNotBlank(doorPatientvo.getSfzhm()))
		{
			condition.put("sfzhm", doorPatientvo.getSfzhm());
		}
		if(StringUtils.isNotBlank(doorPatientvo.getCblx()))
		{
			condition.put("cblxbm", doorPatientvo.getCblx());
		}
		if(StringUtils.isNotBlank(doorPatientvo.getMgjbmc()))
		{
			condition.put("jbmc", doorPatientvo.getMgjbmc());
		}
		pageInfo.setCondition(condition);
		patientRegistService.selectpatientregislistdataGrid(pageInfo);
        return pageInfo;
        
    }
    /**
     * 门诊病人登记修改新增
     *@author summer
     * @param mylimit
     * @throws ParseException 
     */
    @PostMapping("/updatePatient")
    @ResponseBody
    public Object updatePatient( DoorPatientVo doorPatientvo) throws ParseException {
    	DoorPatient doorPatient=new DoorPatient();
    	   String[] zdbmarr=null;
    		String mgjbbm=doorPatientvo.getMgjbbm();
    	if(StringUtils.isNotBlank(doorPatientvo.getMgjbbm())){
    		zdbmarr=mgjbbm.split(",");
    	}  
        List<DoorPatient> getdoorPatient=patientRegistService.selectBysfh(doorPatientvo);
 		if(getdoorPatient.size()>0){
 			return renderError("该患者已登记!");
 		} 
        BeanUtils.copy(doorPatientvo, doorPatient);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        if(doorPatientvo.getSxsj()!=null&&StringUtils.isNotBlank(doorPatientvo.getSxsj())){
        	doorPatient.setSxsj(formatter.parse(doorPatientvo.getSxsj().toString()));
        }
        if(doorPatientvo.getSxsj1()!=null&&StringUtils.isNotBlank(doorPatientvo.getSxsj1())){
        	doorPatient.setSxsj1(formatter.parse(doorPatientvo.getSxsj1().toString()));
        }
		patientRegistService.updateMg(doorPatient);
		List<DoorpatientDrug> list = doorpatientDrugService.getPatientDrugBySFZHM(doorPatientvo.getSfzhm());
		if(list.size()>0){
			doorpatientDrugService.deletebySFZHM(doorPatientvo.getSfzhm());
		}
    	for (int i = 0; i < zdbmarr.length; i++) {
			List<Map<String, Object>>  druglist=mgLimitService.getbyzdbm(zdbmarr[i]);
			// 通过zdbm  查询门规病种字典表  1.若为没改门规病种，获取门规病人登记中的记录2.若存在，则赋值插入
			if(druglist.size()==0){
				for (DoorpatientDrug dpg : list) {
					if(dpg.getZdbm().equals(zdbmarr[i])){
						doorpatientDrugService.insertdoorpatientDrug(dpg);
					}
				}
			}else{
				DoorpatientDrug doorpatientDrug=new DoorpatientDrug();
				Map<String, Object> drugmap = druglist.get(0);
				if(drugmap.get("bzfl")!=null){
					doorpatientDrug.setBzfl(drugmap.get("bzfl").toString());
				}
				if(drugmap.get("bzxh")!=null){
					doorpatientDrug.setBzxh(drugmap.get("bzxh").toString());
				}
				if(drugmap.get("bzmc")!=null){
					doorpatientDrug.setZdmc(drugmap.get("bzmc").toString());
				}
				if(drugmap.get("zdbm")!=null){
					doorpatientDrug.setZdbm(drugmap.get("zdbm").toString());
				}
				if(drugmap.get("zdmc")!=null){
					doorpatientDrug.setZdmc(drugmap.get("zdmc").toString());
				}
				doorpatientDrug.setSfzhm(doorPatient.getSfzhm());
				doorpatientDrugService.insertdoorpatientDrug(doorpatientDrug);
			}
    	}
		return renderSuccess("添加成功");
    }
    /**
     *门诊病人登记限额删除
     *@author summer
     */
    @PostMapping("/deletePatient")
    @ResponseBody
    public Object deleteMg( HttpServletRequest request) {
    	ShiroUser user = getShiroUser();
   	 String  ids=request.getParameter("sfzhm");
   	/*	String[]  allsfzhms=ids.split(",");
  		 List<String>  sfzhms=new  ArrayList<String>();
  		  for (int j = 0; j < allsfzhms.length; j++) {
  			sfzhms.add(allsfzhms[j]);
  		}*/
  		patientRegistService.deleteMg(ids,user);
  		doorpatientDrugService.deletedoorpatientDrug(ids,user);
  /*     insertOperationLog(getShiroUser().getLoginName(),
   			"delete","T_USER",userIds.toString());*/
       return renderSuccess("删除成功！");
    }
	
	
	
}
