package com.ptis.ssh.entities;

import java.util.Date;

public class DingZhiOrder {

	private Integer DingZhiOrderId;
	private Integer userId;
	private String UserName;
	private String UserPhone;
	private String UserEmail;
	private String UserCompany;
	private String StartPlace;
	private String EndPlace;
	private Date StartTime;
	private Date EndTime;
	private Integer PersonAmount;
	private Integer Budget;
	private Integer Days;
	private String TripWay;
	private String Addition;
	private String OrderType;
	public Integer getDingZhiOrderId() {
		return DingZhiOrderId;
	}
	public void setDingZhiOrderId(Integer dingZhiOrderId) {
		DingZhiOrderId = dingZhiOrderId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getUserPhone() {
		return UserPhone;
	}
	public void setUserPhone(String userPhone) {
		UserPhone = userPhone;
	}
	public String getUserEmail() {
		return UserEmail;
	}
	public void setUserEmail(String userEmail) {
		UserEmail = userEmail;
	}
	public String getUserCompany() {
		return UserCompany;
	}
	public void setUserCompany(String userCompany) {
		UserCompany = userCompany;
	}
	public String getStartPlace() {
		return StartPlace;
	}
	public void setStartPlace(String startPlace) {
		StartPlace = startPlace;
	}
	public String getEndPlace() {
		return EndPlace;
	}
	public void setEndPlace(String endPlace) {
		EndPlace = endPlace;
	}
	public Date getStartTime() {
		return StartTime;
	}
	public void setStartTime(Date startTime) {
		StartTime = startTime;
	}
	public Date getEndTime() {
		return EndTime;
	}
	public void setEndTime(Date endTime) {
		EndTime = endTime;
	}
	public Integer getPersonAmount() {
		return PersonAmount;
	}
	public void setPersonAmount(Integer personAmount) {
		PersonAmount = personAmount;
	}
	public Integer getBudget() {
		return Budget;
	}
	public void setBudget(Integer budget) {
		Budget = budget;
	}
	public Integer getDays() {
		return Days;
	}
	public void setDays(Integer days) {
		Days = days;
	}
	public String getTripWay() {
		return TripWay;
	}
	public void setTripWay(String tripWay) {
		TripWay = tripWay;
	}
	public String getAddition() {
		return Addition;
	}
	public void setAddition(String addition) {
		Addition = addition;
	}
	public String getOrderType() {
		return OrderType;
	}
	public void setOrderType(String OrderType) {
		this.OrderType = OrderType;
	}

	
}
