/*
 * CourseController.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.njit.cs631.api.entities.Course;
import com.njit.cs631.api.repos.CourseRepo;

@RestController
public class CourseController {

	@Autowired
	private CourseRepo courseRepo;
		
	@GetMapping("/courses")
    public List<Course> index(@RequestParam(name="department", required=false) Integer department){
		List<Course> courses = null;
		
		if (department != null) {
			courses = courseRepo.findByDepartmentCode(department);
		} else {
			courses = courseRepo.findAll();
		}
		
        return courses;
    }
	

}
