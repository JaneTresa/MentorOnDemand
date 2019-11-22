import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';
import { UserService } from './user.service';
import { HttpClient } from '@angular/common/http';
import { IAdmin } from './IAdmin';
import { ISkills } from './ISkills';

@Injectable({
  providedIn: 'root'
})
export class AdminService {
  status:boolean
 adminURL='http://localhost:29561/api/admin';

  constructor(private http: HttpClient,private user:UserService,private route:Router) { }

  getAdminCredentials(adminname:string):Observable<{}>
  {
    return this.http.get<IAdmin>(this.adminURL+'/'+adminname);
  }
  GetTokenAdmin(username:string)
  {
    
      this.http.get('http://localhost:50017/api/'+'Auth/GetAdminToken/'+username).
      subscribe((res:any)=>{
        localStorage.setItem('token1',res.token);
        console.log(res.token);
        this.route.navigate(['Adminhome']);
      })
    
  }


  getSkills():Observable<{}>
  {{{debugger}}
    return this.http.get<ISkills[]>('http://localhost:29561/api/admin/getSkills');
  }
}
