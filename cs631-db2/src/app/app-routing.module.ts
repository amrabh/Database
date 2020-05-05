import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { GetstudentsComponent } from './getstudents/getstudents.component';
import { RegistrationComponent } from './registration/registration.component';

const routes: Routes = [
  { path: 'gsc', pathMatch: 'full', component: GetstudentsComponent },
  { path: 'reg', pathMatch: 'full', component: RegistrationComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
