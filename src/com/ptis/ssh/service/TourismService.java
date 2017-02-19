package com.ptis.ssh.service;

import java.util.List;

import com.ptis.ssh.entities.Tourism;

public interface TourismService {
	
	public abstract Tourism getTourismInfo(Integer tourismId);

	public abstract List<Tourism> getTourismListByType(Integer typeId,int offset, int length);
	
	public abstract List<Tourism> searchTourismByName(String key,int offset, int length);
	
	public abstract int getAllRowCount(int type);
	
	public abstract int getAllRowCount(String key);
	
	/**
	 * 分页查询
	 * @param offset 当前页开始的记录数
	 * @param length 当前页现实的记录数
	 * @return 当前页的记录列表
	 */
    public abstract List<Tourism> queryForPage(int offset,int length);
    
    public abstract List<Tourism> getTourismByplace(String startPlace,String endPlace);
    
    public abstract List<Tourism> getTourismByName(String key);
    
}
