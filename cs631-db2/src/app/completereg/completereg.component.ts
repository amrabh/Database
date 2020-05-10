import { Component, OnInit } from '@angular/core';
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

@Component({
  selector: 'app-completereg',
  templateUrl: './completereg.component.html',
  styleUrls: ['./completereg.component.css']
})
export class CompleteregComponent implements OnInit {

  idForm: FormGroup = this.fb.group({
    courseValue: [''],
    sectionValue: [''],
    sid: ['']
  });

  loading=false;
  success=false;
  regsuccess=false;
  scd=true;
  courseSelection=false;

  errormsg: string;
  departmentCode: number;
  courseCode: string;
  semester: string;
  year: number;
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

  displayedColumns: string[] = ['instructor', 'id', 'maxEnrollment', 'registrationCount'];  
  columnsToDisplay: string[] = this.displayedColumns.slice();

  async onDeptSelection(deptValue) {
    this.departmentCode = deptValue;
    this.ccs.indexUsingGET(this.departmentCode).subscribe(res => this.courses = res);
    console.log("Department code: ", this.departmentCode)
  }

  async onCourseSelection(courseValue) {
    this.courseCode = courseValue;
    this.seccs.indexUsingGET2(this.courseCode,this.semester,this.year).subscribe(res => 
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
    this.year = yearValue;
    console.log("Year: ", this.year)
  }

  async onSectionSelection(sectionValue) {
    this.sectionNo =  sectionValue;
    console.log("Section No: ", this.sectionNo)
  }


  constructor(private scs: StudentControllerService,
    private dcs: DepartmentControllerService,
    private ccs: CourseControllerService,
    private seccs: SectionControllerService,
    private rcs: RegistrationControllerService,
    private fb: FormBuilder) { 
      this.dcs.indexUsingGET1().subscribe(res => this.departments = res);
    }  

  ngOnInit() {

  }

  get sid(){
    return this.idForm.get('sid') 
  }
   
  async submitHandler() { 
    this.loading = true;
    const sidFormValue = this.idForm.value;

    try{
      this.scs.getStudentUsingGET(sidFormValue.sid).subscribe(res => {
        this.students.push(res);
        this.mystudent = res;
        this.success = true;
        });
    }catch(err){
      console.error(err);
      this.scd=false;
    }
    this.loading = false;
  }

  async registrationSubmitHandler() { 
    this.loading = true;
    const subformValue = this.idForm.value;
  

    try{
      this.rcs.registerUsingPOST(subformValue).subscribe(res => {
        this.regresponse.push(res);
        this.regsuccess = true;
        console.log(res); 
        console.log('success');
      });
    }catch(err){
      console.error(err)
    }
    this.loading = false;
  } 
}


