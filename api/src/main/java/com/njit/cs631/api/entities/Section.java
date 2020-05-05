/*
 * Section.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.entities;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
public class Section implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private SectionId id;
	
	private int year;
	
	private String semester;
	
	@Column(name="Max_Enrollment")
	private int maxEnrollment;
	
//	@Column(name="Faculty_SSN") 
//	private String instructorSSN;

	@MapsId("courseCode")
	@ManyToOne()
    @JoinColumn(name="Course_Code", referencedColumnName = "Course_Code")
	private Course course;
	
	@ManyToOne()
    @JoinColumn(name="Faculty_SSN", referencedColumnName = "SSN")
	private Instructor instructor;

	@JsonIgnore
	@OneToMany(mappedBy="section")
    private Set<TaughtIn> taughtIns;

	@JsonIgnore
	@OneToMany(mappedBy="section")
    private Set<Registration> registrations;
	
	public SectionId getId() {
		return id;
	}

	public void setId(final SectionId id) {
		this.id = id;
	}

	public int getYear() {
		return year;
	}

	public void setYear(final int year) {
		this.year = year;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(final String semester) {
		this.semester = semester;
	}

	public int getMaxEnrollment() {
		return maxEnrollment;
	}

	public void setMaxEnrollment(final int maxEnrollment) {
		this.maxEnrollment = maxEnrollment;
	}

	// public String getInstructorSSN() {
	// return instructorSSN;
	// }
	//
	// public void setInstructorSSN(String instructorSSN) {
	// this.instructorSSN = instructorSSN;
	// }

	public Course getCourse() {
		return course;
	}

	public void setCourse(final Course course) {
		this.course = course;
	}

	public Instructor getInstructor() {
		return instructor;
	}

	public void setInstructor(final Instructor instructor) {
		this.instructor = instructor;
	}

	public Set<TaughtIn> getTaughtIns() {
		return taughtIns;
	}

	public void setTaughtIns(final Set<TaughtIn> taughtIns) {
		this.taughtIns = taughtIns;
	}

	@JsonProperty
	public TaughtIn getTaughtIn() {
		TaughtIn ti = null;
		if (taughtIns != null) {
			for (final TaughtIn taughtIn : taughtIns) {
				ti = taughtIn;
				break;
			}
		}

		return ti;
	}

	public Set<Registration> getRegistrations() {
		return registrations;
	}

	public void setRegistrations(final Set<Registration> registrations) {
		this.registrations = registrations;
	}
	
	@JsonProperty
	public int getRegistrationCount(){
		int count = 0;
		if (registrations != null) {
			count = registrations.size();
		}
		return count;
	}
	
}
