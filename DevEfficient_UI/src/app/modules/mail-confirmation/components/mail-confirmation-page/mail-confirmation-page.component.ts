import { Component } from "@angular/core";
import { Router } from "@angular/router";
import { Subject, takeUntil } from "rxjs";
import { LoginModel } from "src/app/modules/account/models/login.model";
import { AuthService } from "src/app/modules/core/services/auth.service";
import { TeamMemberService } from "src/app/modules/core/services/team-member.service";

@Component({
    selector: 'app-mail-confirmation',
    templateUrl: 'mail-confirmation-page.component.html',
    styleUrls: ['mail-confirmation-page.component.scss']
})
export class MailConfirmationPageComponent {

    private destroy$: Subject<boolean> = new Subject();
    public loginModel = new LoginModel();

    constructor(private authService: AuthService, private teamMemberService: TeamMemberService, public router: Router) {}

    ngOnDestroy(): void {
        this.destroy$.next(true);
        this.destroy$.complete();
      }

    public onLogin(): void {
        this.authService
          .loginFromMailConfirmation(this.loginModel)
          .pipe(takeUntil(this.destroy$))
          .subscribe((response => {
          }));
      }

    public isLoggedIn() {
        return localStorage.getItem("ROLE_KEY") !== null && localStorage.getItem("EMAIL_KEY") !== null && localStorage.getItem("USERNAME_KEY") !== null;
    }

    public onAccept() {
        const role = localStorage.getItem("ROLE_KEY");
        const email = localStorage.getItem("EMAIL_KEY");
        const username = localStorage.getItem("USERNAME_KEY");
        if(role !== null && email !== null && username !== null){ 
        this.teamMemberService.registerMember({
            name: username, 
            email: email, 
            role: role
        }).pipe(
            takeUntil(this.destroy$)
        )
        .subscribe((response) => {
            if(response !== null) {
                  if(response.succeeded) {
                      this.router.navigate(['']);
                      setTimeout(() => {
                        window.location.reload();
                      }, 100);
                  }
            }
        });    
    }
}
}