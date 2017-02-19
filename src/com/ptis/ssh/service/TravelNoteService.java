package com.ptis.ssh.service;

import java.util.List;

import com.ptis.ssh.entities.TravelNote;

public interface TravelNoteService {
	public abstract void saveNote(TravelNote travelNote);
	
    public abstract List<TravelNote> getNoteList() ;
    
    public abstract int getAllRowCount();
    
    public abstract List<TravelNote> queryForPage(int offset,int length);
}
