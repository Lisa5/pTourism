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
	 * ��ҳ��ѯ
	 * @param offset ��ǰҳ��ʼ�ļ�¼��
	 * @param length ��ǰҳ��ʵ�ļ�¼��
	 * @return ��ǰҳ�ļ�¼�б�
	 */
    public abstract List<Tourism> queryForPage(int offset,int length);
    
    public abstract List<Tourism> getTourismByplace(String startPlace,String endPlace);
    
    public abstract List<Tourism> getTourismByName(String key);
    
}
