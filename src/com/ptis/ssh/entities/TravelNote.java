package com.ptis.ssh.entities;

import java.util.Date;

import javax.persistence.Entity;

@Entity
public class TravelNote {

	private Integer travelNoteId;
	private Integer userId;
	private String title;
	private String subTitle;
	private String content;
	private String imgUrl;
	private Date createTime;
	private String myImg;

	public Integer getTravelNoteId() {
		return travelNoteId;
	}

	public void setTravelNoteId(Integer travelNoteId) {
		this.travelNoteId = travelNoteId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getMyImg() {
		return myImg;
	}

	public void setMyImg(String myImg) {
		this.myImg = myImg;
	}

}
