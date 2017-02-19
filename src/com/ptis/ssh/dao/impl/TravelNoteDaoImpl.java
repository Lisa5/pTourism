package com.ptis.ssh.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.ptis.ssh.dao.BaseDao;
import com.ptis.ssh.dao.TravelNoteDao;
import com.ptis.ssh.entities.TravelNote;

public class TravelNoteDaoImpl extends BaseDao  implements TravelNoteDao {

	/**
	 * �����û��μ�
	 */
	public void saveNote(TravelNote travelNote) {
		getSession().save(travelNote);
	}

	/**
	 * ��ѯ�μ��б�
	 */
	@SuppressWarnings("unchecked")
	public List<TravelNote> getNoteList() {
		String hql = "FROM TravelNote";
		System.out.println("*********************"+getSession().createQuery(hql).list());
		return getSession().createQuery(hql).list();
	}
  
	/**
   * ��ѯ�ܼ�¼��
   */
	@SuppressWarnings("unchecked")
	public  int getAllRowCount(){
		String hql="FROM TravelNote";
		List<TravelNote>  travelNotes =  getSession().createQuery(hql).list();
		return travelNotes.size();
	}
	/**
	 * ��ҳ��ѯ
	 */
	@SuppressWarnings("unchecked")
	public List<TravelNote> queryForPage(final int offset,final int length){
		String hql="FROM TravelNote t order by t.travelNoteId";
		Query query= getSession().createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		List<TravelNote>  travelNotes =  query.list();
		return travelNotes;
	}
}
