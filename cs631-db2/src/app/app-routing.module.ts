import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CompleteregComponent } from './completereg/completereg.component';

const routes: Routes = [
  { path: '', pathMatch: 'full', component: CompleteregComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
