package com.ptis.ssh.actions;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.ptis.ssh.entities.Employee;
import com.ptis.ssh.service.DepartmentService;
import com.ptis.ssh.service.EmployeeService;

public class EmployeeAction extends ActionSupport implements RequestAware,
		ModelDriven<Employee>, Preparable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L; // ctrl+1 Ìí¼Ó

	private EmployeeService employeeService;

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	private DepartmentService departmentService;

	public void setDepartmentService(DepartmentService dapartmentService) {
		this.departmentService = dapartmentService;
	}

	private Map<String, Object> request;
	private Integer Id;
	public void setId(Integer id) {
		Id = id;
	}
	private InputStream inputStream;
	public InputStream getInputStream() {
		return inputStream;
	}

	public String list() {
		System.out.println(">>>"+employeeService.getAll().get(0).getDepartment().getDepartmentName());
		request.put("employee", employeeService.getAll());
		System.out.println("EmployeeService" + employeeService.getAll());
		return "list";
	}

	public String input() {
		request.put("departments", departmentService.getAll());
		System.out.println("department" + departmentService.getAll());
		return INPUT;
	}

	public String save() {
		model.setCreateTime(new Date());
		employeeService.saveOrUpdate(model);
		System.out.println(model);
		return SUCCESS;
	}

	public String delete() {
		System.out.println("Æô¶¯É¾³ý");
		try {
			employeeService.delete(Id);
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}
		return "ajax-success";
	}

	public void perpareSave() {
		model = new Employee();
	}

	@Override
	public void setRequest(Map<String, Object> request) { // ctrl+1 Ìí¼Ó
		this.request = request;
	}

	@Override
	public void prepare() throws Exception {
	}

	private Employee model;

	@Override
	public Employee getModel() {
		return model;
	}

}
