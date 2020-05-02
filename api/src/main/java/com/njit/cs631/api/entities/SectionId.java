/*
 * SectionId.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class SectionId implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Column(name="Course_Code")
	private String courseCode;
	
	@Column(name="Sec_No")
	private int sectionNo;

	public String getCourseCode() {
		return courseCode;
	}

	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}

	public int getSectionNo() {
		return sectionNo;
	}

	public void setSectionNo(int sectionNo) {
		this.sectionNo = sectionNo;
	}
	
}
