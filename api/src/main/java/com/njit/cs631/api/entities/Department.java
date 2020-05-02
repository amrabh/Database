/*
 * Department.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Department implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="Dept_Code")
	private int code;
	
	@Column(name="Dept_Name")
	private String name;
	
	@Column(name="Lat_Ann_budget")
	private double budget;
	
	@JsonIgnore
	@Column(name="Chairman_SSN")
	private String chairmanSSN;
	
	@Column(name="Building_Id")
	private int buildingId;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getBudget() {
		return budget;
	}

	public void setBudget(double budget) {
		this.budget = budget;
	}

	public String getChairmanSSN() {
		return chairmanSSN;
	}

	public void setChairmanSSN(String chairmanSSN) {
		this.chairmanSSN = chairmanSSN;
	}

	public int getBuildingId() {
		return buildingId;
	}

	public void setBuildingId(int buildingId) {
		this.buildingId = buildingId;
	}
	
}
