package com.shuxin.commons.utils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;

import net.sf.jxls.transformer.XLSTransformer;

public class ExcelUtil {
	
	private static final Logger logger = LogManager.getLogger(ExcelUtil.class);
	
	/**
	 * 导出excle文件
	 * @param response
	 * @param tempFileName
	 * @param exportFileName
	 * @param map
	 */
	public static void exportExcel(HttpServletResponse response,String tempFileName,
			String exportFileName,Map<String, Object> map)
	{
		InputStream in = null;
		OutputStream out = null;
		try
		{
			String templateFileName = Thread.currentThread()
					.getContextClassLoader().getResource("").getPath()
					+ "excleTemplate/"+tempFileName+ ".xls";
			String destFileName = java.net.URLEncoder.encode(exportFileName, "UTF-8")
					+ ".xls";
			XLSTransformer transformer = new XLSTransformer();
			
			// 设置响应
			response.setHeader("Content-Disposition", "attachment;filename="
					+ destFileName);
			response.setContentType("application/vnd.ms-excel");
			
			in = new BufferedInputStream(new FileInputStream(templateFileName));
			Workbook workbook = transformer.transformXLS(in, map);
			out = response.getOutputStream();
			// 将内容写入输出流并把缓存的内容全部发出去
			workbook.write(out);
			out.flush();
		}
		catch(Exception e)
		{
			logger.error(e.getMessage(), e);
		}
		finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					logger.error(e.getMessage(), e);
				}
			}
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
					logger.error(e.getMessage(), e);
				}
			}
		}
	}
	
	/**
	 * 用于封装同一Excel文件多个不同模板的sheet页
	 * @param response
	 * @param head	：标题
	 * @param exportFileName：导出文件名
	 * @param listSheetNames：sheet页的名称
	 * @param titles:每一页的起始列名
	 * @param infos：主要的数据信息的key值
	 * @param objects：主要数据信息
	 * @param objectNames：sheet页对应的key值
	 */
	public static void exportExcelWithSheets(HttpServletResponse response,String head,
			String exportFileName,List<String> listSheetNames,List<String[]> titles,List<String[]> infos,
			Map<String, List<Map<String, Object>>> objects ,List<String> objectNames,boolean flag)
	{
		InputStream in = null;
		OutputStream out = null;
		try
		{
			String destFileName = java.net.URLEncoder.encode(exportFileName, "UTF-8")
					+ ".xls";
			
			// 设置响应
			response.setHeader("Content-Disposition", "attachment;filename="
					+ destFileName);
			response.setContentType("application/vnd.ms-excel");
			
			// 创建工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			
			// 单元格样式设置
			HSSFCellStyle setBorder = workbook.createCellStyle();
			setBorder.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			setBorder.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			
			// 创建工作表  设置两张工作表  创建每张工作表的第二行  ：第二行为title
			HSSFCell cell = null;
			HSSFRow row = null;
			int SheetNum = 0;
			for (String name : listSheetNames) {
				// 创建sheet
				workbook.createSheet(name);
				// 表头
				String[] title = titles.get(SheetNum);
				// 标题    
				row = workbook.getSheet(name).createRow(0);
				cell = row.createCell(0);
				// 设置行高
				HSSFCellStyle style = workbook.createCellStyle();
				style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
				style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
				row.setHeightInPoints(22);
				HSSFFont font=workbook.createFont();
				font.setFontHeightInPoints((short)14);
				style.setFont(font);
				cell.setCellValue(head);
				cell.setCellStyle(style);
				// 合并单元格
				CellRangeAddress range = new CellRangeAddress(0, 0, 0, title.length-1);   
				workbook.getSheet(name).addMergedRegion(range);
				
				// 插入title数据  一张 sheet 对应 一条 String[] title
				// 创建 row
				workbook.getSheet(name).createRow(1);
				// 获取 row
				row = workbook.getSheet(name).getRow(1);
				for (int j = 0; j < title.length; j++) {
					cell = row.createCell(j);
					cell.setCellValue(title[j]);
					cell.setCellStyle(setBorder);
				}
				// 设置普通单元格
				// 获取对应sheet 页的name
				String objName = objectNames.get(0);
				// 获取对应sheet页的数据
				List<Map<String, Object>> result = objects.get(objName);
				// 行数
				int rowNum = 0;
				for (Map<String, Object> map : result) {
					String[] info = infos.get(SheetNum);
					// 第三行起 为主要的数据
					workbook.getSheet(name).createRow(rowNum+2);
					row = workbook.getSheet(name).getRow(rowNum+2);
					for(int k=0;k<info.length;k++){
						cell = row.createCell(k);
						String textVal = null;
						if(map.get(info[k])!=null){
							textVal = String.valueOf(map.get(info[k]));
						}else{
							textVal = null;
						}
						cell.setCellValue(textVal);
						cell.setCellStyle(setBorder);
						
						// 设置单元格宽度
						workbook.getSheet(name).setColumnWidth(k,3000);
					} 
					rowNum++;
				}
				SheetNum++;
			}
			
			if(flag){
				combineRow(objects.get("num"),workbook );
			}
			
			out = response.getOutputStream();
			// 将内容写入输出流并把缓存的内容全部发出去
			workbook.write(out);
			out.flush();
		}
		catch(Exception e)
		{
			logger.error(e.getMessage(), e);
		}
		finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					logger.error(e.getMessage(), e);
				}
			}
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
					logger.error(e.getMessage(), e);
				}
			}
		}
	}
	
	// 合并内容相同的行  
	public static void combineRow(List<Map<String, Object>> list,HSSFWorkbook workbook){
		int value = 0;
		int from = 2;
		int to = 0;
		for(int i=0;i<list.size();i++){
			value = Integer.parseInt(list.get(i).get("COU").toString());
			if(i==0){
				to+=value+1;
			}else{
				to+=value;
			}
			// 合并单元格
			// 参数：起始行号，终止行号， 起始列号，终止列号
			CellRangeAddress range;
			range = new CellRangeAddress(from, to, 0, 0);
			workbook.getSheetAt(0).addMergedRegion(range);
			from = 1+to;
		}
		
	}
	

}
