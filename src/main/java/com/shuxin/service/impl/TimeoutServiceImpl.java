package com.shuxin.service.impl;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.commons.utils.HttpClientUtil;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.ReadBlobUtil;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.mapper.TimeoutMapper;
import com.shuxin.mapper.ViolationStatisticsMapper;
import com.shuxin.model.HospitalClaim;
import com.shuxin.service.ITimeoutCheckService;

import net.sf.json.JSONObject;

@Service
public class TimeoutServiceImpl implements ITimeoutCheckService {

	@Autowired
	TimeoutMapper timeoutMapper;
	@Autowired
	ViolationStatisticsMapper violationStatisticsMapper;
	
	/**
	 * 获取漏审信息
	 */
	@Override
	public void getTimeoutCheck(PageInfo pageInfo,String sfzhm,String hzxm) throws Exception{
		
        List<HospitalClaim> claimList = new ArrayList<>();
        
		List<Map<String, Object>> list = timeoutMapper.getTimeoutCheck(null);
		if(list.isEmpty()){
			return;
		}
		
		for (Map<String, Object> map : list) {
			boolean flag1 = true;
			boolean flag2 = true;
			Blob blob = (Blob)map.get("JSONBLOB");
			String string2 = ReadBlobUtil.readBlobToString(blob);
			JSONObject jsonObject = JSONObject.fromObject(string2);
			JSONObject reqData  = (JSONObject) jsonObject.get("reqData");
			JSONObject ClaimJsonObject = (JSONObject) reqData.get("hospitalClaim");
			HospitalClaim hospitalClaim = (HospitalClaim) JSONObject.toBean(ClaimJsonObject, HospitalClaim.class);
			// 查询条件
			if(StringUtils.isNotBlank(hzxm)){
				flag1 = hospitalClaim.getPatName().contains(hzxm);
			}
			if(StringUtils.isNotBlank(sfzhm)){
				flag2 = hospitalClaim.getPatIdCard().equals(sfzhm);
			}
			if(flag1&&flag2){
				// 查询通过
				claimList.add(hospitalClaim);
			}
		}
		// 总的条数
		int total = claimList.size();
		// 分页查询数的大小
		int size = pageInfo.getSize();
		// 当前页
		int nowpage = pageInfo.getNowpage();
		
		int to;
		// 不符合分页查询的方式，手动设置
		if(total<size*nowpage){
			to= total;
		}else{
			to= size*nowpage;
		}
		pageInfo.setRows(claimList.subList(pageInfo.getFrom(),to));
		pageInfo.setTotal(total);	
	}

	/**
	 * 调用64 的审核服务：
	 * 1. 通过jzlsh 获取待审核信息
	 * 2. 将待审信息转化成json字符串
	 * 3. 调用审核服务
	 */
	@Override
	public void checkDatas(String jzlshs) throws IOException, SQLException {
		List<String> list = StringUtils.strTurnList(jzlshs);
		List<Map<String, Object>> shsj = timeoutMapper.getTimeoutCheck(list);
		for (Map<String, Object> map : shsj) {
			String strClob = ReadBlobUtil.readBlobToString((Blob)map.get("JSONBLOB"));
			JSONObject jsonObject = JSONObject.fromObject(strClob);
			HttpClientUtil.postRequest("http://192.168.10.64:8080/kbms/request/examine", jsonObject.toString());
		}
	}

	@Override
	public void getTimeoutHasCheckedDataGrid(PageInfo pageInfo) {
		Page<?> page = new Page<>(pageInfo.getNowpage(), pageInfo.getPagesize());
		List<Map<String, Object>> rows = timeoutMapper.getTimeoutHasCheckedDataGrid(page, pageInfo.getCondition());
		pageInfo.setRows(rows);
		pageInfo.setTotal(page.getTotal());
	}

	@Override
	public void getTimeoutDetailsDataGrid(PageInfo pageInfo, String jzlsh) {
		Page<?> page = new Page<>(pageInfo.getNowpage(), pageInfo.getPagesize());
		Map<String, Object> condition = new HashMap<>();
		condition.put("jzlsh", jzlsh);
		List<Map<String, Object>> rows = violationStatisticsMapper.getSHviolationDetails(page, condition);
		pageInfo.setRows(rows);
		pageInfo.setTotal(page.getTotal());
	}

}
