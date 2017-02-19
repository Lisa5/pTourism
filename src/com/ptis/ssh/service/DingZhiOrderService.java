package com.ptis.ssh.service;

import java.util.List;

import com.ptis.ssh.entities.DingZhiOrder;

public interface DingZhiOrderService {
public abstract void SaveOrUpdate(DingZhiOrder dingZhiOrder);
public abstract List<DingZhiOrder> findOrderByUserId(int userId);
}
