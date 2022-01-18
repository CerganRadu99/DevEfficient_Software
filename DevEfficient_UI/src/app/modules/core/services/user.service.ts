import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { UserModel } from '../models/user.model';

@Injectable({providedIn: 'root'})
export class UserService {
  private user = new BehaviorSubject<UserModel>(new UserModel());
  public user$ = this.user.asObservable();

  public setUser(user: UserModel): void {
    this.user.next(user);
  }
}
