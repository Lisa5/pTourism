package com.ptis.ssh.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.ptis.ssh.dao.DingZhiOrderDao;
import com.ptis.ssh.dao.impl.DingZhiOrderDaoImpl;
import com.ptis.ssh.entities.DingZhiOrder;
import com.ptis.ssh.service.DingZhiOrderService;

public class DingZhiOrderServiceImpl implements DingZhiOrderService {

	private DingZhiOrderDao dingZhiOrderDao = new DingZhiOrderDaoImpl();

	public void setDingZhiOrderDao(DingZhiOrderDao dingZhiOrderDao) {
		this.dingZhiOrderDao = dingZhiOrderDao;
	}

	@Transactional
	public void SaveOrUpdate(DingZhiOrder dingZhiOrder) {
		dingZhiOrderDao.Save(dingZhiOrder);
	}

	@Transactional
	public List<DingZhiOrder> findOrderByUserId(int userId) {	
		return dingZhiOrderDao.FindOrderByUserId(userId);
	}

}
