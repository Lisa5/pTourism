package com.ptis.ssh.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.ptis.ssh.dao.EmployeeDao;
import com.ptis.ssh.entities.Employee;

public class EmployeeService {

	private EmployeeDao employeeDao;

	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
		System.out.println("mployeeDao:" + employeeDao);
	}

	@Transactional
	public void delete(Integer Id) {
		employeeDao.delete(Id);
	}

	@Transactional
	public List<Employee> getAll() {
		System.out.println(">>>employeeDao"+employeeDao.getAll().get(0).getDepartment().getDepartmentName());
		return employeeDao.getAll();
	}
	
	@Transactional 	
	public void saveOrUpdate(Employee employee){
		employeeDao.saveOrUpdate(employee);
	}
}
