import { Injectable } from '@angular/core';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private router:Router) { }
  loggedIn=false;
  logout():void{
    
    this.loggedIn=false;
    this.router.navigate(['Login']);
  }
  login():void{
    this.loggedIn=true;
  }
}
