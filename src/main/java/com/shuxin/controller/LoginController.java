package com.shuxin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.event.MenuListener;

import org.apache.ibatis.jdbc.Null;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuxin.commons.base.BaseController;
import com.shuxin.commons.csrf.CsrfToken;
import com.shuxin.commons.result.Tree;
import com.shuxin.commons.shiro.ShiroUser;
import com.shuxin.commons.utils.CaptchaUtils;
import com.shuxin.commons.utils.JsonUtils;
import com.shuxin.commons.utils.ShiroHelper;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.model.Menu;
import com.shuxin.model.User;
import com.shuxin.model.vo.UserVo;
import com.shuxin.service.IMenuService;
import com.shuxin.service.IUserService;

/**
 * @description：登录退出
 */
@Controller
public class LoginController extends BaseController {
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private HttpSession session;
	
    @Autowired
    private IMenuService menuService;
     
    /**
     * 首页
     *
     * @return
     */
  /*  @GetMapping("/")
    public String index() {
        return getFirstMenu();
    }*/

    /**
     * 首页
     *
     * @param model
     * @return
     */
    //@GetMapping("/index")
    public String index(Model model) {
    	 return "welcome"; 
    }

    /**
     * GET 登录
     * @return {String}
     */
    @GetMapping("/login")
    @CsrfToken(create = true)
    public String login() {
        if (SecurityUtils.getSubject().isAuthenticated()) {
           return getFirstMenu();
         ///   return "goindex";
        }
        //ShiroHelper.clearCurrentUserCache();
        return "login";
    }

    /**
     * POST 登录 shiro 写法
     *
     * @param username 用户名
     * @param password 密码
     * @return {Object}
     */
    @PostMapping("/login")
    @CsrfToken(remove = true)
    @ResponseBody
    public Object loginPost(HttpServletRequest request, String username, String password, String captcha, 
            @RequestParam(value = "rememberMe", defaultValue = "0") Integer rememberMe) {
        logger.info("POST请求登录");
        // 改为全部抛出异常，避免ajax csrf token被刷新
        if (StringUtils.isBlank(username)) {
        	return renderError("用户名不能为空");
            //throw new RuntimeException("用户名不能为空");
        }
        if (StringUtils.isBlank(password)) {
        	return renderError("密码不能为空");
            //throw new RuntimeException("密码不能为空");
        }
//        if (StringUtils.isBlank(captcha)) {
//            throw new RuntimeException("验证码不能为空");
//        }
//        if (!CaptchaUtils.validate(request, captcha)) {
//            throw new RuntimeException("验证码错误");
//        }
        Subject user = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        // 设置记住密码
        token.setRememberMe(1 == rememberMe);
        try {
            user.login(token);
            //User asd = ShiroHelper.getCurrentUser();
            return renderSuccess();
        } catch (UnknownAccountException e) {
        	return renderError("账号不存在");
            //throw new RuntimeException("账号不存在！", e);	
        } catch (DisabledAccountException e) {
        	return renderError("账号为启用");
        	
           // throw new RuntimeException("账号未启用！", e);
        } catch (IncorrectCredentialsException e) {
        	return renderError("密码错误");
        	//request.setAttribute("loginmsg", "err");
            //throw new RuntimeException("密码错误！", e);
        }  catch (ExcessiveAttemptsException e) {
        	return renderError("账号锁定十分钟");
        } catch (Throwable e) {
        	return renderError("未知错误");
           // throw new RuntimeException(e.getMessage(), e);
        }
    }

    /**
     * 未授权
     * @return {String}
     */
    @GetMapping("/unauth")
    public String unauth() {
        if (SecurityUtils.getSubject().isAuthenticated() == false) {
            return "redirect:/login";
        }
        return "unauth";
    }

    /**
     * 退出
     * @return {Result}
     */
    @PostMapping("/logout")
    @ResponseBody
    public Object logout() {
        logger.info("登出");
        Subject subject = SecurityUtils.getSubject();
        //ShiroHelper.clearCurrentUserCache();
        subject.logout();
        return renderSuccess();
    }

    /**
     * 
     * @return {Result}
     */
    /*@RequestMapping("/index1")
    public String goindex(String id){
        ShiroUser shiroUser = getShiroUser();
        List<Menu> menuList= null;
        int index = -1;
        menuList=menuService.selectMenuByUser(shiroUser);
        if(menuList==null || menuList.size()==0){
        	return "err";
        }
        for(Menu menu: menuList){
        	if(menu.getLevels()==1){
          	  index++;
            }
            if(menu.getId().equals(id)){
            	session.setAttribute("menu", JsonUtils.toJson(menuList));
                session.setAttribute("userName",shiroUser.getName());
                request.setAttribute("index", index);
            	return "admin/index2";
            }
        } 
        return "welcome";
    }*/
    /**
     * 
     * @return {Result}
     */
    @GetMapping("/index")
    public String goindex(){
        ShiroUser shiroUser = getShiroUser();
        List<Menu> menuList= null;
        menuList=menuService.selectMenuByUser(shiroUser);
        System.out.println(menuList);
        session.setAttribute("menu", JsonUtils.toJson(menuList));//将对象序列化成json字符串
//        List<Tree> list=menuService.selectTree(shiroUser);
        if(menuList==null || menuList.size()==0){
        	System.out.println("menuListIsNull");
        	return "err";
        }else{
        	session.setAttribute("menu", JsonUtils.toJson(menuList));
            session.setAttribute("userName",shiroUser.getName());
            request.setAttribute("index", 0);
        	return "admin/index2";
        }
        
    }
    
    public String getFirstMenu(){
    	ShiroUser shiroUser = getShiroUser();
    	List<Menu> menuList= null;
    	menuList=menuService.selectMenuByUser(shiroUser);    	
    	session.setAttribute("menu", JsonUtils.toJson(menuList));
//        List<Tree> list=menuService.selectTree(shiroUser);
    	if(menuList==null || menuList.size()==0){
    		return "err";
    	}
    	return "admin/index2";
    }
}
