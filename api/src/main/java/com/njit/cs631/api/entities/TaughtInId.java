/*
 * TaughtInId.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class TaughtInId implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Column(name="Course_Code")
	private String courseCode;
	
	@Column(name="Sec_No")
	private int sectionNo;

	@Column(name="Building_Id")
	private int buildingId;
	
	@Column(name="Room_No")
	private int roomNo;
	
	public int getBuildingId() {
		return buildingId;
	}

	public void setBuildingId(int buildingId) {
		this.buildingId = buildingId;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
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
