package com.ptis.ssh.actions;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.ptis.ssh.entities.Comment;
import com.ptis.ssh.entities.Tourism;
import com.ptis.ssh.entities.User;
import com.ptis.ssh.pagebean.PageBean;
import com.ptis.ssh.service.CommentService;
import com.ptis.ssh.service.TourismService;

public class TourismAction extends ActionSupport implements RequestAware,
		ModelDriven<Tourism>, Preparable {

	private static final long serialVersionUID = 1L;

	/**
	 * 错误信息返回！
	 */
	Map<String, String> errorInfo = new HashMap<String, String>();

	public Map<String, String> getErrorInfo() {
		return errorInfo;
	}

	public void setErrorInfo(Map<String, String> errorInfo) {
		this.errorInfo = errorInfo;
	}

	private TourismService tourismService;
	private CommentService commentService;

	public void setTourismService(TourismService tourismService) {
		this.tourismService = tourismService;
	}

	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}

	private Tourism tourism;

	private String piccode;
	private Integer tourismId;
	private int type;
	private int isIndex;
	/** 根据关键字搜索 */
	private String key;
	/** 分页查询 */
	private int page = 0;
	private int pageSize = 20;
	/** 根据place查询 */
	private String startPlace;
	private String endPlace;

	private Map<String, Object> request;

	/**
	 * 根据id获取景点信息
	 */
	public String getTourismInfo() {
		tourism = tourismService.getTourismInfo(tourismId);

		List<Comment> commentList = commentService
				.findCommentByTourismId(tourismId);
		if (commentList == null || commentList.size() == 0) {
			tourism.setTourismPraise(100);
		} else {
			List<Comment> commentPraise = commentService
					.FindCommentPraise(tourismId);
			int praise = commentPraise.size() / commentList.size() * 100;
			tourism.setTourismPraise(praise);
		}
		
		request.put("TourismInfo", tourism);
		request.put("CommentList",
				commentService.findCommentByTourismId(tourismId));

		String[] img = new String[4];
		if (tourism.getTourismImg() != null) {

			img = this.tourism.getTourismImg().split("-");
			for (int i = 0; i < img.length; i++) {
				img[i] = "images/" + img[i];
				//System.out.println(img[i]);
			}
			if (img[0] != null) {
				this.piccode += "<li>" + "<a href=\"optionallink.html\">"
						+ "<img class=\"etalage_thumb_image\" src=\"" + img[0]
						+ "\" class=\"img-responsive\" />"
						+ "<img class=\"etalage_source_image\" src=\"" + img[0]
						+ "\" class=\"img-responsive\" title=\"\" />" + "</a>"
						+ "</li>";
			}

			if (img[1] != null) {
				this.piccode += "<li>" + "<a href=\"optionallink.html\">"
						+ "<img class=\"etalage_thumb_image\" src=\"" + img[1]
						+ "\" class=\"img-responsive\" />"
						+ "<img class=\"etalage_source_image\" src=\"" + img[1]
						+ "\" class=\"img-responsive\" title=\"\" />" + "</a>"
						+ "</li>";
			}

			if (img[2] != null) {
				this.piccode += "<li>" + "<a href=\"optionallink.html\">"
						+ "<img class=\"etalage_thumb_image\" src=\"" + img[2]
						+ "\" class=\"img-responsive\" />"
						+ "<img class=\"etalage_source_image\" src=\"" + img[2]
						+ "\" class=\"img-responsive\" title=\"\" />" + "</a>"
						+ "</li>";
			}

			if (img[3] != null) {
				this.piccode += "<li>" + "<a href=\"optionallink.html\">"
						+ "<img class=\"etalage_thumb_image\" src=\"" + img[3]
						+ "\" class=\"img-responsive\" />"
						+ "<img class=\"etalage_source_image\" src=\"" + img[3]
						+ "\" class=\"img-responsive\" title=\"\" />" + "</a>"
						+ "</li>";
			}
		}
		return "tourismInfo";
	}

	/**
	 * 根据type获取景点信息
	 * 
	 * @return 景点信息列表
	 */
	public String getTourismListByType() {
		User loginUser = (User) ActionContext.getContext().getSession()
				.get("user");
		request.put("loginUser", loginUser);
		int allRow = tourismService.getAllRowCount(type);
		int totalPage = PageBean.countTotalPage(pageSize, allRow);
		final int offset = PageBean.countOffSet(pageSize, page); // 当前页开始记录
		final int length = pageSize; // 每页记录数
		final int currentPage = PageBean.countCurrentPage(page); // 当前页
		
		List<Tourism> tourismList = tourismService.getTourismListByType(type,offset, length);
		String[] img = new String[4];
		for(int i=0;i<tourismList.size();i++){
				Tourism tour=	tourismList.get(i);	
				System.out.println(tourismList.get(i));
				if(tour.getTourismImg()!=null && tour.getTourismImg() != ""){
						img = tour.getTourismImg().split("-");
						for (int j = 0;j < img.length; j++) {
							img[j] = "images/" + img[j];
						}
						tour.setTourismImg(img[1]);
				}		
		}
		request.put("TourismList", tourismList);
		
		// 将page 信息放入pageBean中
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		request.put("pageBean", pageBean);

		if (isIndex == 1) {
			return "tourismList";
		} else if (type == 1) {
			return "tourismType1";
		} else if (type == 2) {
			return "tourismType2";
		} else if (type == 3) {
			return "tourismType3";
		} else if (type == 4) {
			return "tourismType4";
		}
		return "tourismList";
	}

	public String getIndexTourism() {
		// 跟团游
		List<Tourism> tourismList1 = tourismService.getTourismListByType(2, 0,4);
		String[] img1 = new String[4];
		for(int i=0;i<tourismList1.size();i++){
				Tourism tour=	tourismList1.get(i);	
				System.out.println(tourismList1.get(i));
				if(tour.getTourismImg()!=null && tour.getTourismImg() != ""){
						img1 = tour.getTourismImg().split("-");
						for (int j = 0;j < img1.length; j++) {
							img1[j] = "images/" + img1[j];
						}
						tour.setTourismImg(img1[1]);
				}		
		}
		// 自驾游
		List<Tourism> tourismList2 = tourismService.getTourismListByType(3, 0,2);
		String[] img2 = new String[4];
		for(int i=0;i<tourismList2.size();i++){
				Tourism tour=	tourismList2.get(i);	
				System.out.println(tourismList2.get(i));
				if(tour.getTourismImg()!=null && tour.getTourismImg() != ""){
						img2 = tour.getTourismImg().split("-");
						for (int j = 0;j < img2.length; j++) {
							img2[j] = "images/" + img2[j];
						}
						tour.setTourismImg(img2[1]);
				}		
		}
		// 周边游
		List<Tourism> tourismList3 = tourismService.getTourismListByType(4, 0,4);
		String[] img3 = new String[4];
		for(int i=0;i<tourismList3.size();i++){
				Tourism tour=	tourismList3.get(i);	
				//System.out.println(tourismList3.get(i));
				if(tour.getTourismImg()!=null && tour.getTourismImg() != ""){
						img3 = tour.getTourismImg().split("-");
						for (int j = 0;j < img3.length; j++) {
							img3[j] = "images/" + img3[j];
						}
						tour.setTourismImg(img3[1]);
				}		
		}
		request.put("TourismList1", tourismList1);
		request.put("TourismList2", tourismList2);
		request.put("TourismList3", tourismList3);
		return "tourismList";
	}

	/**
	 * 根据关键字搜索 
	 * 
	 * @return 游记列表
	 */
	public String tourismSearch() {
		List<Tourism> tourismList=tourismService.getTourismByName(key);
		String[] img = new String[4];
		for(int i=0;i<tourismList.size();i++){
				Tourism tour=	tourismList.get(i);	
				System.out.println(tourismList.get(i));
				if(tour.getTourismImg()!=null && tour.getTourismImg() != ""){
						img = tour.getTourismImg().split("-");
						for (int j = 0;j < img.length; j++) {
							img[j] = "images/" + img[j];
						}
						tour.setTourismImg(img[1]);
				}		
		}
		request.put("TourismList",tourismList);
		return "tourismsearch";
	}
	//public String 
	public String searchByPlace() {
		List<Tourism> tourismList=tourismService.getTourismByplace(startPlace, endPlace);
		String[] img = new String[4];
		for(int i=0;i<tourismList.size();i++){
				Tourism tour=	tourismList.get(i);	
				System.out.println(tourismList.get(i));
				if(tour.getTourismImg()!=null && tour.getTourismImg() != ""){
						img = tour.getTourismImg().split("-");
						for (int j = 0;j < img.length; j++) {
							img[j] = "images/" + img[j];
						}
						tour.setTourismImg(img[1]);
				}		
		}
		request.put("TourismList",tourismList);
		return "tourismsearch";
	}
	/**
	 * 获取评论列表
	 * 
	 * @return
	 */
	public String getCommentList() {
		commentService.findCommentByTourismId(tourismId);
		return "getcommentList";
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}



	public String pageTourismList() {
		return "pagetourismList";
	}

	@Override
	public void prepare() throws Exception {
	}

	@Override
	public Tourism getModel() {
		if (tourism == null) {
			tourism = new Tourism();
		}
		return tourism;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public String getPiccode() {
		return piccode;
	}

	public void setPiccode(String piccode) {
		this.piccode = piccode;
	}

	public Integer getTourismId() {
		return tourismId;
	}

	public void setTourismId(Integer tourismId) {
		this.tourismId = tourismId;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getIsIndex() {
		return isIndex;
	}

	public void setIsIndex(int isIndex) {
		this.isIndex = isIndex;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getStartPlace() {
		return startPlace;
	}

	public void setStartPlace(String startPlace) {
		this.startPlace = startPlace;
	}

	public String getEndPlace() {
		return endPlace;
	}

	public void setEndPlace(String endPlace) {
		this.endPlace = endPlace;
	}
}
