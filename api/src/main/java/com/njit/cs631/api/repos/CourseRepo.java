/*
 * CourseRepo.java
 * Author: Roderic Henry
 * 04/25/2020
*/
package com.njit.cs631.api.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.njit.cs631.api.entities.Course;

@Repository
public interface CourseRepo extends JpaRepository<Course, String>{

	List<Course> findByDepartmentCode(int departmentCode);		
	
}
