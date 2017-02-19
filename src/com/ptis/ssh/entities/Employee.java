package com.ptis.ssh.entities;

import java.util.Date;

public class Employee {
	private Integer Id;
	private String lastName;
	private String email;
	// 从前段传入的是String类型
	private Date birth;
	private Date createTime;
	private Department department;

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

//	@Override
//	public String toString() {
//		return "Employee [Id=" + Id + ", lastName=" + lastName + ", email="
//				+ email + ", birth=" + birth + ", createTime=" + createTime
//				+ "]";
//	}

	@Override
	public String toString() {
		return "Employee [Id=" + Id + ", lastName=" + lastName + ", email="
				+ email + ", birth=" + birth + ", createTime=" + createTime
				+ ", department.DepartmentId=" + department+ "]";
	}

}
