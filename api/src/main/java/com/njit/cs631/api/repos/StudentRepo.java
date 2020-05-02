/*
 * StudentRepo.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.njit.cs631.api.entities.Student;

@Repository
public interface StudentRepo extends JpaRepository<Student, Integer> {

	@Query("SELECT s FROM Student s"
			+ " JOIN Registration r ON r.id.studentId = s.id"
			+ " WHERE r.id.courseCode = :course"
			+ " AND r.id.sectionNo = :section"
			+ " ORDER BY s.lastname, s.firstname")
	List<Student> findByRegistration(@Param("course") String courseCode, @Param("section") int sectionNo);
	
}
