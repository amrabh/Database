package com.njit.cs631.api.repos;

public interface RegCountRepo {

	int getSemesterRegistrationCount(int studentId, int year, String semester);
	
	int getCourseSemesterRegistrationCount(int studentId, String courseCode, int year, String semester);
}
