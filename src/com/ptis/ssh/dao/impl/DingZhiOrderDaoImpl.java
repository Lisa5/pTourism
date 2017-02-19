package com.ptis.ssh.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.ptis.ssh.dao.BaseDao;
import com.ptis.ssh.dao.DingZhiOrderDao;
import com.ptis.ssh.entities.DingZhiOrder;

@Component("DingZhiOrderDao")
public class DingZhiOrderDaoImpl  extends BaseDao implements DingZhiOrderDao{

	public void Save(DingZhiOrder dingZhiOrder) {
     getSession().saveOrUpdate(dingZhiOrder);
	}


	@SuppressWarnings("unchecked")
	public List<DingZhiOrder> FindOrderByUserId(int userId) {
       String hql ="From DingZhiOrder d where d.userId="+userId;
		return getSession().createQuery(hql).list();
	}

}
