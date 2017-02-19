package com.ptis.ssh.dao;

import java.util.List;

import com.ptis.ssh.entities.TravelNote;

public interface TravelNoteDao {
	
	public abstract void saveNote(TravelNote travelNote);

	public abstract List<TravelNote> getNoteList();
	
	public abstract  int getAllRowCount();
	
	public List<TravelNote> queryForPage(final int offset,final int length);
	
	
}
