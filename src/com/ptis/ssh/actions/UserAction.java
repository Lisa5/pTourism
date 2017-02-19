package com.ptis.ssh.actions;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.ptis.ssh.dao.UserDao;
import com.ptis.ssh.entities.User;
import com.ptis.ssh.service.UserService;
import com.ptis.ssh.service.impl.UserServiceImpl;

public class UserAction extends ActionSupport implements RequestAware,
		ModelDriven<User>, Preparable {

	private static final long serialVersionUID = 1L;

	/**
	 * 错误信息返回！
	 */
	Map<String, String> errorInfo = new HashMap<String, String>();

	public Map<String, String> getErrorInfo() {
		return errorInfo;
	}

	public void setErrorInfo(Map<String, String> errorInfo) {
		this.errorInfo = errorInfo;
	}

	@Resource
	private UserDao userDao;

	@Resource
	private UserService userService = new UserServiceImpl();

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}

	private User user;
	private String userPwd2;
    private String userName;
    public void setUserName(String userName) {
		this.userName = userName;
	}
    @SuppressWarnings("unused")
	private String time;
    public void setTime(String time) {
		this.time = time;
	}
	private int userId=1;
    private String userEmail;
    public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
    
    private Map<String, Object> request;

	/**
	 * 注册用户
	 **/
	public String Register() {
		if(user.getUserName()==null||user.getUserName().equals("")){
			String error = "用户名为空！";
			errorInfo.put("nameNull", error);
		//	return INPUT;
		}
		if(user.getUserPwd()==null||user.getUserPwd().equals("")){
			String error = "密码为空！";
			errorInfo.put("pwdNull", error);
			//return INPUT;
		}
		if(userPwd2==null||userPwd2.equals(""))
		{
			String error = "确认密码错误！";
			errorInfo.put("pwd2Null", error);
		//return INPUT;
		}
		if(user.getUserEmail()==null||user.getUserEmail().equals("")){
			String error = "邮箱为空！";
			errorInfo.put("emailNull", error);
			//return INPUT;
		}
		if(user.getUserProfessional()==null||user.getUserProfessional().equals("")){
			String error = "职业类型不能为空！";
			errorInfo.put("proNull", error);
			//return INPUT;
		}
		if (!userService.IsAddUser(user.getUserName())||user.getUserName()==null||user.getUserName().equals("")) {
			String error = "注册失败！";
			request.put("userInfo", user);
			errorInfo.put("register", error);
			return INPUT;
		} else {
			String error = "注册成功！";
			errorInfo.put("register", error);
			user.setRegisterTime(new Date());
			userService.SaveOrUpdateUser(user);
			request.put("userInfo", user);
			return SUCCESS;
		}
	}

	/**
	 * 验证用户名是否可用
	 * @throws UnsupportedEncodingException 
	 */
	public String valiadteUserName() throws UnsupportedEncodingException {
		if (userService.IsAddUser(userName)) {
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));		
		}
		else{
			inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
		}
		return "ajax-success";
	}
/**
 * 邮箱验证
 * @param email
 * @return
 * @throws UnsupportedEncodingException 
 */
	public  String checkEmail() throws UnsupportedEncodingException{
		if (userService.checkEmial(userEmail)) {
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));		
		}
		else{
			inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
		}
		return "ajax-success";
    }
	/**
	 * 用户登录
	 **/
	public String Login() {
		String isLogin = userService.IsLogin(user.getUserName(),
				user.getUserPwd());
		
		if (isLogin.equals("Success")) {
			String success = "登陆成功";
			errorInfo.put("loginsuccess", success);
			User loginUser=userService.getLoginUser(user.getUserName(),user.getUserPwd());
			//request.put("loginUser", loginUser);
			//用户登录后将登陆信息存放于session中
			ActionContext.getContext().getSession().put("user", loginUser);
			ActionContext.getContext().getSession().put("userName", loginUser.getUserName());
			return "loginsuccess";
		} else {
			String error = "用户名或密码错误！";
			errorInfo.put("loginfailed", error);
			return "loginfailed";
		}
	}
  
	/**
	 * 注销
	 * @return
	 */
	public String logOut(){
		ActionContext.getContext().getSession().remove("user");
		return "logout";
	}
	/**
	 * 用户资料
	 * @return
	 */
	public String getUserInfo(){	
		request.put("UserInfo", userService.getUserByUserId(userId));
		return "userinfo";
	}
	
	public String registerInput() {
		return "register";
	}

	public String loginInput() {
		return "login";
	}

	@Override
	public void prepare() throws Exception {
	}

	public User getModel() {
		if (user == null) {
			user = new User();
		}
		return user;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public String validataUserName() throws UnsupportedEncodingException {

		if (userService.userNameIsValid(user.getUserName())) {
			System.out.println("are you coming");
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} else {
			inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
		}
		return "ajax-success";
	}

	public String getUserPwd2() {
		return userPwd2;
	}

	public void setUserPwd2(String userPwd2) {
		this.userPwd2 = userPwd2;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

}
