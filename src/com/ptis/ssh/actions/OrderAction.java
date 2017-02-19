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
import com.ptis.ssh.entities.User;
import com.ptis.ssh.entities.UserOrder;
import com.ptis.ssh.entities.Tourism;
import com.ptis.ssh.service.DingZhiOrderService;
import com.ptis.ssh.service.OrderService;

public class OrderAction extends ActionSupport implements RequestAware,
		ModelDriven<UserOrder>, Preparable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private OrderService orderService;
	private DingZhiOrderService dingZhiOrderService;

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public void setDingZhiOrderService(DingZhiOrderService dingZhiOrderService) {
		this.dingZhiOrderService = dingZhiOrderService;
	}

	private Map<String, Object> request;

	private UserOrder order;
	private int userId;
	@SuppressWarnings("unused")
	private Tourism tourism;
	private float orderPrice;

	/**
	 * 用户订单
	 * 
	 * @return 订单列表
	 */
	public String userOrder() {
		// 获取session中的
		User loginUser = (User) ActionContext.getContext().getSession()
				.get("user");
		if (loginUser == null) {
			return "login";
		} else {
			request.put("loginUser", loginUser);
			request.put("OrderList",
					orderService.getOrderByUserId(loginUser.getUserId()));
			request.put("DingZhiOrderList",
					dingZhiOrderService.findOrderByUserId(loginUser.getUserId()));
			return "orderlist";
		}
	}

	public String saveOrder() {
		User loginUser = (User) ActionContext.getContext().getSession()
				.get("user");
		if (loginUser == null) {
			return "login";
		} else {
			
			order.setCreateTime(new Date());
			Date startTime = new Date();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			order.setStartTime(df.format(startTime));
			order.setOrderStatus("已付款");
			order.setOrderId(loginUser.getUserId());
			orderService.saveOrder(order);
			return "saveorder";
		}
	}

	@Override
	public void prepare() throws Exception {
	}

	@Override
	public UserOrder getModel() {
		if (order == null) {
			order = new UserOrder();
		}
		return order;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public float getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(float orderPrice) {
		this.orderPrice = orderPrice;
	}
}
