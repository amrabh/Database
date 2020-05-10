import { Component, OnInit } from '@angular/core';
import { StudentControllerService } from '../rest/api/studentController.service';
import { Student } from '../rest/model/student';
import { FormBuilder, FormGroup, Validators} from '@angular/forms'

@Component({
  selector: 'app-classlist',
  templateUrl: './classlist.component.html',
  styleUrls: ['./classlist.component.css']
})
export class ClasslistComponent implements OnInit {
  classlistForm: FormGroup;
  loading=false;
  success=false;

  students: Student[] = [];
  mystudent: Student[] = [];

  displayedColumns: string[] = ['firstname', 'lastname', 'year', 'major', 'email', 'phone', 'highSchool'];
  columnsToDisplay: string[] = this.displayedColumns.slice();


  constructor(private scs: StudentControllerService,
    private fb: FormBuilder) { }

  ngOnInit() {
    this.classlistForm = this.fb.group({
      course: [''],
      section: [''],
    });
  }

  get course(){
    return this.classlistForm.get('course')
  }

  get section(){
    return this.classlistForm.get('section')
  }

  async submitHandler() {
    this.loading = true;
    const formValue = this.classlistForm.value;

    try{
      this.scs.indexUsingGET3(formValue.course, formValue.section).subscribe(res => {
        this.mystudent = res;
        this.success = true;
        console.log(res)
        });
    }catch(err){
      console.error(err)
    }
    this.loading = false;
  }


}
