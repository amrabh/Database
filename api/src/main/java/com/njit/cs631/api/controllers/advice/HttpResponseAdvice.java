/*
 * HttpResponseAdvice.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.controllers.advice;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.njit.cs631.api.exceptions.AppException;
import com.njit.cs631.api.exceptions.BadRequestException;
import com.njit.cs631.api.exceptions.ObjectNotFoundException;

@ControllerAdvice
public class HttpResponseAdvice {


	@ResponseBody
	@ExceptionHandler(ObjectNotFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String objectNotFoundHandler(ObjectNotFoundException ex) {
		return ex.getMessage();
	}
	
	@ResponseBody
	@ExceptionHandler(BadRequestException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public String badRequestHandler(BadRequestException ex) {
		return ex.getMessage();
	}
	
	@ResponseBody
	@ExceptionHandler(AppException.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public String genericAppExceptionHandler(AppException ex) {
		return ex.getMessage();
	}
	
	@ResponseBody
	@ExceptionHandler(Exception.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public String genericExceptionHandler(Exception ex) {
		return "The service is unable to process your request at this time. Please try again later.";
	}
	
}
