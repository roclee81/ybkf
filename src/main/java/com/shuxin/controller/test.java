package com.shuxin.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuxin.commons.base.BaseController;
import com.shuxin.commons.dataSource.DataSourceContextHolder;
import com.shuxin.commons.utils.ReadBlobUtil;
import com.shuxin.mapper.TimeoutMapper;
import com.shuxin.model.HospitalClaim;

import net.sf.json.JSONObject;


@Controller
@RequestMapping("/his")
public class test extends BaseController  {

	@Autowired 
	private TimeoutMapper mapper;
	
	@RequestMapping("/test")
	@ResponseBody
	public Object test01() throws IOException, SQLException{
		DataSourceContextHolder.setDbType("ds_his");
		List<Map<String, Object>> list = mapper.getString();
		DataSourceContextHolder.clearDbType();
		int i = 0 ;
		for (Map<String, Object> map : list) {
			Blob blob = (Blob)map.get("JSONBLOB");
			if(blob == null){
				return "blob 是空的";
			}
			String string2 = ReadBlobUtil.readBlobToString(blob);
			if(string2 == null){
				return "string2 是空的";
			}
			JSONObject jsonObject = JSONObject.fromObject(string2);
			if(jsonObject == null){
				return "jsonObject 是空的";
			}
			JSONObject reqData  = (JSONObject) jsonObject.get("reqData");
			if(reqData == null){
				return "reqData 是空的";
			}
			JSONObject ClaimJsonObject = (JSONObject) reqData.get("hospitalClaim");
			if(ClaimJsonObject == null){
				return "ClaimJsonObject 是空的";
			}
			HospitalClaim hospitalClaim = (HospitalClaim) JSONObject.toBean(ClaimJsonObject, HospitalClaim.class);
			if(hospitalClaim == null){
				return "hospitalClaim 是空的";
			}else{
				return hospitalClaim;
			}
//			InputStream is = blob.getBinaryStream();
//			int a = is.read();
//			while(a!=-1){
//				return a;
//			}
		}
		return list.size();
	}
	
	
    
}
