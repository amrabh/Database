/*
 * DepartmentController.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.njit.cs631.api.entities.Department;
import com.njit.cs631.api.repos.DepartmentRepo;

@RestController
public class DepartmentController {

	@Autowired
	private DepartmentRepo departmentRepo;
		
	@GetMapping("/departments")
    public List<Department> index(){
        return departmentRepo.findAll(Sort.by("name").ascending());
    }
	
}
