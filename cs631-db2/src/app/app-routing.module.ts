import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { GetstudentsComponent } from './getstudents/getstudents.component';
import { RegistrationComponent } from './registration/registration.component';
import { ClasslistComponent } from './classlist/classlist.component';

const routes: Routes = [
  { path: 'gsc', pathMatch: 'full', component: GetstudentsComponent },
  { path: 'reg', pathMatch: 'full', component: RegistrationComponent },
  { path: 'cls', pathMatch: 'full', component: ClasslistComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
