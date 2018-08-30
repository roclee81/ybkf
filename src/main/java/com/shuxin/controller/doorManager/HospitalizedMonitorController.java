package com.shuxin.controller.doorManager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.shuxin.commons.base.BaseController;
import com.shuxin.commons.result.Result;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.model.vo.MgquotaVo;
import com.shuxin.service.doorManager.IHospitalizedMonitorService;

/**
* @ClassName: HospitalizedMonitorController
* @Description: TODO(在院监控控制层)
* @author LiuYang
* @date 2017年11月27日
*
*/
@Controller
@RequestMapping("/hospitalized")
public class HospitalizedMonitorController extends BaseController {

    @Autowired
    private IHospitalizedMonitorService hospitalizedService;

    /**
    * @Title: getExampleNumber
    * @Description: TODO(数据统计
                            在院123例
                            普通住院   
                            单病种
                            费用指标异常
                            审核违规
                            自费提醒
                            出院带药违规
                            医保对账异常)
    * @param @param mVo
    * @param @return    参数
    * @return Object    返回类型
    * @throws
    */
    @RequestMapping("/getExampleNumber")
    @ResponseBody
    public Object getExampleNumber(MgquotaVo mVo) {

        List<Map<String, Object>> list = hospitalizedService.getExampleNumber(mVo);

        return list;

    }

    /**
    * @Title: getInhospatientGrid
    * @Description: TODO(在院患者列表)
    * @param @param mVo
    * @param @param page
    * @param @param rows
    * @param @param sort
    * @param @param order
    * @param @return    参数
    * @return PageInfo    返回类型
    * @throws
    */
    @RequestMapping("/getInhospatientGrid")
    @ResponseBody
    public PageInfo getInhospatientGrid(MgquotaVo mVo, Integer page, Integer rows, String sort, String order) {

        PageInfo pageInfo = queryConditions(mVo, page, rows, sort, order);
        hospitalizedService.getInhospatientGrid(pageInfo);

        return pageInfo;
    }

    /**
    * @Title: getDiagnosisInfo
    * @Description: TODO(就诊信息)
    * @param @param zylsh
    * @param @return    参数
    * @return Object    返回类型
    * @throws
    */
    @RequestMapping("/getDiagnosisInfo")
    @ResponseBody
    public Object getDiagnosisInfo(String zylsh) {

        List<Map<String, Object>> list = hospitalizedService.getDiagnosisInfo(zylsh);

        if (list == null || list.size() < 1) {
            return null;
        }
        Result renderSuccess = (Result) renderSuccess(list);

        return renderSuccess;
    }

    /**
    * @Title: getCostWarning
    * @Description: TODO(费勇指标预警)
    * @param @param zylsh
    * @param @return    参数
    * @return Object    返回类型
    * @throws
    */
    @RequestMapping("/getCostWarning")
    @ResponseBody
    public Object getCostWarning(String zylsh) {

        List<Map<String, Object>> list = hospitalizedService.getCostWarning(zylsh);

        if (list == null || list.size() < 1) {
            return null;
        }
        Result renderSuccess = (Result) renderSuccess(list);

        return renderSuccess;
    }

    /**
     * @Title: getAuditViolations
     * @Description: TODO(审核违规)
     * @param @param mVo
     * @param @param page
     * @param @param rows
     * @param @param sort
     * @param @param order
     * @param @return    参数
     * @return PageInfo    返回类型
     * @throws
     */
    @RequestMapping("/getAuditViolations")
    @ResponseBody
    public PageInfo getAuditViolations(String zylsh, Integer page, Integer rows, String sort, String order) {

        PageInfo pageInfo = new PageInfo(page, rows, "", "");
        Map<String, Object> condition = new HashMap<String, Object>();

        if (!"".equals(zylsh)) {

        	condition.put("zylsh", zylsh);
            pageInfo.setCondition(condition);
        }

        hospitalizedService.getAuditViolations(pageInfo);

        return pageInfo;
    }

