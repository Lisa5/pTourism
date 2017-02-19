package com.ptis.ssh.service;

import java.util.List;
import com.ptis.ssh.entities.UserOrder;

public interface OrderService {
	
 public abstract List<UserOrder> getOrderByUserId(int userId);
 
 public abstract void saveOrder(UserOrder order);
} 
