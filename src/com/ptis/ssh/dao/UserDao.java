package com.ptis.ssh.dao;

import java.util.List;

import com.ptis.ssh.entities.User;

public interface UserDao {
 
	
	public abstract List<User>  FindUserByName(String userName);
	
	/**
	 * ����û�
	 */
	public abstract void SaveOrUpdateUser(User user);
	
	public abstract User CheckLoginUser(String userName,String userPwd);
	
	/**
	 *�ж��û����Ƿ���� 
	 */
	public abstract User getUserByUsername(String userName);
	
	public abstract User FindUserByUserId(int userId);
}



