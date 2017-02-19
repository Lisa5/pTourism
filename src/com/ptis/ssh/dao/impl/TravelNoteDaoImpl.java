package com.ptis.ssh.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.ptis.ssh.dao.BaseDao;
import com.ptis.ssh.dao.TravelNoteDao;
import com.ptis.ssh.entities.TravelNote;

public class TravelNoteDaoImpl extends BaseDao  implements TravelNoteDao {

	/**
	 * 保存用户游记
	 */
	public void saveNote(TravelNote travelNote) {
		getSession().save(travelNote);
	}

	/**
	 * 查询游记列表
	 */
	@SuppressWarnings("unchecked")
	public List<TravelNote> getNoteList() {
		String hql = "FROM TravelNote";
		System.out.println("*********************"+getSession().createQuery(hql).list());
		return getSession().createQuery(hql).list();
	}
  
	/**
   * 查询总记录数
   */
	@SuppressWarnings("unchecked")
	public  int getAllRowCount(){
		String hql="FROM TravelNote";
		List<TravelNote>  travelNotes =  getSession().createQuery(hql).list();
		return travelNotes.size();
	}
	/**
	 * 分页查询
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
