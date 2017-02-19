package com.ptis.ssh.actions;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.ptis.ssh.entities.Comment;
import com.ptis.ssh.entities.User;
import com.ptis.ssh.service.CommentService;


public class CommentAction  extends ActionSupport implements RequestAware,
ModelDriven<Comment>, Preparable {

	private static final long serialVersionUID = 1L;

	private CommentService commentService;
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	private Comment comment;
	private Integer tourismId;
	private Map<String,Object> request;
	/**
	 * ∆¿¬€
	 * 
	 * @return
	 */
	public String makeComment() {
		request.put("tourismId", tourismId);
		return "makecomment";
	}

	/**
	 * ±£¥Ê∆¿¬€
	 * @return
	 */
	public String saveComment() {
		User loginUser = (User) ActionContext.getContext().getSession().get("user");
		if(loginUser==null){
			return "login";
		}
		else{
			System.out.println(loginUser);
			//Integer id=loginUser.getUserId();
			comment.setUser(loginUser);
			//System.out.println("userId:"+loginUser.getUserId());
			Date createTime= new Date();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			comment.setCreateTime( df.format(createTime));
			commentService.saveComment(comment);
			return "savecomment";
		}
		
	}

	@Override
	public void prepare() throws Exception {
		
	}

	@Override
	public Comment getModel() {
		if(comment==null){
			comment=new Comment();
		}
			return comment;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request=request;
	}

	public Integer getTourismId() {
		return tourismId;
	}

	public void setTourismId(Integer tourismId) {
		this.tourismId = tourismId;
	}

}
