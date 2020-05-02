/*
 * Course.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Course implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="Course_Code")
	private String code;
	
	@Column(name="Course_Name")
	private String name;
		
	private int credit;
	
	@Column(name="TA_Hr_Req")
	private int taHrReq;
	
	@Column(name="Dept_Code")
	private int departmentCode;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public int getTaHrReq() {
		return taHrReq;
	}

	public void setTaHrReq(int taHrReq) {
		this.taHrReq = taHrReq;
	}

	public int getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentCode(int departmentCode) {
		this.departmentCode = departmentCode;
	}
	
	
}
