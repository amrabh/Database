/*
 * ServletInitializer.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

public class ServletInitializer extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(UniversityApplication.class);
	}

}
