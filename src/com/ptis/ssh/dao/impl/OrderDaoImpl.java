package com.ptis.ssh.dao.impl;

import java.util.List;

import com.ptis.ssh.dao.BaseDao;
import com.ptis.ssh.dao.OrderDao;
import com.ptis.ssh.entities.UserOrder;

public class OrderDaoImpl extends BaseDao implements OrderDao {

	@SuppressWarnings("unchecked")
	public List<UserOrder> FindOrderByUserId(int userId) {
		String hql = "From UserOrder u  LEFT OUTER JOIN FETCH u.tourism  where u.userId="+userId;
		return getSession().createQuery(hql).list();
	}
	public void saveOrder(UserOrder order) {
		getSession().save(order);
	}

}
