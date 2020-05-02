/*
 * RegistrationRepo.java
 * Author: Roderic Henry
 * 04/25/2020
 */
package com.njit.cs631.api.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.njit.cs631.api.entities.Registration;
import com.njit.cs631.api.entities.RegistrationId;

@Repository
public interface RegistrationRepo extends JpaRepository<Registration, RegistrationId>, RegCountRepo {

}
