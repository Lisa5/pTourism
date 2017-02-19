package com.ptis.ssh.pagebean;

public class PageBean {
	
	//private List<User> list;  //要返回的某一页的记录列表
	private int allRow; //总记录数
	private int totalPage;  //总页数
	private int currentPage;  //当前页
	private int pageSize;  //每页的记录数
	private boolean isFirstPage;  //是否为当前第一页
	private boolean isLastPage;  //是否为最后一页
	private boolean hasPreviousPage;  //是否有前一页
	private boolean hasNextPage;  //是否有下一页
	
	/**
	 * 初始化页面信息
	 */
	public void init(){
		this.isFirstPage=isFirstPage;
		this.isLastPage=isFirstPage;
		this.hasPreviousPage=hasPreviousPage;
		this.hasNextPage=hasNextPage;
	}
	/**
	 * 计算总页数 静态方法
	 * @param pageSize 页面de记录数
	 * @param allRow 总记录数
	 * @return 总页数
	 */
	public static int countTotalPage(final int pageSize,int allRow){
		int totalPage=allRow%pageSize==0?allRow/pageSize:allRow/pageSize+1;
		return totalPage;
	}
	
	/**
	 * 计算当前页开始的记录
	 * @param pageSize 
	 * @param currentPage 当前页
	 * @return 
	 */
	public static int  countOffSet(final int pageSize,final int currentPage){
		int offSet=pageSize*(currentPage-1);
		return offSet;
	}
	/**
	 * 当请问失败时或者page=0，则用1代替,
	 * @param page 可能为空 即为0，这时返回1
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
