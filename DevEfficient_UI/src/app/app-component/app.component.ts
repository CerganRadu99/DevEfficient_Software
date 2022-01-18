import { AuthService } from './../modules/core/services/auth.service';
import { Component } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { SidenavService } from '../modules/shared/services/sidenav.service';
import { onMainContentChange } from '../modules/shared/animations/animations';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['app.component.scss'],
  animations: [onMainContentChange]
})
export class AppComponent {
  public onSideNavChange: boolean = false;
  public constructor(public translate: TranslateService, public authService: AuthService, private _sidenavService: SidenavService) {
    this._sidenavService.sideNavState$.subscribe( res => {
      console.log(res)
      this.onSideNavChange = res;
    })
  }

  public useLanguage(language: string): void {
    this.translate.use(language);
  }

  public onLogout(): void {
    this.authService.logout();
  }
}
