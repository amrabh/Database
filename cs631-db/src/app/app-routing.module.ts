import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ToolbarComponent } from './toolbar/toolbar.component';
import { RegistrationComponent } from './registration/registration.component';
import { ClasslistComponent } from './classlist/classlist.component';
import { GetstudentsComponent } from './getstudents/getstudents.component';

const routes: Routes = [
  {path: '', redirectTo: 'toolbar', pathMatch: 'full' },
  { path: 'toolbar', component: ToolbarComponent },
  { path: 'reg', pathMatch: 'full', component: RegistrationComponent },
  { path: 'cls', pathMatch: 'full', component: ClasslistComponent },
  { path: 'gsc', pathMatch: 'full', component: GetstudentsComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
