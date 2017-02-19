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
	 * 获取景点信息*/
    @Transactional
	public Tourism getTourismInfo(Integer tourismId) { 
		return tourismDao.FindTourismById(tourismId);
	}

    /**
     * 根据景点类型查询 分页查询
     */
    @Transactional
	public List<Tourism> getTourismListByType(Integer typeId,int offset, int length) {
    	return  tourismDao.FindTourismByType(typeId,offset,length);	
	}
    
    /**
     * 根据关键字搜索 分页
     */
    @Transactional
    public  List<Tourism> searchTourismByName(String key,int offset, int length){
    	return tourismDao.FindTourismByName(key,offset,length);
    }
  
    /**
     * 总记录数
     */
    @Transactional
	public int getAllRowCount(int type) {  	
		return tourismDao.getAllRowCount(type);
	}
    
    /**
     * 总记录数
     */
    @Transactional
	public int getAllRowCount(String key) {  	
		return tourismDao.getAllRowCount(key);
	}
    /**
     * 分页查询
     */
    @Transactional
	public List<Tourism> queryForPage(int offset, int length) {
		return tourismDao.queryForPage(offset, length);
	}

    /**
	 * 根据景点起点和终点查询
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
