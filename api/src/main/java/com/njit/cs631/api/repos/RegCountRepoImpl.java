package com.njit.cs631.api.repos;

import java.math.BigInteger;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

@Repository
public class RegCountRepoImpl implements RegCountRepo {

	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
	public int getSemesterRegistrationCount(int studentId, int year, String semester) {
		Query q = entityManager.createNativeQuery("SELECT COUNT(*) FROM registration r "
			+ "JOIN section s ON s.Course_Code = r.Course_Code "
			+ "AND s.Sec_No = r.Sec_No "
			+ "WHERE r.Student_Id = :sid "
			+ "AND s.Year = :year "
			+ "AND s.Semester = :semester");
		q.setParameter("sid", studentId);
		q.setParameter("year", year);
		q.setParameter("semester", semester);
		
		int count = ((BigInteger) q.getSingleResult()).intValue();
		
		return count;	
	}

	@Override
	public int getCourseSemesterRegistrationCount(int studentId, String courseCode, int year, String semester) {
		Query q = entityManager.createNativeQuery("SELECT COUNT(*) FROM registration r "
			+ "JOIN section s ON s.Course_Code = r.Course_Code "
			+ "AND s.Sec_No = r.Sec_No "
			+ "WHERE r.Student_Id = :sid "
			+ "AND r.Course_Code = :course "
			+ "AND s.Year = :year "
			+ "AND s.Semester = :semester");
		q.setParameter("sid", studentId);
		q.setParameter("course", courseCode);
		q.setParameter("year", year);
		q.setParameter("semester", semester);
			
		int count = ((BigInteger) q.getSingleResult()).intValue();
		
		return count;	
	}

}
