package com.ptis.ssh.actions;

import java.io.*;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.ptis.ssh.entities.TravelNote;
import com.ptis.ssh.entities.User;
import com.ptis.ssh.pagebean.PageBean;
import com.ptis.ssh.service.TravelNoteService;

public class TravelNoteAction extends ActionSupport implements RequestAware,
		ModelDriven<TravelNote>, Preparable {

	//private static final long serialVersionUID = 1L;
	private static final int BUFFER_SIZE = 16 * 1024;
	/**
	 * 错误信息返回！
	 */
	Map<String, String> errorInfo = new HashMap<String, String>();

	public Map<String, String> getErrorInfo() {
		return errorInfo;
	}

	public void setErrorInfo(Map<String, String> errorInfo) {
	}

	private TravelNoteService noteService;

	public void setNoteService(TravelNoteService noteService) {
		this.noteService = noteService;
	}

	private TravelNote travelNote;

	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}

	private Map<String, Object> request;

	private PageBean pageBean = new PageBean();
	private int page = 0;
	private int pageSize =4;

	private static final long serialVersionUID = 572146812454l;

	// 注意，文件上传时<s:file/>同时与myFile，myFileContentType,myFileFileName绑定
	// 所以同时要提供myFileContentType,myFileFileName的set方法

	private File myFile; // 上传文件
	private String contentType;// 上传文件类型
	private String fileName; // 上传文件名
	private String imageFileName;
	private String caption;// 文件说明，与页面属性绑定

	public void setMyFileContentType(String contentType) {
		System.out.println("文件类型 : " + contentType);
		this.contentType = contentType;
	}

	public void setMyFileFileName(String fileName) {
		System.out.println("文件名称 : " + fileName);
		this.fileName = fileName;
	}

	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	public File getMyFile() {
		return myFile;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	private static void copy(File src, File dst) {
		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(src),
						BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst),
						BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while (in.read(buffer) > 0) {
					out.write(buffer);
				}
			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static String getExtention(String fileName) {
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}

	/**
	 * 保存用户的游记
	 */
	public String saveNote() {
		User loginUser = (User) ActionContext.getContext().getSession()
				.get("user");
		if (loginUser == null) {
			return "login";
		} else {
	      System.out.println("开始");
			imageFileName = new Date().getTime() + getExtention(fileName);
			File imageFile = new File(ServletActionContext.getServletContext().getRealPath("/images" ) + "/" + imageFileName);
			copy(myFile, imageFile);		
			travelNote.setImgUrl(imageFileName);
			travelNote.setUserId(loginUser.getUserId());
			travelNote.setCreateTime(new Date());
			noteService.saveNote(travelNote);
			return INPUT;
		}
	}

	public String getNoteList() {
		request.put("noteList", noteService.getNoteList());
		System.out.println("noteService.getNoteList()"
				+ noteService.getNoteList());
		return SUCCESS;
	}

	/**
	 * 分页查询游记
	 */
	public String pageNoteList() {
		int allRow = noteService.getAllRowCount();
		int totalPage = PageBean.countTotalPage(pageSize, allRow);
		final int offset = PageBean.countOffSet(pageSize, page); // 当前页开始记录
		final int length = pageSize; // 每页记录数
		final int currentPage = PageBean.countCurrentPage(page); // 当前页
		request.put("noteList", noteService.queryForPage(offset, length));
		System.out.println("page:" + page);
		System.out.println("offset:" + offset);
		// 把分页信息保存到Bean当中
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		request.put("pageBean", pageBean);
		return SUCCESS;
	}

	@Override
	public void prepare() throws Exception {
	}

	@Override
	public TravelNote getModel() {
		if (travelNote == null) {
			travelNote = new TravelNote();
		}
		return travelNote;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
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

}
