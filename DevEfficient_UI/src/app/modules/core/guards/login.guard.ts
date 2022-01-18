import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

@Injectable({
    providedIn: 'root',
})
export class LoginGuard implements CanActivate {
    constructor(private authSrv: AuthService, private router: Router) {}

    public canActivate(): boolean {
        if (this.authSrv.isLoggedIn()) {
            this.router.navigate(['']);

            return false;
        }

        return true;
    }
}
