import { Component, OnInit } from '@angular/core';
import { StudentControllerService } from '../rest/api/studentController.service';
import { Student } from '../rest/model/student';

@Component({
  selector: 'app-getstudents',
  templateUrl: './getstudents.component.html',
  styleUrls: ['./getstudents.component.css']
})
export class GetstudentsComponent implements OnInit {

  students: Student[] = [];
  id: number = 10;

  constructor(private scs: StudentControllerService) { }

  ngOnInit() {
    this.scs.getStudentUsingGET(this.id).subscribe(res => {
      for (var i in res) {
      this.students.push(res[i]);
      }
      });
  }

}
