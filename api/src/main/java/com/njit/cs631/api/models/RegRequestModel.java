/*
 * RegRequestModel.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.models;

public class RegRequestModel {
	private int studentId;
	private String courseCode;
	private int sectionNo;
	
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
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
