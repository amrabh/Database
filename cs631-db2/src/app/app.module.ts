import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { GetstudentsComponent } from './getstudents/getstudents.component';
import { environment } from 'src/environments/environment';
import { ApiModule } from './rest/api.module';
import { BASE_PATH } from './rest/variables';
import { HttpClientModule } from '@angular/common/http';
import { MatToolbarModule, MatButtonModule, MatSidenavModule, MatIconModule, MatListModule, MatFormFieldModule, MatOptionModule, MatSelectModule, MatInputModule, MatCardModule, MatTabsModule, MatTableModule } from '@angular/material';
import { LayoutModule } from '@angular/cdk/layout';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { RegistrationComponent } from './registration/registration.component';
import { ErrorHandler } from '@angular/router/src/router';
import { ClasslistComponent } from './classlist/classlist.component';


@NgModule({
  declarations: [
    AppComponent,
    GetstudentsComponent,
    RegistrationComponent,
    ClasslistComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    ApiModule,
    HttpClientModule,
    LayoutModule,
    MatToolbarModule,
    MatButtonModule,
    MatSidenavModule,
    MatIconModule,
    MatListModule,
    MatFormFieldModule,
    MatOptionModule,
    MatSelectModule,
    MatInputModule,
    MatCardModule,
    MatTabsModule,
    ReactiveFormsModule,
    FormsModule,
    MatTableModule
  ],
  providers: [{ provide: BASE_PATH, useValue: environment.API_BASE_PATH }],
  bootstrap: [AppComponent]
})
export class AppModule { }
