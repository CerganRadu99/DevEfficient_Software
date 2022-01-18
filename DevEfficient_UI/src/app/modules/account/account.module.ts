import { NgModule } from '@angular/core';
import { SharedModule } from './../shared/shared.module';
import { AccountRoutingModule } from './account-routing.module';
import { LoginComponent } from './components/login/login.component';
import { MatchPasswordDirective } from './components/register/directives/matchPassword.directive';
import { PasswordPatternDirective } from './components/register/directives/passwordPattern.directive';
import { RegisterComponent } from './components/register/register.component';

@NgModule({
  declarations: [
    LoginComponent,
    RegisterComponent,
    PasswordPatternDirective,
    MatchPasswordDirective   
  ],
  imports: [AccountRoutingModule, SharedModule],
  providers: []
})
export class AccountModule {}
