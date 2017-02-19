package com.ptis.ssh.dao;

import java.util.List;

import com.ptis.ssh.entities.Tourism;

public interface TourismDao {
	
	public abstract Tourism FindTourismById(Integer tourismId);
	
	public abstract List<Tourism> FindTourismByType(Integer typeId,int offset, int length);
	
	public abstract List<Tourism> FindTourismByName(String key,int offset, int length);
	
	public abstract  int getAllRowCount(int type);
	
	public abstract  int getAllRowCount(String key);
	/**
	 * 分页查询
	 * @param offset 当前页开始的记录数
	 * @param length 当前页现实的记录数
	 * @return 当前页的记录列表
	 */
	public List<Tourism> queryForPage(final int offset,final int length);
	
	public abstract List<Tourism> FindTourismByplace(String startPlace,String endPlace);
	
	public List<Tourism> FindTourismByName(String key);
	
}
