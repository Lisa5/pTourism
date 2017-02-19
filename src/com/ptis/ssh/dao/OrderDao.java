package com.ptis.ssh.dao;

import java.util.List;

import com.ptis.ssh.entities.UserOrder;

public interface OrderDao {
	/**
	 * 查询个人订单
	 * @param userId 用户Id
	 * @return 订单列表
	 */
	public abstract List<UserOrder> FindOrderByUserId(int userId);
	
	public abstract void saveOrder(UserOrder order);

}