    /**
    * @Title: getDischargedMedicine
    * @Description: TODO(出院带药)
    * @param @param zylsh
    * @param @param page
    * @param @param rows
    * @param @param sort
    * @param @param order
    * @param @return    参数
    * @return PageInfo    返回类型
    * @throws
    */
    @RequestMapping("/getDischargedMedicine")
    @ResponseBody
    public PageInfo getDischargedMedicine(String zylsh, Integer page, Integer rows, String sort, String order) {

        PageInfo pageInfo = new PageInfo(page, rows, "", "");
        Map<String, Object> condition = new HashMap<String, Object>();

        if ("".equals(zylsh)) {

            condition.put("zylsh", zylsh);
        }

        hospitalizedService.getDischargedMedicine(pageInfo);

        return pageInfo;
    }
    /**
    * @Title: getMedicareBills
    * @Description: TODO(医嘱明细)
    * @param @param zylsh
    * @param @param page
    * @param @param rows
    * @param @param sort
    * @param @param order
    * @param @return    参数
    * @return PageInfo    返回类型
    * @throws
    */
    @RequestMapping("/getOrderDetails")
    @ResponseBody
    public PageInfo getOrderDetails(String zylsh, Integer page, Integer rows, String sort, String order) {
        
        PageInfo pageInfo = new PageInfo(page, rows, "", "");
        Map<String, Object> condition = new HashMap<String, Object>();
        condition.put("zylsh", zylsh);
        pageInfo.setCondition(condition);
        
        hospitalizedService.getOrderDetails(pageInfo);
        
        return pageInfo;
    }
    /**
    * @Title: getChargeDetails
    * @Description: TODO(费用明细)
    * @param @param zylsh
    * @param @param page
    * @param @param rows
    * @param @param sort
    * @param @param order
    * @param @return    参数
    * @return PageInfo    返回类型
    * @throws
    */
    @RequestMapping("/getChargeDetails")
    @ResponseBody
    public PageInfo getChargeDetails(String zylsh, Integer page, Integer rows, String sort, String order) {
        
        PageInfo pageInfo = new PageInfo(page, rows, "", "");
        Map<String, Object> condition = new HashMap<String, Object>();
        
        if (!"".equals(zylsh)) {
            
        	condition.put("zylsh", zylsh);
            pageInfo.setCondition(condition);
        }
        
        hospitalizedService.getChargeDetails(pageInfo);
        
        return pageInfo;
    }

    /**
    * @Title: queryConditions
    * @Description: TODO(分页page查询条件整合)
    * @param @param mgquotaVo
    * @param @param page
    * @param @param rows
    * @param @param sort
    * @param @param order
    * @param @return    参数
    * @return PageInfo    返回类型
    * @throws
    */
    public PageInfo queryConditions(MgquotaVo mgquotaVo, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows, "", "");
        Map<String, Object> condition = new HashMap<String, Object>();

        if (mgquotaVo.getKsbm() != null && StringUtils.isNotBlank(mgquotaVo.getKsbm())) {
            condition.put("ksbm", mgquotaVo.getKsbm());
        }
        if (mgquotaVo.getSyear() != null && StringUtils.isNotBlank(mgquotaVo.getSyear())) {
            condition.put("syear", mgquotaVo.getSyear());
        }
        if (mgquotaVo.getSmonth() != null && StringUtils.isNotBlank(mgquotaVo.getSmonth())) {
            condition.put("smonth", mgquotaVo.getSmonth());
        }
        if (mgquotaVo.getCblxbm() != null && StringUtils.isNotBlank(mgquotaVo.getCblxbm())) {

            condition.put("cblxbm", mgquotaVo.getCblxbm());
        }
        if (mgquotaVo.getQybm() != null && StringUtils.isNotBlank(mgquotaVo.getQybm())) {

            condition.put("qybm", mgquotaVo.getQybm());
        }
        if (mgquotaVo.getYsgh() != null && StringUtils.isNotBlank(mgquotaVo.getYsgh())) {

            condition.put("ysgh", mgquotaVo.getYsgh());
        }
        if (mgquotaVo.getBzxh() != null && StringUtils.isNotBlank(mgquotaVo.getBzxh())) {

            condition.put("bzxh", mgquotaVo.getBzxh());
        }
        if (mgquotaVo.getGzbm() != null && StringUtils.isNotBlank(mgquotaVo.getGzbm())) {

            condition.put("gzbm", mgquotaVo.getGzbm());
        }
        if (mgquotaVo.getMzlsh() != null && StringUtils.isNotBlank(mgquotaVo.getMzlsh())) {

            condition.put("mzlsh", mgquotaVo.getMzlsh());
        }
        if (mgquotaVo.getBzmc() != null && StringUtils.isNotBlank(mgquotaVo.getBzmc())) {

            condition.put("bzmc", mgquotaVo.getBzmc());
        }
        if (mgquotaVo.getBzbm() != null && StringUtils.isNotBlank(mgquotaVo.getBzbm())) {

            condition.put("bzbm", mgquotaVo.getBzbm());
        }
        if (mgquotaVo.getSfzhm() != null && StringUtils.isNotBlank(mgquotaVo.getSfzhm())) {

            condition.put("sfzhm", mgquotaVo.getSfzhm());
        }
        if (mgquotaVo.getLx() != null && StringUtils.isNotBlank(mgquotaVo.getLx())) {

            condition.put("lx", mgquotaVo.getLx());
        }
        if (mgquotaVo.getJzrq() != null && StringUtils.isNotBlank(mgquotaVo.getJzrq())) {

            condition.put("jzrq", mgquotaVo.getJzrq());
        }
        if (mgquotaVo.getJyfs() != null && StringUtils.isNotBlank(mgquotaVo.getJyfs())) {

            condition.put("jyfs", mgquotaVo.getJyfs());
        }
        if (mgquotaVo.getSyearmonth() != null && StringUtils.isNotBlank(mgquotaVo.getSyearmonth())) {

            condition.put("syearmonth", mgquotaVo.getSyearmonth());
        }
        pageInfo.setCondition(condition);
        return pageInfo;
    }

}
