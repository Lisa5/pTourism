package com.ptis.ssh.dao;

import java.util.List;

import com.ptis.ssh.entities.UserOrder;

public interface OrderDao {
	/**
	 * ��ѯ���˶���
	 * @param userId �û�Id
	 * @return �����б�
	 */
	public abstract List<UserOrder> FindOrderByUserId(int userId);
	
	public abstract void saveOrder(UserOrder order);

}
