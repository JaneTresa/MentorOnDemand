import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { UserService } from './user.service';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { IAdmin } from './IAdmin';
import { IMentor } from './IMentor';
import { IMentorReg } from './IMentorReg';
import { IMentorhome } from './IMentorhome';
import { IAddskill } from './IAddskill';
import { ISkills } from './ISkills';

@Injectable({
  providedIn: 'root'
})
export class MentorService {
  currentMentor:bigint;
  status:boolean
  mentorURL='http://localhost:29220/api/mentor';

  constructor(private http: HttpClient,private user:UserService,private route:Router) { }

  getMentorCredentials(adminname:string):Observable<{}>
  {
    return this.http.get<IAdmin>(this.mentorURL+'/'+adminname);
  }

  GetTokenMentor(username:string)
  {
    
      this.http.get('http://localhost:50017/api/'+'Auth/GetMentorToken/'+username).
      subscribe((res:any)=>{
        localStorage.setItem('token3',res.token);
        console.log(res.token);
        this.route.navigate(['Mentorhome']);
      })
    
  }


  registerMentor(regmentor:IMentorReg):Observable<{}>
  {
    {{debugger}}
    return this.http.post<IMentorReg>(this.mentorURL,regmentor);
  }

  getEmails()
 {
   return this.http.get('http://localhost:29220/api/mentor/GetEmails');
 }

readUserRequest(mentorid:bigint):Observable<{}>
{
  {{debugger}}
  return this.http.get<IMentorhome>('http://localhost:29220/api/mentor/GetMentorHome/'+mentorid);
}

addNewSkill(id:bigint,user:IAddskill):Observable<{}>
{
  debugger
  return this.http.post<IAddskill[]>('http://localhost:29220/api/mentor/AddSkill'+'/'+id,user);
}

readSkills():Observable<{}>
{
  debugger
  return this.http.get<ISkills[]>('http://localhost:29220/api/mentor/GetSkills');
}


}
