/* eslint-disable no-debugger */
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { onMainContentChange } from 'src/app/modules/shared/animations/animations';
import { SidenavService } from 'src/app/modules/shared/services/sidenav.service';
import { environment } from 'src/environments/environment';

@Component({
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
  animations: [onMainContentChange]
})
export class HomeComponent implements OnInit {
  public appVersion = environment.appSettings.version;
  public onSideNavChange: boolean = false;

  constructor(private _sidenavService: SidenavService, private router: Router) {
    this._sidenavService.sideNavState$.subscribe( res => {
      console.log(res)
      this.onSideNavChange = res;
    })
  }
  ngOnInit(): void {
    if(localStorage.getItem("demo") !== null) {
      window.location.reload();
      localStorage.removeItem("demo");
    }
  }
}
