/*
 * Registration.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Registration implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private RegistrationId id;
	
	@Column(name="Date_Registered")
	private Date dateRegistered;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumns({ 
        @JoinColumn(updatable=false,insertable=false, name="Course_Code", referencedColumnName="Course_Code"), 
        @JoinColumn(updatable=false,insertable=false, name="Sec_No", referencedColumnName="Sec_No")
    })
    private Section section;

	public RegistrationId getId() {
		return id;
	}

	public void setId(RegistrationId id) {
		this.id = id;
	}

	public Date getDateRegistered() {
		return dateRegistered;
	}

	public void setDateRegistered(Date dateRegistered) {
		this.dateRegistered = dateRegistered;
	}

	public Section getSection() {
		return section;
	}

	public void setSection(Section section) {
		this.section = section;
	}
		
}
