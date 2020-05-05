import { Component, OnInit } from '@angular/core';
import { StudentControllerService } from '../rest/api/studentController.service';
import { Student } from '../rest/model/student';
import { FormBuilder, FormGroup, Validators} from '@angular/forms'

@Component({
  selector: 'app-getstudents',
  templateUrl: './getstudents.component.html',
  styleUrls: ['./getstudents.component.css']
})
export class GetstudentsComponent implements OnInit {
  idForm: FormGroup;
  loading=false;
  success=false;

  students: Student[] = [];
  mystudent: any;

  constructor(private scs: StudentControllerService,
    private fb: FormBuilder) { }

  ngOnInit() {
    this.idForm = this.fb.group({
      sid: ['']
    });

  }

  get sid(){
    return this.idForm.get('sid')
  }
  
  async submitHandler() {
    this.loading = true;
    const formValue = this.idForm.value;

    try{
      this.scs.getStudentUsingGET(formValue.sid).subscribe(res => {
        this.students.push(res);
        this.mystudent = res;
        this.success = true;
        });
    }catch(err){
      console.error(err)
    }
    this.loading = false;
  }

}