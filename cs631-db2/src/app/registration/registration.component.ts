import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder } from '@angular/forms';
import { Course } from '../rest/model/course';
import { CourseControllerService } from '../rest/api/courseController.service';
import { Section } from '../rest/model/section';
import { SectionControllerService } from '../rest/api/sectionController.service';
import { Instructor } from '../rest/model/instructor';
import { RegistrationControllerService } from '../rest/api/registrationController.service';
import { RegResponseModel } from '../rest/model/regResponseModel';

@Component({
  selector: 'app-registration',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.css']
})
export class RegistrationComponent implements OnInit {
  regForm: FormGroup;
  sectionForm: FormGroup;
  submissionForm: FormGroup;
  loading=false;
  success=false;
  sectionsuccess=false;
  regsuccess=false;
  selectedValue: string;

  cdisplayedColumns: string[] = ['code', 'name', 'credit', 'taHrReq', 'departmentCode'];
  ccolumnsToDisplay: string[] = this.cdisplayedColumns.slice();

  sdisplayedColumns: string[] = ['instructor', 'id', 'maxEnrollment', 'registrationCount'];
  scolumnsToDisplay: string[] = this.sdisplayedColumns.slice();

  mycourse: Course[] = [];
  mysection: Section[] = [];
  instructor: string;
  regresponse: RegResponseModel[] = [];

  constructor(private ccs: CourseControllerService,
    private scs: SectionControllerService,
    private rcs: RegistrationControllerService,
    private fb: FormBuilder) { }

  ngOnInit() {
    this.regForm = this.fb.group({
      deptId: ['']
    });

    this.sectionForm = this.fb.group({
      courseId: [''],
      semester: [''],
      year: ['']
    });

    this.submissionForm = this.fb.group({
      courseIdd: [''],
      sectionNo: [''],
      studentId: ['']
    });

  }

  get deptId(){
    return this.regForm.get('sid')
  }

  get courseId(){
    return this.sectionForm.get('courseId')
  }

  get semester(){
    return this.sectionForm.get('semester')
  }

  get year(){
    return this.sectionForm.get('year')
  }

  get sectionNo(){
    return this.sectionForm.get('sectionNo')
  }

  get courseIdd(){
    return this.sectionForm.get('courseIdd')
  }

  get studentId(){
    return this.sectionForm.get('studentId')
  }

  async regFormsubmitHandler() {
    this.loading = true;
    const formValue = this.regForm.value;

    try{
      this.ccs.indexUsingGET(formValue.deptId).subscribe(res => {
        this.mycourse = res;
        this.success = true;
        console.log(res)
        });
    }catch(err){
      console.error(err)
    }
    this.loading = false;
  }

  async sectionFormsubmitHandler() {
    this.loading = true;
    const formValue = this.sectionForm.value;

    try{
      this.scs.indexUsingGET2(formValue.courseId,formValue.semester,formValue.year).subscribe(res => {
        this.mysection = res;
        this.sectionsuccess = true;
        console.log(res);
        this.instructor = (JSON.stringify(res));
        console.log(this.instructor);
        console.log(JSON.parse(JSON.stringify(res[0])));
      });
    }catch(err){
      console.error(err)
    }
    this.loading = false;
  } 

  async submissionFormsubmitHandler() {
    this.loading = true;
    const subformValue = this.submissionForm.value;

    try{
      this.rcs.registerUsingPOST(subformValue).subscribe(res => {
        this.regresponse.push(res);
        this.regsuccess = true;
        console.log(res);
      });
    }catch(err){
      console.error(err)
    }
    this.loading = false;
  } 

}