/*
 * AppException.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.exceptions;

public class AppException extends RuntimeException {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public AppException() {
	}

	public AppException(String message) {
		super(message);
	}

	public AppException(Throwable cause) {
		super(cause);
	}

	public AppException(String message, Throwable cause) {
		super(message, cause);
	}
}
