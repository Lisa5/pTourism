package com.ptis.ssh.dao;

import java.util.List;

import com.ptis.ssh.entities.User;

public interface UserDao {
 
	
	public abstract List<User>  FindUserByName(String userName);
	
	/**
	 * 添加用户
	 */
	public abstract void SaveOrUpdateUser(User user);
	
	public abstract User CheckLoginUser(String userName,String userPwd);
	
	/**
	 *判断用户名是否可用 
	 */
	public abstract User getUserByUsername(String userName);
	
	public abstract User FindUserByUserId(int userId);
}



