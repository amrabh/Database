/*
 * Room.java
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

@Entity
public class Room implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private RoomId id;
	
	private int capacity;
	
	@Column(name="AV_Equipment")
	private String equipment;

	@MapsId("buildingId")
	@ManyToOne
	@JoinColumn(name="Building_Id", referencedColumnName="Building_Id")
	private Building building;
	
	@JsonIgnore
	@OneToMany(mappedBy="room")
    private Set<TaughtIn> taughtIns;
	
	public RoomId getId() {
		return id;
	}

	public void setId(RoomId id) {
		this.id = id;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getEquipment() {
		return equipment;
	}

	public void setEquipment(String equipment) {
		this.equipment = equipment;
	}

	public Building getBuilding() {
		return building;
	}

	public void setBuilding(Building building) {
		this.building = building;
	}

	public Set<TaughtIn> getTaughtIns() {
		return taughtIns;
	}

	public void setTaughtIns(Set<TaughtIn> taughtIns) {
		this.taughtIns = taughtIns;
	}
		
}
