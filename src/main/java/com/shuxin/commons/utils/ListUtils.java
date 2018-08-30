package com.shuxin.commons.utils;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.collections.CollectionUtils;

/**
 * 描述:   List 集合特殊工具类
 * 详细:  
 * 类名:   ListUtils
 * 所属包: com.shuxin.commons.utils
 * 作者:   LiuYang
 * 版本:   1.0
 * 日期 :   2017年10月27日 上午9:02:38
 */
public class ListUtils {
    
    /**
     * 描述:  将  list 中对象的一个 filed 属性提取出来组成新 List 集合
     * 名称:  getFiledList
     * 作者 :  LiuYang
     * 时间 :  2017年10月27日 上午9:17:16  
     * 参数:  @param list
     * 参数:  @param filed
     * 参数:  @return     
     */
    public static List getFiledList(List list, String filed) {
        if (CollectionUtils.isEmpty(list))
            return null;
        List filedList = new ArrayList();
        try {

            for (Object obj : list) {
                Class clazz = obj.getClass();// 获取集合中的对象类型
                Field[] fds = clazz.getDeclaredFields();// 获取他的字段数组
                for (Field field : fds) {// 遍历该数组
                    String fdname = field.getName();// 得到字段名，

                    Method method = clazz.getMethod("get" + change(fdname),
                            null);// 根据字段名找到对应的get方法，null表示无参数

                    if (null != method && filed.equals(fdname)) {
                        Object val = method.invoke(obj, null);
                        if (val !=null) {
                            filedList.add( Integer.valueOf((String)val).intValue());
                        }
                    }

                }
            }

        } catch (SecurityException e) {
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        return filedList;
    }

    /**
     * @param src
     *            源字符串
     * @return 字符串，将src的第一个字母转换为大写，src为空时返回null
     */
    public static String change(String src) {
        if (src != null) {
            StringBuffer sb = new StringBuffer(src);
            sb.setCharAt(0, Character.toUpperCase(sb.charAt(0)));
            return sb.toString();
        } else {
            return null;
        }
    }

}
