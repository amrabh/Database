/*
 * SectionController.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.njit.cs631.api.entities.Section;
import com.njit.cs631.api.repos.SectionRepo;

@RestController
public class SectionController {

	@Autowired
	private SectionRepo sectionRepo;		
	
	@GetMapping("/sections")
    public List<Section> index(@RequestParam(name="course", required=false) String course,
    		@RequestParam(name="year", required=false, defaultValue="0") int year,
    		@RequestParam(name="semester", required=false) String semester){
		
        return sectionRepo.findByCourseCodeAndYearAndSemester(course, year, semester);        
    }

}
