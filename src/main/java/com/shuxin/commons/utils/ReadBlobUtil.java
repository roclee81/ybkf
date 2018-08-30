package com.shuxin.commons.utils;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Blob;

public class ReadBlobUtil {

	
	public static String readBlobToString(Blob blob) throws IOException, SQLException{
		
		int length = (int) blob.length();
		byte[] bs = blob.getBytes(1, length);
		String string  = new String(bs, "gbk");
		return string; 
	}
	
}
