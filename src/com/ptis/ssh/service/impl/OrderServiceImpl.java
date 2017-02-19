package com.ptis.ssh.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.ptis.ssh.dao.OrderDao;
import com.ptis.ssh.entities.UserOrder;
import com.ptis.ssh.service.OrderService;

public class OrderServiceImpl implements OrderService {

	private OrderDao orderDao;
	
	/**
	 * 查询用户订单
	 */
    @Transactional
	public List<UserOrder> getOrderByUserId(int userId) {	
		return orderDao.FindOrderByUserId(userId);
	}
    /**
     * 保存订单
     */
    @Transactional
    public void saveOrder(UserOrder order) {
		orderDao.saveOrder(order);
	}

	public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}


	
}
