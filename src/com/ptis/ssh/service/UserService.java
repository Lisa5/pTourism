package com.ptis.ssh.service;

import com.ptis.ssh.entities.User;

public interface UserService {

	public abstract boolean IsAddUser(String userName);
	
	public abstract void SaveOrUpdateUser(User user);
	
	public abstract String IsLogin(String userName,String userPwd);
	
	public abstract boolean userNameIsValid(String userName);
	
	public abstract User getUserByUserId(int userId);
	
	public abstract User getLoginUser(String userName,String userPwd);
	
	public abstract boolean checkEmial(String email);
}
