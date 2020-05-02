/*
 * RegistrationController.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.controllers;

import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.njit.cs631.api.entities.Registration;
import com.njit.cs631.api.entities.RegistrationId;
import com.njit.cs631.api.entities.Section;
import com.njit.cs631.api.entities.SectionId;
import com.njit.cs631.api.entities.Student;
import com.njit.cs631.api.exceptions.BadRequestException;
import com.njit.cs631.api.models.RegRequestModel;
import com.njit.cs631.api.models.RegResponseModel;
import com.njit.cs631.api.repos.RegistrationRepo;
import com.njit.cs631.api.repos.SectionRepo;
import com.njit.cs631.api.repos.StudentRepo;

@RestController
public class RegistrationController {

	@Autowired
	private StudentRepo studentRepo;
	
	@Autowired
	private SectionRepo sectionRepo;
	
	@Autowired
	private RegistrationRepo registrationRepo;
	
	@Value("${registration.semester.course.limit:3}")
	private int semesterCourseLimit;
	
	@ResponseStatus(code=HttpStatus.CREATED)
	@PostMapping("/register")
	@SuppressWarnings("serial")
	public RegResponseModel register(@RequestBody RegRequestModel model){
		// Validate section.
		Optional<Section> oSection = sectionRepo.findById(new SectionId(){{
			setCourseCode(model.getCourseCode());
			setSectionNo(model.getSectionNo());
		}});		
		if (!oSection.isPresent()) {
			throw new BadRequestException("Invalid course section");
		}		
		Section section = oSection.get();

		// Validate student.
		Optional<Student> oStudent = studentRepo.findById(model.getStudentId());
		if (!oStudent.isPresent()) {
			throw new BadRequestException("Invalid student");
		}		
		Student student = oStudent.get();
		
		// Ensure section max enrollment is not exceeded.
		if (section.getRegistrationCount() >= section.getMaxEnrollment()) {
			throw new BadRequestException("This section is at maximum enrollment. Cannot register for this course section.");
		}
		
		// Ensure student didn't register for another section of the same course in same year and semester.
		int courseSectionCount = registrationRepo.getCourseSemesterRegistrationCount(student.getId(), model.getCourseCode(), section.getYear(), section.getSemester());
		if (courseSectionCount >= 1) {
			throw new BadRequestException("Student is already registered for this course in another section for this semester.");
		}
		
		// Ensure semester course limit is not exceeded.
		if (registrationRepo.getSemesterRegistrationCount(student.getId(), section.getYear(), section.getSemester()) >= semesterCourseLimit) {
			throw new BadRequestException("Student has reached maximum courses for semester.");
		}
		
		RegistrationId regId = new RegistrationId();
		regId.setCourseCode(model.getCourseCode());
		regId.setSectionNo(model.getSectionNo());
		regId.setStudentId(model.getStudentId());
			
		Registration reg = new Registration();
		reg.setId(regId);
		reg.setDateRegistered(new Date());
				
		reg = registrationRepo.save(reg);

		return new RegResponseModel(){{
			setCount(section.getRegistrationCount() + 1);
		}};
	}
}
