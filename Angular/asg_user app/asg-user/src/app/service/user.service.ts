import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { IUser } from '../user/Iuser';

@Injectable({
  providedIn: 'root'
})
export class UserService {
//http://localhost:3000/userapi/
  private user_urls = "http://localhost:3000/userapi";
  httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' })
  };
  constructor(private httpclient:HttpClient) { }
  getUsers():Observable<IUser[]>{
    return this.httpclient.get<IUser[]>(this.user_urls);
  }
}
