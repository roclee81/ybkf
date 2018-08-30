package com.shuxin.commons.utils;

import java.util.Collection;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.springframework.cache.ehcache.EhCacheCacheManager;
	
import com.shuxin.model.User;
import com.shuxin.model.vo.UserVo;
import com.shuxin.service.IUserService;

public class ShiroHelper {
	private final static Logger log = LogManager.getLogger(ShiroHelper.class);

	private static IUserService userService;
	private static EhCacheCacheManager cacheManager;
	private static SessionDAO sessionDAO;
	
	private static String specialchar = "shiro_session_user_";
	/**
	 * 把user放到cache中
	 * 
	 * @param user
	 */
	public static void setUser(User user) {
		cacheManager.getCache("halfHour").put(specialchar+user.getUserName(), user);
	}

	/**
	 * 清除当前用户的缓存
	 */
	public static void clearCurrentUserCache() {
		if (hasAuthenticated()) {
			cacheManager.getCache("halfHour").evict(specialchar+getCurrentUsername());
		}
	}

	/**
	 * 从cache拿当前user
	 * 
	 * @return
	 */
	public static User getCurrentUser() {
		if (!hasAuthenticated()) {
			return null;
		}
		User user = cacheManager.getCache("halfHour").get(specialchar+getCurrentUsername(), User.class); 
		
		try {
			if (null == user) {
	            UserVo uservo = new UserVo();
	            uservo.setUserName(getCurrentUsername());
	            List<User> uvlist = userService.selectByLoginName(uservo);
				ShiroHelper.setUser(uvlist.get(0));
			}
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 获得当前用户名
	 * 
	 * @return
	 */
	public static String getCurrentUsername() {
		Subject subject = getSubject();
		PrincipalCollection collection = subject.getPrincipals();
		if (null != collection && !collection.isEmpty()) {
			return (String) collection.iterator().next();
		}
		return null;
	}

	/**
	 * 
	 * @return
	 */
	public static Session getSession() {
		return SecurityUtils.getSubject().getSession();
	}

	/**
	 * 
	 * @return
	 */
	public static String getSessionId() {
		Session session = getSession();
		if (null == session) {
			return null;
		}
		return getSession().getId().toString();
	}
	
	/**
	 * @param username
	 * @return
	 */
	public static Session getSessionByUsername(String username){
		Collection<Session> sessions = sessionDAO.getActiveSessions();
		for(Session session : sessions){
			if(null != session && StringUtils.equals(String.valueOf(session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY)), username)){
				return session;
			}
		}
		return null;
	}
	
	/**
	 * 判断当前用户是否已通过认证
	 * @return
	 */
	public static boolean hasAuthenticated() {
		return getSubject().isAuthenticated();
	}

	private static Subject getSubject() {
		return SecurityUtils.getSubject();
	}

	/**
	 * @param userService
	 * @param currentUserMemcacheService
	 * @param sessionDAO
	 */
	public static void initStaticField(IUserService userService,EhCacheCacheManager cacheManager,SessionDAO sessionDAO){
		ShiroHelper.userService = userService;
		ShiroHelper.cacheManager = cacheManager;
		ShiroHelper.sessionDAO = sessionDAO;
	}
}
