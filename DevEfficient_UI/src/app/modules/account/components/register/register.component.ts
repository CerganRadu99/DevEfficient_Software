import { Component, OnDestroy } from '@angular/core';
import { Router } from '@angular/router';
import { Subject, takeUntil } from 'rxjs';
import { AuthService } from '../../../core/services/auth.service';
import { RegisterModel } from '../../models/register.model';

@Component({
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss'],
})
export class RegisterComponent implements OnDestroy {
  private destroy$: Subject<boolean> = new Subject();
  public registerModel = new RegisterModel();

  constructor(private authService: AuthService, private router: Router) {}

  ngOnDestroy(): void {
    this.destroy$.next(true);
    this.destroy$.complete();
  }

  public onRegister(): void {
    this.authService
      .register(this.registerModel)
      .pipe(takeUntil(this.destroy$))
      .subscribe(() => {
        this.router.navigate(['account', 'login']);
      });
  }

  public onBackToLogin(): void {
    this.router.navigate(['account', 'login']);
  }
}
