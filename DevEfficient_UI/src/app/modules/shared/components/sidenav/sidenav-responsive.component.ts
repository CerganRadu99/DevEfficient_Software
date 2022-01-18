import { ChangeDetectorRef, Component, NgZone, OnDestroy, OnInit } from "@angular/core";
import {MediaMatcher} from '@angular/cdk/layout';
import { SidenavService } from "../../services/sidenav.service";
import { animateText, onMainContentChange, onSideNavChange } from "../../animations/animations";
import { Router } from "@angular/router";

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
  public linkText: boolean = false;

  public pages: Page[] = [
    {name: 'Inbox', link:'some-link', icon: 'inbox'},
    {name: 'Starred', link:'some-link', icon: 'star'},
    {name: 'Send email', link:'some-link', icon: 'send'},
  ]

  constructor(private _sidenavService: SidenavService, private router: Router) { }

  onSinenavToggle() {
    this.sideNavState = !this.sideNavState
    
    setTimeout(() => {
      this.linkText = this.sideNavState;
    }, 200)
    this._sidenavService.sideNavState$.next(this.sideNavState)
  }

  public onDevboardClicked() {
    this.router.navigate(['devboard']);
  }

  public onTeamManagementClicked() {
    this.router.navigate(['management']);
  }
}