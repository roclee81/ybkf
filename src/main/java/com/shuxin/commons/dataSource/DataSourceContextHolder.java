package com.shuxin.commons.dataSource;

/**
 * 用来切换多数据源的工具类
 * @author admin
 *
 */
public class DataSourceContextHolder {
	private static final ThreadLocal<String> contextHolder = new ThreadLocal<String>();  
	  
    public static void setDbType(String dbType) {  
           contextHolder.set(dbType);  
    }  
 
    public static String getDbType() {  
           return ((String) contextHolder.get());  
    }  
 
    public static void clearDbType() {  
           contextHolder.remove();  
    } 
}
