package com.ptis.ssh.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.ptis.ssh.dao.BaseDao;
import com.ptis.ssh.dao.TourismDao;
import com.ptis.ssh.entities.Tourism;


public class TourismDaoImpl  extends BaseDao implements TourismDao {
	/**
	 * ���ݾ���Id��ѯ
	 */
	public Tourism FindTourismById(Integer tourismId) {
	   String hql="From Tourism t where t.tourismId="+tourismId;
	   Tourism  tourism=(Tourism) getSession().createQuery(hql).uniqueResult();
		return tourism;
	}
	/**
	 * ���ݾ������Ͳ�ѯ���� ��ҳ��ѯ
	 */
	@SuppressWarnings("unchecked")
	public List<Tourism> FindTourismByType(Integer typeId,int offset, int length) {
		String hql="From Tourism t where t.typeId="+typeId;
		Query query =getSession().createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		List<Tourism> tourisms = query.list();
		return tourisms;
	}

	/**
	 * ��������Ĺؼ��ֲ�ѯ ��ҳ
	 */
	@SuppressWarnings("unchecked")
	public  List<Tourism> FindTourismByName(String key,int offset, int length){
		String hql = "From Tourism t where t.tourismTitle like '%"+key+"%'";
		Query query =getSession().createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(length);	
		List<Tourism> tourisms = query.list();
		return tourisms;
	}
  
	/**
	 * ��ҳ��ѯ
	 */
	@SuppressWarnings("unchecked")
	public List<Tourism> queryForPage(int offset, int length) {
		String hql = "From Tourism t order by t.tourismId";
		Query query =getSession().createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		List<Tourism> tourisms = query.list();
		return tourisms;
	}

	/**
	 * ��ȡ��ͬ���;���ļ�¼����
	 */
	public int getAllRowCount(int type) {
		String hql = "From Tourism t where t.typeId="+type;
		return  getSession().createQuery(hql).list().size();
	}
	
	/**
	 *��¼����
	 */
	public int getAllRowCount(String key) {
		String hql = "From Tourism t where t.tourismTitle like '%"+key+"%'";
		return  getSession().createQuery(hql).list().size();
	}
   
	/**
	 * ���ݾ��������յ��ѯ
	 */
	@SuppressWarnings("unchecked")
	public List<Tourism> FindTourismByplace(String startPlace, String endPlace) {
		String hql = "From Tourism t where t.departurePlace like '%"+startPlace+"%' and t.destinationPlace like '%"+endPlace+"%'";
		return  getSession().createQuery(hql).list();
	}

	@SuppressWarnings("unchecked")
	public List<Tourism> FindTourismByName(String key) {
		String hql = "From Tourism t where t.tourismTitle like '%"+key+"%'";
		return getSession().createQuery(hql).list();
	}
}
