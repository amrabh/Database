/*
 * Student.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
public class Student implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="Student_Id")
	private int id;
	
	@JsonIgnore
	private String ssn;
	
	@Column(name="First_Name")
	private String firstname;
	
	@Column(name="Last_Name")
	private String lastname;
	
	private String address;
	
	@Column(name="High_School")
	private String highSchool;
	
	private int year;
	
//	@Column(name="Dept_Code")
//	private int departmentCode; 
	
	private String email;
	
	private String phone;

	@ManyToOne
	@JoinColumn(name="Dept_Code", referencedColumnName="Dept_Code")
	private Department department;
		
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSsn() {
		return ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHighSchool() {
		return highSchool;
	}

	public void setHighSchool(String highSchool) {
		this.highSchool = highSchool;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

//	public int getDepartmentCode() {
//		return departmentCode;
//	}
//
//	public void setDepartmentCode(int departmentCode) {
//		this.departmentCode = departmentCode;
//	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}
	
	@JsonProperty
	public String getMajor(){
		return department.getName();
	}
}
