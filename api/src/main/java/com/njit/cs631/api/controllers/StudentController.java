/*
 * RegistrationController.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.njit.cs631.api.entities.Student;
import com.njit.cs631.api.exceptions.BadRequestException;
import com.njit.cs631.api.exceptions.ObjectNotFoundException;
import com.njit.cs631.api.repos.StudentRepo;

@RestController
public class StudentController {

	@Autowired
	private StudentRepo studentRepo;
	
	@GetMapping("/students")
    public List<Student> index(
    		@RequestParam(name="course", required=false) String course,
    		@RequestParam(name="section", required=false) Integer section    		
    		){
		
		// Course and section parameters are a pair so if one is present the other MUST be present also.
		if ((course != null && section == null) || (course == null && section != null)) {
			throw new BadRequestException("course and section parameters MUST be provided together");	
		}
		
		// If section is provided, then get by registration of that section.
		// Otherwise get all students.
		if (section != null) {
			return studentRepo.findByRegistration(course, section);
		}
				
		return studentRepo.findAll(Sort.by("lastname", "firstname").ascending());
    }	
	
	@GetMapping("/students/{id}")
    public Student getStudent(@PathVariable("id") Integer id) throws Exception{
		Optional<Student> student = studentRepo.findById(id);
		
		if (!student.isPresent()) {
			throw new ObjectNotFoundException("Student", id);			
		}
		
        return student.get();
    }
		
}
