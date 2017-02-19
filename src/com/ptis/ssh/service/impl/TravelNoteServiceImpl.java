package com.ptis.ssh.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.ptis.ssh.dao.TravelNoteDao;
import com.ptis.ssh.entities.TravelNote;
import com.ptis.ssh.service.TravelNoteService;

public class TravelNoteServiceImpl implements TravelNoteService {
	
	private TravelNoteDao travelNoteDao;
	
	public void setTravelNoteDao(TravelNoteDao travelNoteDao) {
		this.travelNoteDao = travelNoteDao;
	}
	
	@Transactional 	
	public void saveNote(TravelNote travelNote) {
		travelNoteDao.saveNote(travelNote);
	}
	

	@Transactional 
	public List<TravelNote> getNoteList() {
		return travelNoteDao.getNoteList();
	}
	
	@Transactional 
	public int getAllRowCount() {
      return travelNoteDao.getAllRowCount();
	}
	
	@Transactional 
    public List<TravelNote> queryForPage(int offset,int length ){	  
		return travelNoteDao.queryForPage(offset, length);
	}

	
}
