import { Component, OnInit } from '@angular/core';
import { UserService } from '../user.service';
import { Router } from '@angular/router';
import { AdminService } from '../admin.service';
import { MentorService } from '../mentor.service';
import { IAddskill } from '../IAddskill';
import { ISkills } from '../ISkills';
import { AuthService } from '../auth.service';

@Component({
  selector: 'app-addskill',
  templateUrl: './addskill.component.html',
  styleUrls: ['./addskill.component.css']
})
export class AddskillComponent implements OnInit {

  
  user:IAddskill={};
  skill:ISkills[]=[];
  constructor(private userService:UserService,private _router: Router,private auth:AuthService,private adminService:AdminService,private mentorService:MentorService) { }
add(user:IAddskill)
{{{debugger}}
  this.mentorService.addNewSkill(this.mentorService.currentMentor,user).subscribe();
 
}


  ngOnInit() {
    
    this.mentorService.readSkills().subscribe(x=>{
      debugger
      this.skill=x as ISkills[],console.log(this.skill)})
  }

  logout()
  {
    localStorage.removeItem('token3');
  this.auth.logout();
  }

}
