package com.shuxin.commons.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 数据封装 1.根据后台传递数据的格式转化成前端需要的数据形式 2.就医方式等查询条件相应编码与中文编码的转换
 * 
 * @author admin
 *
 */
public class DataEncapsulationUtils {

	/*
	 * currentMonth:当前月的数据 lastMonth：上一个月的数据 shareCost：当前月各种指标费用
	 */
	public static List<Map<String, Object>> comparecurrentMonth(Map<String, Object> currentMonth,
			Map<String, Object> lastMonth, Map<String, Object> shareCost) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		// 当前月指标 循环比较
		for (String in : currentMonth.keySet()) {
			Map<String, Object> newMap = new HashMap<String, Object>();
			String value = null;
			// 当前月的数据
			Object obj = currentMonth.get(in);
			float valueCurrent = Float.parseFloat(obj.toString());
			// 判断当前数据是否为占比
			if (in.contains("ZB")) {
				if (shareCost != null) {
					for (String cost : shareCost.keySet()) {
						if (in.contains(cost)) {
							value = shareCost.get(cost) + "/" + String.format("%.2f", valueCurrent * 100) + "%";
						}
					}
				} else {
					value = String.format("%.2f", valueCurrent * 100) + "%";
				}

			} else {
				value = obj.toString();
			}

			// 与上个月做比较
			if (lastMonth != null && Float.parseFloat(lastMonth.get(in).toString()) > 0) {
				Object obj1 = lastMonth.get(in);
				float valueLast = Float.parseFloat(obj1.toString());
				int flag;
				if ((valueCurrent - valueLast) > 0) {
					flag = 1;
				} else if ((valueCurrent - valueLast) < 0) {
					flag = -1;
				} else {
					// flag = 0; 当前月与上个月数值相等 且 上个月数据是大于0
					flag = 0;
				}
				String gain = String.format("%.2f", (Math.abs((valueCurrent - valueLast) * 100)) / valueLast) + "%";
				newMap.put("key", in);
				newMap.put("value", value);
				newMap.put("flag", flag);
				newMap.put("gain", gain);
			} else {
				newMap.put("key", in);
				newMap.put("value", value);
				newMap.put("flag", "none");
				newMap.put("gain", "none");
			}
			list.add(newMap);
		}
		return list;
	}

	public static String getJyfsBycode(String code) {
		switch (code) {
		case "11":
			return "普通门诊";
		case "13":
			return "门诊大病";
		case "15":
			return "异地门诊";
		case "21":
			return "普通住院";
		case "22":
			return "特殊病种住院";
		case "25":
			return "异地住院";
		case "51":
			return "生育门诊";
		case "52":
			return "生育住院";
		case "71":
			return "工伤门诊";
		case "72":
			return "工伤住院";
		default:
			return null;
		}
	}

	/**
	 * 
	 * @param map1
	 *            当前月数据
	 * @param map4
	 *            指标预算
	 * @return
	 */
	public static List<Map<String, Object>> compareDepartmentPlan(Map<String, Object> map1, Map<String, Object> map4) {
		map4.remove("ID");
		List<Map<String, Object>> list = new ArrayList<>();
		// 预算指标
		for (String Plankey : map4.keySet()) {
			Map<String, Object> newMap = new HashMap<String, Object>();
			String value = null;
			for (String key : map1.keySet()) {
				if (Plankey.equals(key)) {
					// 指标实际占比 为小数
					String trueValue = map1.get(key).toString();
					// z指标预算占比 为百分比预算
					value = map4.get(key).toString();
					// 实际占比高于预算 为1 否则为-1
					float dValue;
					if(key.equals("YLF")){
						// 医疗费非占比
						dValue = Float.parseFloat(trueValue) - Float.parseFloat(value);
					}else{
						dValue = Float.parseFloat(trueValue) * 100 - Float.parseFloat(value);
					}
					int flag;
					if (dValue > 0) {
						flag = 1;
					} else if (dValue < 0) {
						flag = -1;
					} else {
						flag = 0;
					}
					if (Float.parseFloat(value) == 0) {
						newMap.put("key", key);
						if (key.equals("YLF")) {
							newMap.put("value", value);
						} else {
							newMap.put("value", value + "%");
						}
						newMap.put("flag", "none");
						newMap.put("gain", "none");
					} else {
						// 相对浮动大小
						String gain = String.format("%.2f", (Math.abs(dValue)));
						newMap.put("key", key);
						if (key.equals("YLF")) {
							newMap.put("value", value);
						} else {
							newMap.put("value", value + "%");
						}
						newMap.put("flag", flag);
						newMap.put("gain", gain);
					}
				}
			}
			list.add(newMap);
		}
		return list;
	}

}
