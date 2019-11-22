import { Component, OnInit } from '@angular/core';
import { UserService } from '../user.service';
import { Router } from '@angular/router';
import { AdminService } from '../admin.service';
import { MentorService } from '../mentor.service';
import { IMentorhome } from '../IMentorhome';
import { AuthService } from '../auth.service';

@Component({
  selector: 'app-mentorhome',
  templateUrl: './mentorhome.component.html',
  styleUrls: ['./mentorhome.component.css']
})
export class MentorhomeComponent implements OnInit {

  mentor:IMentorhome[]=null;
  constructor(private userService:UserService,private _router: Router,private adminService:AdminService,private mentorService:MentorService,private auth:AuthService) { }



  ngOnInit() {
  
    this.mentorService.readUserRequest(this.mentorService.currentMentor).subscribe(x=>{this.mentor=x as IMentorhome[]});
  }
  logout()
  {
    localStorage.removeItem('token3');
  this.auth.logout();
  }

}
