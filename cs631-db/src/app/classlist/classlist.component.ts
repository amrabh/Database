import { Component, OnInit } from '@angular/core';
import { RegistrationService } from '../registration.service';

@Component({
  selector: 'app-classlist',
  templateUrl: './classlist.component.html',
  styleUrls: ['./classlist.component.css']
})
export class ClasslistComponent implements OnInit {

  registrations: any;
  currentRegistration=null
  currentIndex=-1
  semester:'';
  subject:'';
  course:'';
  section:'';

  constructor( private registrationService: RegistrationService ) { }

  ngOnInit() {
    this.retrieveRegistrations();
  }
  retrieveRegistrations() {
    this.registrationService.getAll()
      .subscribe(
        data => {
          this.registrations = data;
          console.log(data);
        },
        error => {
          console.log(error);
        });
  }

  refreshList() {
    this.retrieveRegistrations();
    this.currentRegistration = null;
    this.currentIndex = -1;
  }

  setActiveTutorial(tutorial, index) {
    this.currentRegistration= tutorial;
    this.currentIndex = index;
  }

  removeAllTutorials() {
    this.registrationService.deleteAll()
      .subscribe(
        response => {
          console.log(response);
          this.retrieveRegistrations();
        },
        error => {
          console.log(error);
        });
  }

  searchSemester() {
    this.registrationService.findByTitle(this.semester)
      .subscribe(
        data => {
          this.registrations = data;
          console.log(data);
        },
        error => {
          console.log(error);
        });
  }
  searchSubject() {
    this.registrationService.findByTitle(this.subject)
      .subscribe(
        data => {
          this.registrations = data;
          console.log(data);
        },
        error => {
          console.log(error);
        });
  }
  searchCourse() {
    this.registrationService.findByTitle(this.course)
      .subscribe(
        data => {
          this.registrations = data;
          console.log(data);
        },
        error => {
          console.log(error);
        });
  }
  searchSection() {
    this.registrationService.findByTitle(this.section)
      .subscribe(
        data => {
          this.registrations = data;
          console.log(data);
        },
        error => {
          console.log(error);
        });
  }




}
