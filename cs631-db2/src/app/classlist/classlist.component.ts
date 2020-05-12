import { Component, OnInit, ViewChild } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { StudentControllerService } from '../rest/api/studentController.service';
import { Student } from '../rest/model/student';
import { Course } from '../rest/model/course';
import { CourseControllerService } from '../rest/api/courseController.service';
import { Section } from '../rest/model/section';
import { SectionControllerService } from '../rest/api/sectionController.service';
import { Instructor } from '../rest/model/instructor';
import { RegistrationControllerService } from '../rest/api/registrationController.service';
import { RegResponseModel } from '../rest/model/regResponseModel';
import { DepartmentControllerService } from '../rest/api/departmentController.service';
import { Department } from '../rest/model/department';
import { HttpErrorResponse } from '@angular/common/http';
import { throwError } from 'rxjs';
import {MatSort} from '@angular/material/sort';
import {MatTableDataSource} from '@angular/material/table';

@Component({
  selector: 'app-classlist',
  templateUrl: './classlist.component.html',
  styleUrls: ['./classlist.component.css']
})
export class ClasslistComponent implements OnInit {

  idForm: FormGroup = this.fb.group({
    courseValue: [''],
    sectionValue: [''],
    sid: ['']
  });

  loading=false;
  success=false;
  sectionsuccess=false;
  scd=true;
  courseSelection=false;

  errormsg: string;
  departmentCode: number;
  courseCode: string;
  semester: string = "Fall";
  selectedYear: string = "2020";
  crscode: number;
  mystring: string;
  instrname: Instructor[] = [];
  
  students: Student[] = [];
  mystudent: any;
  departments: Department[] = [];
  courses: Course[] = [];
  course: Course[] = [];
  departmentValue: any;
  courseValue: string;
  sectionValue: any;
  instructorValue: any;
  sections: Section[] =[]; 
  instructor: Instructor[] = [];
  regresponse: RegResponseModel[] = [];
  sectionNo: number;
  time: number;
  
  //displayedColumns: string[] = ['instructor', 'id', 'maxEnrollment', 'registrationCount'];  
  displayedColumns: string[] = ['lastname', 'firstname', 'id', 'major', 'year'];
  columnsToDisplay: string[] = this.displayedColumns.slice();

  selectedCourse: Course;
  selectedSection: Section;
  processing:number[] = [];

  async onDeptSelection(deptValue) {
    //this.departmentCode = deptValue;
    this.ccs.indexUsingGET(this.departmentValue).subscribe(res => this.courses = res);
    console.log("Department code: ", this.departmentValue)
  }

  async onCourseSelection() {
    this.courseCode = this.selectedCourse.code;
    this.seccs.indexUsingGET2(this.courseCode,this.semester, parseInt(this.selectedYear)).subscribe(res => 
      {
        this.sections = res;
        this.courseSelection = true;
        console.log(this.sections);
      });
    console.log("Course code: ", this.courseCode);
  }

  async onSemesterSelection(semesterValue) {
    this.semester = semesterValue;
    console.log("Semester: ", this.semester)
  }

  async onYearSelection(yearValue) {
    console.log("Year: ", this.selectedYear);
  }

  async onSectionSelection(sectionValue) {
    this.sectionNo = sectionValue.id.sectionNo;
    try{
      this.scs.indexUsingGET3(this.courseCode, this.sectionNo).subscribe(res => {
        this.mystudent = res;
        console.log(this.mystudent)
        this.sectionsuccess = true;
        });
    }catch(err){
      console.error(err);
      this.scd=false;
    }
    console.log("Section No: ", this.sectionNo)
  }

  constructor(private scs: StudentControllerService,
    private dcs: DepartmentControllerService,
    private ccs: CourseControllerService,
    private seccs: SectionControllerService,
    private fb: FormBuilder) { 
      this.dcs.indexUsingGET1().subscribe(res => this.departments = res);
    }  

  ngOnInit() { 
  }
}
