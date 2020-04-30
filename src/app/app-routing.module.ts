import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RegistrationComponent } from './registration/registration.component';
import { ClasslistComponent } from './classlist/classlist.component';

const routes: Routes = [
  { path: 'reg', pathMatch: 'full', component: RegistrationComponent },
  { path: 'cls', pathMatch: 'full', component: ClasslistComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
