import { NgModule, ModuleWithProviders, SkipSelf, Optional } from '@angular/core';
import { Configuration } from './configuration';
import { HttpClient } from '@angular/common/http';


import { CourseControllerService } from './api/courseController.service';
import { DepartmentControllerService } from './api/departmentController.service';
import { RegistrationControllerService } from './api/registrationController.service';
import { SectionControllerService } from './api/sectionController.service';
import { StudentControllerService } from './api/studentController.service';

@NgModule({
  imports:      [],
  declarations: [],
  exports:      [],
  providers: [
    CourseControllerService,
    DepartmentControllerService,
    RegistrationControllerService,
    SectionControllerService,
    StudentControllerService ]
})
export class ApiModule {
    public static forRoot(configurationFactory: () => Configuration): ModuleWithProviders {
        return {
            ngModule: ApiModule,
            providers: [ { provide: Configuration, useFactory: configurationFactory } ]
        };
    }

    constructor( @Optional() @SkipSelf() parentModule: ApiModule,
                 @Optional() http: HttpClient) {
        if (parentModule) {
            throw new Error('ApiModule is already loaded. Import in your base AppModule only.');
        }
        if (!http) {
            throw new Error('You need to import the HttpClientModule in your AppModule! \n' +
            'See also https://github.com/angular/angular/issues/20575');
        }
    }
}
