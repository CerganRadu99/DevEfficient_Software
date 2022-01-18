/* eslint-disable no-debugger */
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { map, Observable, tap } from 'rxjs';
import { LoginModel } from '../../account/models/login.model';
import { RegisterModel } from '../../account/models/register.model';
import { ResponseModel } from '../../shared/dtos/ResponseModel';
import { LoginResponseModel } from '../models/login-response.model';
import { DataService } from './data.service';
import { UserService } from './user.service';

@Injectable({providedIn: 'root'})
export class AuthService extends DataService {
  constructor(public http: HttpClient, private router: Router, private userService: UserService) {
    super(http, 'account');
  }

  public login(userCredentials: LoginModel): Observable<ResponseModel<LoginResponseModel>> {
    return super
      .post<ResponseModel<LoginResponseModel>>('login', userCredentials)
      .pipe(
        tap(login => {
        if(login.succeeded) {
          this.setJwt(login.data.accessToken);
        // this.userService.setUser({id: login.id, fullName: login.fullName})
        localStorage.setItem("demo", "demo");
         this.router.navigate(['']);
        }        
      }));
  }

  public register(registerDetails: RegisterModel): Observable<void> {
    const path = `register`;

    return super
      .post<void>(path, registerDetails);
  }

  public logout(): void {
    sessionStorage.removeItem('token');
    this.router.navigate(['account', 'login']);
  }

  public isLoggedIn(): boolean {
    return !!this.getJwt();
  }

  private setJwt(tokens: string): void {
    sessionStorage.setItem('token', tokens);
  }

  public getJwt(): string | null {
    return sessionStorage.getItem('token');
  }
}
