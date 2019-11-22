import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserService } from '../user.service';
import { AdminService } from '../admin.service';
import { MentorService } from '../mentor.service';
import { IAdmin } from '../IAdmin';
import { ISkills } from '../ISkills';
import { AuthService } from '../auth.service';

@Component({
  selector: 'app-adminhome',
  templateUrl: './adminhome.component.html',
  styleUrls: ['./adminhome.component.css']
})
export class AdminhomeComponent implements OnInit {
admin:ISkills[]=null;
  constructor(private userService:UserService,private _router: Router,private auth:AuthService,private adminService:AdminService,private mentorService:MentorService) { }

  ngOnInit() {
   
    this.adminService.getSkills().subscribe(x=>{this.admin=x as ISkills[]});
  }
  logout()
  {
    localStorage.removeItem('token1');
  this.auth.logout();
  }

}
