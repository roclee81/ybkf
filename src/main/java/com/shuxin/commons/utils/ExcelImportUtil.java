package com.shuxin.commons.utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.shuxin.model.DepartmentPlan;

/**
 * 实现通过excel导入数据
 * 
 * @author admin
 *
 */
public class ExcelImportUtil {
	
	/**
	 * 系统配置科室预算分配数据实现导入
	 * @param xlsPath
	 * @return
	 * @throws IOException
	 */
	public static List<DepartmentPlan> loadScoreInfo(String xlsPath,String cblxbm,String syear,String qy) throws IOException {
		List<DepartmentPlan> dPlans = new ArrayList<DepartmentPlan>();
		FileInputStream fileIn = new FileInputStream(xlsPath);
		DepartmentPlan dPlan = null;
		// double 数据四舍五入
		DecimalFormat df1 = new DecimalFormat("######0");
		// double 不采用科学计数法
		DecimalFormat df2 = new DecimalFormat("###0.00");
		// 根据指定的文件输入流导入Excel从而产生Workbook对象
		Workbook wb0 = new HSSFWorkbook(fileIn);
		// 获取Excel文档中的第一个表单
		Sheet sht0 = wb0.getSheetAt(0);
		// 对Sheet中的每一行进行迭代
		for (Row r : sht0) {
			// 如果当前行的行号（从0开始）未达到4（第五行）则从新循环
			if (r.getRowNum() == 0) {
				continue;
			}
			 //取出当前行第1个单元格数据，并封装在info实体stuName属性上
			try {
				String ksbm = r.getCell(0).getStringCellValue();
				String ylzfyxe = df2.format(r.getCell(2).getNumericCellValue());
				String zyrc = df1.format(r.getCell(3).getNumericCellValue());
				String  zytsxd = df1.format(r.getCell(4).getNumericCellValue());
				String  jjxe = df2.format(r.getCell(5).getNumericCellValue());
				String  hzfdzbxe = String.format("%.2f", r.getCell(6).getNumericCellValue()*100);
				String  ylzfbxe = String.format("%.2f", r.getCell(7).getNumericCellValue()*100);
				String  zfbxe = String.format("%.2f", r.getCell(7).getNumericCellValue()*100);
				String  yzbxe = String.format("%.2f", r.getCell(7).getNumericCellValue()*100);
				String  jcjyzbxe = String.format("%.2f", r.getCell(7).getNumericCellValue()*100);
				String  zlzbxe = String.format("%.2f", r.getCell(7).getNumericCellValue()*100);
				String  hczbxe = String.format("%.2f", r.getCell(7).getNumericCellValue()*100);
				dPlan = new DepartmentPlan(syear, ksbm, cblxbm, jjxe, ylzfyxe, zfbxe, yzbxe, jcjyzbxe, zlzbxe, hczbxe, zytsxd, hzfdzbxe, ylzfbxe, zyrc, qy);
			} catch (IllegalStateException e) {
				
			}
			dPlans.add(dPlan);
		}
		fileIn.close();
		return dPlans;
	}
}
