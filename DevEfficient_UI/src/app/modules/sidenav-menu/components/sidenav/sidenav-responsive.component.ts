import { ChangeDetectorRef, Component, NgZone, OnDestroy, OnInit } from "@angular/core";
import {MediaMatcher} from '@angular/cdk/layout';
import { SidenavService } from "../../../shared/services/sidenav.service";
import { animateText, onMainContentChange, onSideNavChange } from "../../../shared/animations/animations";
import { Router } from "@angular/router";
import { AuthService } from "src/app/modules/core/services/auth.service";

interface Page {
  link: string;
  name: string;
  icon: string;
}

@Component ({
    selector: 'app-sidenav-responsive',
    templateUrl: 'sidenav-responsive.component.html',
    styleUrls: ['sidenav-responsive.component.scss'],
    animations: [onSideNavChange, animateText]
})
export class SidenavResponsiveComponent {
  public sideNavState: boolean = false;
  public linkText: boolean = true;

  public pages: Page[] = [
    {name: 'Inbox', link:'some-link', icon: 'inbox'},
    {name: 'Starred', link:'some-link', icon: 'star'},
    {name: 'Send email', link:'some-link', icon: 'send'},
  ]

  constructor(private _sidenavService: SidenavService, private router: Router, public authService: AuthService) { }

  onSinenavToggle() {
    this.sideNavState = !this.sideNavState
    
    // setTimeout(() => {
    //   this.linkText = this.sideNavState;
    // }, 200)
    this._sidenavService.sideNavState$.next(this.sideNavState);
  }

  public onDevboardClicked() {
    this.onSinenavToggle();
    this.router.navigate(['/devboard']);
  }

  public onCurrentSprintClicked() {
    this.onSinenavToggle();
    this.router.navigate(['/sprint']);
  }

  public onTeamManagementClicked() {
    this.onSinenavToggle();
    this.router.navigate(['/management']);
  }

  public isAdmin() {
    const role = localStorage.getItem("ROLE_KEY");
    return role === "Admin";
  }
  public onLogout(): void {
    debugger;
    // this.opened = false;
    this._sidenavService.sideNavState$.next(false);
    this.authService.logout();
  }
}