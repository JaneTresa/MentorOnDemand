import { Injectable } from '@angular/core';

import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { IUser } from './IUser';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { IRegister } from './IRegister';
import { UserHomeDetails } from './UserHomeDetails';
import { ITraining } from './ITraining';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  currentUserId:bigint;
  status:boolean;
  constructor(private http: HttpClient,private user:UserService,private route:Router) { }

   userURL='http://localhost:28726/api/user';

getUserCredentials(username:string):Observable<{}>
 {
  return this.http.get<IUser>(this.userURL+'/'+username);
 }
 GetTokenUser(username:string)
 {
  
     this.http.get('http://localhost:50017/api/'+'Auth/GetUserToken/'+username).
     subscribe((res:any)=>{
       localStorage.setItem('token2',res.token);
       console.log(res.token);
       this.route.navigate(['Userhome']);
     })
   
 }

 registerUser(regUser:IRegister):Observable<{}>
 {
  return this.http.post<IUser>('http://localhost:28726/api/user',regUser,{headers: new HttpHeaders({ 'Content-Type': 'application/json'})});
 }

 getContact()
{
  return this.http.get('http://localhost:28726/api/user/GetContact');
  
}

 getEmails()
 {
   return this.http.get('http://localhost:28726/api/user/GetEmails');
 }

 getMentorDetails():Observable<{}>
 {
  return this.http.get<UserHomeDetails[]>('http://localhost:28726/api/user/GetMentorDetails');
 }

 sendRequest(userId:bigint,mid:bigint,sid:bigint):Observable<{}>
 {
   return this.http.post<ITraining>(this.userURL+'/'+userId+'/'+mid+'/'+sid,{headers: new HttpHeaders({ 'Content-Type': 'application/json'})});
 }
}
