package com.shuxin.commons.utils;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

public class HttpClientUtil {
	private final static String CONTENT_TYPE_TEXT_JSON = "text/json;charset=utf-8";

	public static void main(String[] args) throws ClientProtocolException, IOException {
		String url = "http://localhost:8080/kbms/request/examine";
		String jsonData = "{\"reqData\":{\"certId\":\"shuxin123\",\"hospitalClaim\":{\"id\":\"105\",\"pointOrgId\":\"pointOrgId\",\"pointOrgGrade\":\"-2\",\"pointOrgType\":\"1\",\"diaSerialCode\":\"100003\",\"medTreatmentMode\":\"11\",\"medTreatmentCode\":\"medTreatmentCode\",\"patCode\":\"90134***\",\"patMedInsuCard\":\"\",\"patName\":\"patName\",\"patInsuredType\":\"392\",\"patIsPregnant\":\"0\",\"patIsNursing\":\"0\",\"patGender\":\"2\",\"patAge\":\"17\",\"patHeight\":\"170\",\"patWeight\":\"76.46\",\"patIdCard\":\"1231231231\",\"patType\":\"1\",\"patBirthday\":\"2012-01-31 12:00:00\",\"diaInHospCode\":\"C02.901\",\"diaInHospName\":\"diaInHospName\",\"diaOutHospCode\":\"\",\"diaOutHospName\":\"diaOutHospName\",\"diaViceCode\":\"222\",\"diaViceName\":\"aaa\",\"inHospDate\":\"2017-12-10  12:00:00\",\"outHospDate\":\"2017-12-20  12:00:00\",\"settlementDate\":\"2016-05-11 12:00:00\",\"inHospDeptCode\":\"inHospDeptCode\",\"inHospDeptName\":\"inHospDeptName\",\"outHospDeptCode\":\"\",\"outHospDeptName\":\"\",\"physicianCode\":\"physicianCode\",\"physicianName\":\"physicianName\",\"physicianLevel\":\"33\",\"isRemote\":\"0\",\"medInsTotalCost\":\"123.23\",\"totalCost\":\"243.23\",\"treatmentType\":\"3\",\"disSoldierSign\":\"1\",\"becWarPubSign\":\"2\",\"healType\":\"2\",\"inpaArea\":\"inpaArea\",\"medRecordCode\":\"medRecordCode\",\"liveHospStatus\":\"1\",\"isIncrement\":\"1\",\"insuHandId\":\"1\",\"dbzzlfs\":\"1\",\"dbzzlmc\":\"普通门诊\",\"dataSource\":\"1\",\"operationType\":\"1\"},\"hospitalClaimDetails\":[{\"id\":\"a0014\",\"diaSerialCode\":\"100003\",\"docSerialCode\":\"docSerialCode\",\"docSerialType\":\"-1\",\"productCode\":\"0003490001\",\"productName\":\"productName\",\"thrCatType\":\"1\",\"fygbmc\":\"aaa\",\"fygbbm\":\"233\",\"mgbz\":\"C15.901 ,\",\"reimLevel\":\"3\",\"outHospTakMedicine\":\"1\",\"unitPrice\":\"1.45\",\"pnumber\":\"7\",\"amount\":\"160.65\",\"unit\":\"ke\",\"spec\":\"\",\"medDays\":\"\",\"dosage\":\"\",\"frequency\":\"\",\"cardNum\":\"\",\"outYardSign\":\"0\",\"chargSign\":\"0\",\"serviceDate\":\"2017-12-18 02:00:00\",\"stopDate\":\"2017-12-22 14:25:11\",\"hospDeptCode\":\"hospDeptCode\",\"hospDeptName\":\"hospDeptName\",\"physicianCode\":\"\",\"physicianName\":\"\",\"medInsCost\":\"2340.22\",\"payCost\":\"2342.33\",\"selfCost\":\"23423.33\",\"detailOperationType\":\"1\"},{\"id\":\"a0015\",\"diaSerialCode\":\"100003\",\"docSerialCode\":\"docSerialCode\",\"docSerialType\":\"-1\",\"productCode\":\"0058160322\",\"productName\":\"productName\",\"thrCatType\":\"1\",\"fygbmc\":\"bbb\",\"fygbbm\":\"334\",\"mgbz\":\"K74.602 ,\",\"reimLevel\":\"3\",\"outHospTakMedicine\":\"1\",\"unitPrice\":\"1\",\"pnumber\":\"5\",\"amount\":\"77\",\"unit\":\"ke\",\"spec\":\"\",\"medDays\":\"\",\"dosage\":\"\",\"frequency\":\"\",\"cardNum\":\"\",\"outYardSign\":\"0\",\"chargSign\":\"0\",\"serviceDate\":\"2017-11-13 02:00:00\",\"hospDeptCode\":\"hospDeptCode\",\"hospDeptName\":\"hospDeptName\",\"physicianCode\":\"\",\"physicianName\":\"\",\"medInsCost\":\"2340.22\",\"payCost\":\"2342.33\",\"selfCost\":\"23423.33\",\"detailOperationType\":\"1\"}]}}";

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("jsonData", jsonData);

		String result = postRequest(url, jsonData);
		System.out.println("result:" + result);

	}

	public static String postRequest(String url, String param)
			throws ClientProtocolException, IOException {

		CloseableHttpClient client = HttpClients.createDefault();

		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Content-Type", "application/json;charset=UTF-8");

//		Gson gson = new Gson();
//		String parameter = gson.toJson(param);

		StringEntity se = new StringEntity(param,Charset.forName("utf-8"));
		se.setContentType(CONTENT_TYPE_TEXT_JSON);
		se.setContentEncoding("utf-8");
		httpPost.setEntity(se);

		CloseableHttpResponse response = client.execute(httpPost);
		HttpEntity entity =  response.getEntity();
		String result = EntityUtils.toString(entity, "UTF-8");

		return result;

	}
}
