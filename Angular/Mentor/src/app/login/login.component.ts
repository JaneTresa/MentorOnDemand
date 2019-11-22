import { Component, OnInit } from '@angular/core';
import { UserService } from '../user.service';
import { Router, RouterLink } from '@angular/router';
import { IUser } from '../IUser';
import { AdminService } from '../admin.service';
import { IAdmin } from '../IAdmin';
import { MentorService } from '../mentor.service';
import { IMentor } from '../IMentor';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  user:IUser;
  flag:boolean;
  msg:string;  
  passmsg:string;
  admin:IAdmin;
  mentor:IMentor;
  constructor(private userService:UserService,private _router: Router,private adminService:AdminService,private mentorService:MentorService) { }

  userValid(username:string,role:string)
  {
    if(role=='User')
    {
    this.userService.getUserCredentials(username).subscribe((x:IUser)=>{
    
      debugger
  this.user=x ;
if(this.user==null)
{
  this.flag=true;
 this.msg="Invalid Username";
} 
else if(this.user!=null)
{
  this.flag=false;
  this.msg=" ";
}
this.userService.currentUserId=this.user.userId;
   }   );
  }
  else if(role=='Mentor')
  {
    this.mentorService.getMentorCredentials(username).subscribe((x:IMentor)=>{
    
      debugger
  this.mentor=x ;
if(this.mentor==null)
{
  this.flag=true;
 this.msg="Invalid Username";
}
else if(this.mentor!=null)
{
  this.flag=false;
  this.msg=" ";
}
this.mentorService.currentMentor=this.mentor.mid;
   }   );
  }
  else if(role=='Admin')
  {
    this.adminService.getAdminCredentials(username).subscribe((x:IAdmin)=>{
    
      debugger
  this.admin=x ;
if(this.admin==null)
{
  this.flag=true;
 this.msg="Invalid Username";
}
else if(this.admin!=null)
{
  this.flag=false;
  this.msg=" ";
}

   }   );
  }
  }

  onSubmit(password:string,role:string)
  {
    {{debugger}}
    if(role=="User")
    {
    if(this.user.pass!=password)
    {
this.passmsg="Incorrect Password"
    }
    else{
      this.userService.GetTokenUser(this.user.email);
    
    }
  }
  else if(role=="Mentor")
  {
    if(this.mentor.password!=password)
    {
this.passmsg="Incorrect Password"
    }
    else{
      this.mentorService.GetTokenMentor(this.mentor.userName);
      
    }
  }
     else if(role=="Admin")
     {
      if(this.admin.adPassword!=password)
     {
 this.passmsg="Incorrect Password"
     }
     else{
       this.adminService.GetTokenAdmin(this.admin.adUsername);
       
       }
    }
  }
  ngOnInit() {
  }
  }




  


