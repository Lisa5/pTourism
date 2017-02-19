package com.ptis.ssh.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.ptis.ssh.dao.TourismDao;
import com.ptis.ssh.entities.Tourism;
import com.ptis.ssh.service.TourismService;

public class TourismServiceImpl implements TourismService{

	private TourismDao tourismDao;
	
    public void setTourismDao(TourismDao tourismDao) {
		this.tourismDao = tourismDao;
	}
    
	/**
	 * ��ȡ������Ϣ*/
    @Transactional
	public Tourism getTourismInfo(Integer tourismId) { 
		return tourismDao.FindTourismById(tourismId);
	}

    /**
     * ���ݾ������Ͳ�ѯ ��ҳ��ѯ
     */
    @Transactional
	public List<Tourism> getTourismListByType(Integer typeId,int offset, int length) {
    	return  tourismDao.FindTourismByType(typeId,offset,length);	
	}
    
    /**
     * ���ݹؼ������� ��ҳ
     */
    @Transactional
    public  List<Tourism> searchTourismByName(String key,int offset, int length){
    	return tourismDao.FindTourismByName(key,offset,length);
    }
  
    /**
     * �ܼ�¼��
     */
    @Transactional
	public int getAllRowCount(int type) {  	
		return tourismDao.getAllRowCount(type);
	}
    
    /**
     * �ܼ�¼��
     */
    @Transactional
	public int getAllRowCount(String key) {  	
		return tourismDao.getAllRowCount(key);
	}
    /**
     * ��ҳ��ѯ
     */
    @Transactional
	public List<Tourism> queryForPage(int offset, int length) {
		return tourismDao.queryForPage(offset, length);
	}

    /**
	 * ���ݾ��������յ��ѯ
	 */
    @Transactional
	public List<Tourism> getTourismByplace(String startPlace, String endPlace) {
		return tourismDao.FindTourismByplace(startPlace, endPlace);
	}

    @Transactional
	public List<Tourism> getTourismByName(String key) {
		return tourismDao.FindTourismByName(key);
	}


  
}
