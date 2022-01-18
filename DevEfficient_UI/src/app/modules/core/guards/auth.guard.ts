import { Injectable } from '@angular/core';
import { CanActivate } from '@angular/router';
import { AuthService } from '../services/auth.service';

@Injectable({
    providedIn: 'root',
})
export class AuthGuard implements CanActivate {
    constructor(private authService: AuthService) {}

    public canActivate(): boolean {
        if (!this.authService.isLoggedIn()) {
            this.authService.logout();

            return false;
        }

        return true;
    }
}
