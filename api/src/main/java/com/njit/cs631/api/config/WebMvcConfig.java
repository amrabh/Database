/*
 * WebMvcConfig.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.config;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class WebMvcConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {		
		registry.addResourceHandler("swagger-ui.html").addResourceLocations("classpath:/META-INF/resoures/");
		registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resoures/webjars/");
	}
}
