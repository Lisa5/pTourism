package com.ptis.ssh.service.impl;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.ptis.ssh.dao.UserDao;
import com.ptis.ssh.dao.impl.UserDaoImpl;
import com.ptis.ssh.entities.User;
import com.ptis.ssh.service.UserService;

public class UserServiceImpl implements UserService {

	@Resource
	private UserDao userDao = new UserDaoImpl();

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Transactional
	public boolean IsAddUser(String userName) {
		List<User> userList = userDao.FindUserByName(userName);
		if (userList.isEmpty()) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 添加用户
	 */
	@Transactional
	public void SaveOrUpdateUser(User user) {
		userDao.SaveOrUpdateUser(user);
	}

	@Transactional
	public String IsLogin(String userName, String userPwd) {
		User user = userDao.CheckLoginUser(userName, userPwd);
		if (user == null) {
			return "NotExit";
		} else {
		
			return "Success";
		}
	}
	
	/**
	 * 验证用户名是否可用
	 * 
	 */
	@Override
	public  boolean  userNameIsValid(String userName){
		return userDao.getUserByUsername(userName) ==null;
	}

	
	@Transactional
	public User getUserByUserId(int userId) {	
		return userDao.FindUserByUserId(userId);
	}
	

	@Transactional
	public User getLoginUser(String userName, String userPwd) {	
		return userDao.CheckLoginUser(userName, userPwd);
	}


	public boolean checkEmial(String email) {
		  boolean flag = false;
	        try{
	                String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
	                Pattern regex = Pattern.compile(check);
	                Matcher matcher = regex.matcher(email);
	                flag = matcher.matches();
	            }catch(Exception e){
	                flag = false;
	            }
	        return flag;
	}
}
