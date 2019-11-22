import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserService } from '../user.service';
import { AdminService } from '../admin.service';
import { MentorService } from '../mentor.service';
import { IAdmin } from '../IAdmin';
import { IMentor } from '../IMentor';
import { IUser } from '../IUser';
import { IRegister } from '../IRegister';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  user:IRegister

  flag:boolean=true
  admin:IAdmin;
  mentor:IMentor;
  useremail:string;
  usercontact:bigint
  contacts:bigint[]
  emails:string[];



  constructor(private userService:UserService,private _router: Router,private adminService:AdminService,private mentorService:MentorService) { }



  addUser(user:IRegister)
  {
    {{debugger}}
    this.userService.registerUser(user).subscribe();
  }

  
  
  


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
  

 UniqueContact(contact:bigint):boolean
 {
   if(contact==undefined)
   {
     return false;
   }
   this.usercontact=this.contacts.find(x=>x==contact);
   if(this.usercontact==undefined)
   {
     return false;
   }
   else 
   {
     return true;
   }
 }

  ngOnInit() {

    this.user={
      
     
      email:null,
      pass:null,
      firstName:null,
      lastName:null,
      contact:null,
      regDatetime:null,
     
    }

    this.userService.getEmails().subscribe(result=>{this.emails=result as string[],console.log(this.emails),this.getContacts()} )
  }

  getContacts()
  {
   this.userService.getContact().subscribe(result=>{this.contacts=result as bigint[],console.log(this.contacts)} )
  
  }
 

}
