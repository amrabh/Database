import { Component, OnInit } from '@angular/core';
import { RegistrationService } from '../registration.service';


@Component({
  selector: 'app-registration',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.css']
})
export class RegistrationComponent implements OnInit {
  registration={
    semester:'',
    subject:'',
    course:'',
    section:'',
    registered:false
  };
  submitted=false;

  constructor(private registrationService: RegistrationService) { }
  ngOnInit() {
  }
  saveRegistration() {
    const data = {
      semester: this.registration.semester,
      subject: this.registration.subject,
      course: this.registration.course,
      section: this.registration.section
    };

    this.registrationService.create(data)
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
    this.registration = {
      semester:'',
      subject:'',
      course:'',
      section:'',     
      registered: false
    };
  }

} 
