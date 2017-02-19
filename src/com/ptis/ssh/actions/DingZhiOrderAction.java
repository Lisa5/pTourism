package com.ptis.ssh.actions;

import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.ptis.ssh.entities.DingZhiOrder;
import com.ptis.ssh.entities.User;
import com.ptis.ssh.service.DingZhiOrderService;

public class DingZhiOrderAction extends ActionSupport implements RequestAware,
		ModelDriven<DingZhiOrder>, Preparable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private DingZhiOrderService dingZhiOrderService;
	private Map<String, Object> request;

	public void setDingZhiOrderService(DingZhiOrderService dingZhiOrderService) {
		this.dingZhiOrderService = dingZhiOrderService;
	}

	private DingZhiOrder dingZhiOrder;
	public String saveOrUpdate() {
		User loginUser = (User) ActionContext.getContext().getSession()
				.get("user");
		if (loginUser == null) {
			return "login";
		} else {
			request.put("userInfo", loginUser);
			System.out.println(loginUser.getUserId());
			dingZhiOrder.setUserId(loginUser.getUserId());
			dingZhiOrder.setStartTime(new Date());
			dingZhiOrder.setEndTime(new Date());
			/*
			System.out.println(dingZhiOrder.getUserName());
			System.out.println(dingZhiOrder.getUserPhone());
			System.out.println(dingZhiOrder.getAddition());
			System.out.println(dingZhiOrder.getEndPlace());
			System.out.println(dingZhiOrder.getStartPlace());
			System.out.println(dingZhiOrder.getTripWay());
			System.out.println(dingZhiOrder.getUserCompany());
			System.out.println(dingZhiOrder.getUserEmail());
			System.out.println(dingZhiOrder.getBudget());
			System.out.println(dingZhiOrder.getPersonAmount());
			System.out.println(dingZhiOrder.getDays());
			System.out.println(dingZhiOrder.getUserId());	
			System.out.println("dingZhiOrder:"+dingZhiOrder);*/
		    dingZhiOrderService.SaveOrUpdate(dingZhiOrder);
			return SUCCESS;
		}
	}

	public String savePreper(){
		User loginUser = (User) ActionContext.getContext().getSession().get("user");
		request.put("userInfo", loginUser);
		return "savepreper";
	}
	
	public void prepare() throws Exception {

	}

	public DingZhiOrder getModel() {
		if (dingZhiOrder == null) {
			dingZhiOrder = new DingZhiOrder();
		}
		return dingZhiOrder;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	};
}
