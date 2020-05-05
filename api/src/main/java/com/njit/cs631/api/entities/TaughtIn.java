/*
 * TaughtIn.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.entities;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class TaughtIn implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@JsonIgnore
	@EmbeddedId
	private TaughtInId id;
	
	private int weekday;
	
	private String time;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumns({ 
        @JoinColumn(updatable=false,insertable=false, name="Course_Code", referencedColumnName="Course_Code"), 
        @JoinColumn(updatable=false,insertable=false, name="Sec_No", referencedColumnName="Sec_No")
    })
    private Section section;
	
	@ManyToOne
	@JoinColumns({ 
        @JoinColumn(updatable=false,insertable=false, name="Building_Id", referencedColumnName="Building_Id"),
        @JoinColumn(updatable=false,insertable=false, name="Room_No", referencedColumnName="Room_No")
    })
	private Room room;

	public TaughtInId getId() {
		return id;
	}

	public void setId(final TaughtInId id) {
		this.id = id;
	}

	public int getWeekday() {
		return weekday;
	}

	public void setWeekday(final int weekday) {
		this.weekday = weekday;
	}

	public String getTime() {
		return time;
	}

	public void setTime(final String time) {
		this.time = time;
	}

	public Section getSection() {
		return section;
	}

	public void setSection(final Section section) {
		this.section = section;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(final Room room) {
		this.room = room;
	}
}
