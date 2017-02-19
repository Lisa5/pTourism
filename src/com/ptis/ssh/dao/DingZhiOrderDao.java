package com.ptis.ssh.dao;

import java.util.List;

import com.ptis.ssh.entities.DingZhiOrder;

public interface DingZhiOrderDao {
	public abstract void Save(DingZhiOrder dingZhiOrder);
	public abstract List<DingZhiOrder> FindOrderByUserId(int userId);
}
