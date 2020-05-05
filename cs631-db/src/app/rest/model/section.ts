/**
 * CS 631 Project
 * Roderic Henry & Amruta Abhyankar
 *
 * OpenAPI spec version: 1.0
 * 
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 * Do not edit the class manually.
 */
import { Course } from './course';
import { Instructor } from './instructor';
import { SectionId } from './sectionId';
import { TaughtIn } from './taughtIn';

export interface Section { 
    course?: Course;
    id?: SectionId;
    instructor?: Instructor;
    maxEnrollment?: number;
    registrationCount?: number;
    semester?: string;
    taughtIn?: TaughtIn;
    year?: number;
}