import { Component, OnInit } from '@angular/core';
import { ToolbarService } from '../toolbar.service';

@Component({
  selector: 'app-toolbar',
  templateUrl: './toolbar.component.html',
  styleUrls: ['./toolbar.component.css']
})
export class ToolbarComponent implements OnInit {
  studentinfo={
  StudentId:'',
  };
  submitted=true;
  constructor(private toolbarService: ToolbarService) { }

  ngOnInit() {
  }
  savestudentinfo() {
    const data = {
      studentId: this.studentinfo.StudentId,
    };


    this.toolbarService.create(data)
      .subscribe(
        response => {
          console.log(response);
          this.submitted = true;
        },
        error => {
          console.log(error);
        });
  }

  newRegistration() {
    this.submitted = false;
    this.studentinfo= {
      StudentId:'',
    };
  } 

}
