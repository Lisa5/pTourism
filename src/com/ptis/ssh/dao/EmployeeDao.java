package com.ptis.ssh.dao;

import java.util.List;

import com.ptis.ssh.entities.Employee;

public class EmployeeDao extends BaseDao {

	public void delete(Integer Id) { 
		String hql = "DELETE FROM Employee e WHERE e.Id=? ";
		getSession().createQuery(hql).setInteger(0, Id).executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public List<Employee> getAll() {
		String hql = "FROM Employee e LEFT OUTER JOIN FETCH e.department";	
		List<Employee> list =  getSession().createQuery(hql).list();
		System.out.println(">>>getSession"+list.get(0).getDepartment().getDepartmentName());

		return getSession().createQuery(hql).list();
	}

	public void saveOrUpdate(Employee employee) {
		getSession().saveOrUpdate(employee);
	}
}
