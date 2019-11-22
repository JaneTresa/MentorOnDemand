import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { UserhomeComponent } from './userhome/userhome.component';
import { RegisterComponent } from './register/register.component';
import { MentorRegisterComponent } from './mentor-register/mentor-register.component';
import { AdminhomeComponent } from './adminhome/adminhome.component';
import { MentorhomeComponent } from './mentorhome/mentorhome.component';
import { AddskillComponent } from './addskill/addskill.component';


const routes: Routes = [
  {
    path:'Login',
    component:LoginComponent
    },
    {
      path:'Userhome',
      component:UserhomeComponent
      },
      {
        path:'Register',
        component:RegisterComponent
        },
        {
          path:'MentorRegister',
          component:MentorRegisterComponent
          },
          {
            path:'Adminhome',
            component:AdminhomeComponent
            },
            {
              path:'Mentorhome',
              component:MentorhomeComponent
              },
              {
                path:'Addskill',
                component:AddskillComponent
                },
               

      
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
