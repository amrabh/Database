/*
 * SectionRepo.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.njit.cs631.api.entities.Section;
import com.njit.cs631.api.entities.SectionId;

@Repository
public interface SectionRepo extends JpaRepository<Section, SectionId>{

	@Query("SELECT s FROM Section s WHERE (:course is null OR s.id.courseCode = :course)"
			+ " AND (:year = 0 OR s.year = :year)"
			+ " AND (:semester is null OR s.semester = :semester)"
			+ " ORDER BY s.id.courseCode, s.id.sectionNo, s.year, s.semester"
	)
	List<Section> findByCourseCodeAndYearAndSemester(@Param("course") String courseCode, @Param("year") int year, @Param("semester") String semester);
}
