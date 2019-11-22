import { Component, OnInit } from '@angular/core';
import { UserService } from '../user.service';
import { Router } from '@angular/router';
import { AdminService } from '../admin.service';
import { MentorService } from '../mentor.service';
import { UserHomeDetails } from '../UserHomeDetails';
import { AuthService } from '../auth.service';

@Component({
  selector: 'app-userhome',
  templateUrl: './userhome.component.html',
  styleUrls: ['./userhome.component.css']
})
export class UserhomeComponent implements OnInit {
  searchKey:string;
  mentorDetails:UserHomeDetails[]=null;
  constructor(private userService:UserService,private _router: Router,private adminService:AdminService,private mentorService:MentorService,private auth:AuthService) { }
sendReq(mid:bigint,sid:bigint)
{
 
  this.userService.sendRequest(this.userService.currentUserId ,mid,sid).subscribe();
}


  ngOnInit() {
  
    this.userService.getMentorDetails().subscribe(x=>{this.mentorDetails=x as UserHomeDetails[]});
  }


  logout()
  {
    localStorage.removeItem('token2');
  this.auth.logout();
  }
}
