/*
 * DepartmentRepo.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.njit.cs631.api.entities.Department;

@Repository
public interface DepartmentRepo extends JpaRepository<Department, Integer>{

}
