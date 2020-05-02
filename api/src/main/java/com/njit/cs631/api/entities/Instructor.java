/*
 * Instructor.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="faculty")
public class Instructor extends Staff {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
		
	@Column(name="Course_Load")
	private int courseLoad;

	private int rank;
	
	public int getCourseLoad() {
		return courseLoad;
	}

	public void setCourseLoad(int courseLoad) {
		this.courseLoad = courseLoad;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}
	
}
