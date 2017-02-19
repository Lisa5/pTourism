package com.ptis.ssh.interceptor;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class AuthorityInterceptor extends MethodFilterInterceptor{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation actioninvocation) throws Exception {
		Object user = ServletActionContext.getRequest().getSession().getAttribute("user");
		if(user != null)
		{
			return actioninvocation.invoke(); //µÝ¹éµ÷ÓÃÀ¹½ØÆ÷
		}
		else{
			return Action.LOGIN;
		}
	}

}
