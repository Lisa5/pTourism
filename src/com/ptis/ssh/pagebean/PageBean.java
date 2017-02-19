package com.ptis.ssh.pagebean;

public class PageBean {
	
	//private List<User> list;  //Ҫ���ص�ĳһҳ�ļ�¼�б�
	private int allRow; //�ܼ�¼��
	private int totalPage;  //��ҳ��
	private int currentPage;  //��ǰҳ
	private int pageSize;  //ÿҳ�ļ�¼��
	private boolean isFirstPage;  //�Ƿ�Ϊ��ǰ��һҳ
	private boolean isLastPage;  //�Ƿ�Ϊ���һҳ
	private boolean hasPreviousPage;  //�Ƿ���ǰһҳ
	private boolean hasNextPage;  //�Ƿ�����һҳ
	
	/**
	 * ��ʼ��ҳ����Ϣ
	 */
	public void init(){
		this.isFirstPage=isFirstPage;
		this.isLastPage=isFirstPage;
		this.hasPreviousPage=hasPreviousPage;
		this.hasNextPage=hasNextPage;
	}
	/**
	 * ������ҳ�� ��̬����
	 * @param pageSize ҳ��de��¼��
	 * @param allRow �ܼ�¼��
	 * @return ��ҳ��
	 */
	public static int countTotalPage(final int pageSize,int allRow){
		int totalPage=allRow%pageSize==0?allRow/pageSize:allRow/pageSize+1;
		return totalPage;
	}
	
	/**
	 * ���㵱ǰҳ��ʼ�ļ�¼
	 * @param pageSize 
	 * @param currentPage ��ǰҳ
	 * @return 
	 */
	public static int  countOffSet(final int pageSize,final int currentPage){
		int offSet=pageSize*(currentPage-1);
		return offSet;
	}
	/**
	 * ������ʧ��ʱ����page=0������1����,
	 * @param page ����Ϊ�� ��Ϊ0����ʱ����1
	 * @return
	 */
	public static int countCurrentPage(int page){
		final int currentPage=(page==0?1:page);
		return currentPage;
	}
	
	
	public int getAllRow() {
		return allRow;
	}
	public void setAllRow(int allRow) {
		this.allRow = allRow;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public boolean isFirstPage() {
		return isFirstPage;
	}
	public void setFirstPage(boolean isFirstPage) {
		this.isFirstPage = isFirstPage;
	}
	public boolean isLastPage() {
		return isLastPage;
	}
	public void setLastPage(boolean isLastPage) {
		this.isLastPage = isLastPage;
	}
	public boolean isHasPreviousPage() {
		return hasPreviousPage;
	}
	public void setHasPreviousPage(boolean hasPreviousPage) {
		this.hasPreviousPage = hasPreviousPage;
	}
	public boolean isHasNextPage() {
		return hasNextPage;
	}
	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}
	
	

}
