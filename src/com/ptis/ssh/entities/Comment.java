package com.ptis.ssh.entities;


import javax.persistence.Id;

public class Comment {
	@Id
	private Integer commitId;
	private User user;
	private Integer tourismId;
	private String content;
	private Integer commentStar;
	private String CreateTime;
	public Integer getCommitId() {
		return commitId;
	}
	public void setCommitId(Integer commitId) {
		this.commitId = commitId;
	}

	public Integer getTourismId() {
		return tourismId;
	}
	public void setTourismId(Integer tourismId) {
		this.tourismId = tourismId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getCommentStar() {
		return commentStar;
	}
	public void setCommentStar(Integer commentStar) {
		this.commentStar = commentStar;
	}
	public String getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(String createTime) {
		CreateTime = createTime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

}
