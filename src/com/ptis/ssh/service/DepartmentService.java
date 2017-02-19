package com.ptis.ssh.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.ptis.ssh.dao.DepartmentDao;
import com.ptis.ssh.entities.Department;

public class DepartmentService {

	private DepartmentDao departmentDao;

	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	@Transactional
	public List<Department> getAll() {
		return departmentDao.getAll();
	}
}
