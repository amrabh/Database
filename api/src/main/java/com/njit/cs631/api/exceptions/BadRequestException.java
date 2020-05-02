/*
 * BadRequestException.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.exceptions;


public class BadRequestException extends AppException {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public BadRequestException(String message) {
		super(message);
	}
}
