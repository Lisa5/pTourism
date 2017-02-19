package com.ptis.ssh.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Component;

import com.ptis.ssh.dao.BaseDao;
import com.ptis.ssh.dao.UserDao;
import com.ptis.ssh.entities.User;

@Component("UserDao")
public class UserDaoImpl extends BaseDao implements UserDao {
//	@Resource
//	private HibernateTemplate us;
	//注册前判断用户名 是否已存在
	@SuppressWarnings("unchecked")  
	public  List<User>  FindUserByName(String userName){
//		if(userName.length()==0){
//			String hql="from User u";
//    		List<User> userList=getSession().createQuery(hql).list();
//    		return userList;
//    	//	List<User> userList=us.find("from User u");   		
//    	//	return userList;
//    	}
		
    	String hql="from User u where u.userName='"+userName+"'";
    	List<User> userList=getSession().createQuery(hql).list();
    	//List<User> userList=us.find("from User u where u.userName='"+userName+"'").toArray();   	
    	return userList;
	}

	/**
	 * 验证成功后向数据库添加user
	 */
	public void SaveOrUpdateUser(User user) {
		 getSession().saveOrUpdate(user); 
	}


	/**
	 * 根据用户输入判断用户是否存在
	 */
	public User CheckLoginUser(String userName,String userPwd) {
		String hql="from User u where u.userName=? and u.userPwd=?";
		User user=(User) getSession().createQuery(hql).setString(0, userName).setString(1, userPwd).uniqueResult();
		return user;
	}

	@Override
	public User getUserByUsername(String userName) {
			String hql = "FROM User e WHERE e.userName = ?";
			Query query = getSession().createQuery(hql).setString(0, userName);
			User user = (User) query.uniqueResult();
			return user;				
	}

	public User FindUserByUserId(int userId) {
		String hql = "FROM User e WHERE e.userId = ?";
		Query query = getSession().createQuery(hql).setLong(0, userId);
		User user = (User) query.uniqueResult();
		return user;
	}
	
	




}
