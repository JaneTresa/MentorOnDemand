import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { UserhomeComponent } from './userhome/userhome.component';

import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { RegisterComponent } from './register/register.component';
import { MentorRegisterComponent } from './mentor-register/mentor-register.component';
import { AdminhomeComponent } from './adminhome/adminhome.component';
import { FilterPipe } from './search';
import { MentorhomeComponent } from './mentorhome/mentorhome.component';
import { AddskillComponent } from './addskill/addskill.component';


@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    UserhomeComponent,
    RegisterComponent,
    MentorRegisterComponent,
    AdminhomeComponent,
    FilterPipe,
    MentorhomeComponent,
    AddskillComponent,
    
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule
   
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
