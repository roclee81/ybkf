package com.shuxin.commons.aop;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.shuxin.commons.dataSource.DataSourceContextHolder;

/**
 * spring AOP代理类 医保监控系统的数据源来自多台服务需跨库处理 此类用于业务方法调用之前的数据源切换
 */
@Component
@Aspect
public class CrossLibraryAop {

	private final static Log log = LogFactory.getLog(CrossLibraryAop.class);
	
	// 配置切入点,该方法无方法体,主要为方便同类中其他方法使用此处配置的切入点
	@Pointcut("execution(* com.shuxin.controller..*.*(..))")
	public void aspect() {
	}

	/*
	 * 配置前置通知,使用在方法aspect()上注册的切入点 同时接受JoinPoint切入点对象,可以没有该参数
	 */
	@Before("aspect()")
	public void before(JoinPoint joinPoint) {
		DataSourceContextHolder.clearDbType();
		Object[] objects = joinPoint.getArgs();
		boolean flag = false;
		for (Object object : objects) {
			if("to_64".equals(object)){
				flag = true;
			}
		}
		if(flag){
			DataSourceContextHolder.setDbType("ds_kbms");
		}
	}

	// 配置后置通知,使用在方法aspect()上注册的切入点
	@After("aspect()")
	public void after(JoinPoint joinPoint) {
		DataSourceContextHolder.clearDbType();
	}

	// 配置抛出异常后通知,使用在方法aspect()上注册的切入点
	@AfterThrowing(pointcut = "aspect()", throwing = "ex")
	public void afterThrow(JoinPoint joinPoint, Exception ex) {
		DataSourceContextHolder.clearDbType();
	}
}
