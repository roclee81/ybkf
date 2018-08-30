package com.shuxin.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuxin.commons.base.BaseController;
import com.shuxin.commons.dataSource.DataSourceContextHolder;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.service.ITimeoutCheckService;


@Controller
@RequestMapping("/timeout")
public class TimeoutCheckController extends BaseController  {

	@Autowired 
	private ITimeoutCheckService timeoutCheckService;
	
	/**
	 * 切换数据源
	 * 获取his服务器上漏审的数据信息
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping("/datagrid")
	@ResponseBody
	public Object getTimeoutCheck(Integer page, Integer rows,String sfzhm,String hzxm){
		PageInfo pageInfo = new PageInfo(page, rows, null, null);
		try {
			DataSourceContextHolder.setDbType("ds_his");
			timeoutCheckService.getTimeoutCheck(pageInfo,sfzhm,hzxm);
		} catch (IOException e) {
			e.printStackTrace();
			logger.debug("出现io异常");
		} catch (SQLException e) {
			e.printStackTrace();
			logger.debug("出现sql异常");
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("出现exception异常");
		} finally {
			DataSourceContextHolder.clearDbType();
		}
		return pageInfo;
	} 
	
	/**
	 * 通过就诊流水号审核指定的数据信息
	 * @param jzlshs
	 * @return
	 * @throws IOException
	 * @throws SQLException
	 */
	@RequestMapping("/check")
	@ResponseBody
	public Object checkDatas(String jzlshs)throws IOException, SQLException{
		DataSourceContextHolder.setDbType("ds_his");
		timeoutCheckService.checkDatas(jzlshs);
		DataSourceContextHolder.clearDbType();
		return renderSuccess();
	} 
	
	@RequestMapping("/page")
	public String timeoutPage(String flag,String zyh,ModelMap model){
		model.addAttribute("zyh", zyh);
		return "/dataMonitoring/timeoutPage";
	} 
	
	/**
	 * 漏审审核信息
	 * @param page
	 * @param rows
	 * @param ksbm
	 * @param ldate
	 * @param hdate
	 * @param flag	:连接 64 服务器的标志
	 * @return
	 */
	@RequestMapping("/timeoutHasCheckedDataGrid")
	@ResponseBody
	public Object  getTimeoutHasCheckedDataGrid(Integer page, Integer rows,String ksbm ,String ldate ,String hdate,String flag){
		PageInfo pageInfo = new PageInfo(page, rows);
		Map<String, Object> condition = new HashMap<>();
		condition.put("ldate", ldate);
		condition.put("hdate", hdate);
		condition.put("ksbm", ksbm);
		pageInfo.setCondition(condition);
		timeoutCheckService.getTimeoutHasCheckedDataGrid(pageInfo);
		return pageInfo;
		
	}
    
	/**
	 * 漏审信息违规详情
	 * @param page
	 * @param rows
	 * @param jzlsh
	 * @param flag
	 * @return
	 */
	@RequestMapping("/timeoutDetailsDataGrid")
	@ResponseBody
	public Object  getTimeoutDetailsDataGrid(Integer page, Integer rows,String jzlsh,String flag){
		PageInfo pageInfo = new PageInfo(page, rows);
		timeoutCheckService.getTimeoutDetailsDataGrid(pageInfo,jzlsh);
		return pageInfo;
		
	}
	
	@RequestMapping("/timeoutHasCheckedPage")
	public Object  gotoPageTimeoutHasChecked(){
		return "/checkRules/timeoutHasChecked";
	}
	
	
	
}
