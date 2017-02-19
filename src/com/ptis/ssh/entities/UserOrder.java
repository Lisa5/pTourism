package com.ptis.ssh.entities;

import java.util.Date;

import javax.persistence.Id;

public class UserOrder {
	@Id
	private Integer orderId;
	private Integer orderNo;
	private Integer userId;
	private Tourism tourism;
	private float orderPrice;
	private Date createTime;
	private String startTime;
    private String orderStatus;
	public Integer getOrderId() {
		return orderId;
	}
	@Id
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Tourism getTourism() {
		return tourism;
	}

	public void setTourism(Tourism tourism) {
		this.tourism = tourism;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public float getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(float orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String string) {
		this.startTime = string;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
}
