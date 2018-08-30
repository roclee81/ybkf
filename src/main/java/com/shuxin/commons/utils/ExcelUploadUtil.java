package com.shuxin.commons.utils;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * 文件上传
 * @author admin
 *
 */
public class ExcelUploadUtil {
	
	 /**
	  * 上传文件到服务器
	  * @param request
	  * @param response
	  * @param path	：指定存储路径
	  */
	 public static void upload(HttpServletRequest request, HttpServletResponse response,
			 String path,Map<String, Object> condition){
			try {
	            ServletFileUpload upload=new ServletFileUpload(new DiskFileItemFactory());
	            List<FileItem> list=upload.parseRequest(request);
	            for(int i=0;i<list.size();i++){
	                FileItem fi=list.get(i);
	                boolean iden=fi.isFormField();
	                if(iden){
	                	condition.put(fi.getFieldName(), fi.getString());
	                	System.out.println(fi.getFieldName()+"     "+fi.getString());
	                }else{
	                	//处理文件
	                    //文件的文件名
	                    String name=fi.getName();////有的电脑得到的是文件名，有的电脑得到的是路径+文件名
	                    name=name.substring(name.lastIndexOf("\\")+1);//处理出现第二种“路径+文件名”做到各个电脑或浏览器都兼容该上传方式
	                    File f=new File(path);  
	                    fi.write(f);
	                }
	            }
	        } catch (FileUploadException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		}
}
