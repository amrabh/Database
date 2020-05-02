/*
 * ObjectNotFoundException.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.exceptions;

public class ObjectNotFoundException extends AppException {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ObjectNotFoundException(String type, Object id) {
		super(String.format("%s [%s] not found", type, id));
	}
}
