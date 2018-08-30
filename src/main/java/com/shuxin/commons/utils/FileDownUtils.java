package com.shuxin.commons.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
/**
 *文件的下载
 * @author summer
 *
 */
public class FileDownUtils {

	
/**
 * 	
 * @param url
 * @param filePath
 * @throws IOException
 */
public static void downloadFile(String url, String filePath) throws IOException	{
		URL theURL = new URL(url);
		URLConnection con = theURL.openConnection();
		String urlPath = con.getURL().getFile();
		String fileFullName = urlPath.substring(urlPath.lastIndexOf("/")+1);
		if(fileFullName !=null){
		byte[] buffer = new byte[4*1024];
		int read;
		String path = filePath + "/" +fileFullName;
		File fileFolder = new File(filePath);
		if(!fileFolder.exists()){
		fileFolder.mkdirs();
		}
		InputStream in = con.getInputStream();
		FileOutputStream os = new FileOutputStream(path);
		while((read = in.read(buffer)) > 0){
		os.write(buffer, 0, read);
		}
		os.close();
		in.close();
		}
		}

	
	
}
