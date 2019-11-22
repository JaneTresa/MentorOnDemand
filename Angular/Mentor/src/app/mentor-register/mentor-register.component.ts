import { Component, OnInit } from '@angular/core';
import { UserService } from '../user.service';
import { Router } from '@angular/router';
import { AdminService } from '../admin.service';
import { MentorService } from '../mentor.service';
import { IMentorReg } from '../IMentorReg';

@Component({
  selector: 'app-mentor-register',
  templateUrl: './mentor-register.component.html',
  styleUrls: ['./mentor-register.component.css']
})
export class MentorRegisterComponent implements OnInit {

  user:IMentorReg={
    mname:null,
userName:null,
linkedinUrl:null,
redDatetime:null,

yearsOfExperience:null,

password:null
  }

  flag:boolean=true

  useremail:string;
  usercontact:bigint
  contacts:bigint[]
  emails:string[];



  constructor(private userService:UserService,private _router: Router,private adminService:AdminService,private mentorService:MentorService) { }

  Unique(email:string):boolean
 {
   if(email==" ")
   {
     return false;
   }
   this.useremail=this.emails.find(x=>x==email);
   if(this.useremail==undefined)
   {
     return false;
   }
   else 
   {
     return true;
   }
 }
  

 addMentor(user:IMentorReg)
 {
    this.mentorService.registerMentor(user).subscribe();
  }

  ngOnInit() {

    this.user={
      
     
      mname:null,
      userName:null,
      linkedinUrl:null,
      redDatetime:null,
      
      yearsOfExperience:null,
      
      password:null
     
    }

    this.mentorService.getEmails().subscribe(result=>{this.emails=result as string[],console.log(this.emails)} )
  }

 

}

