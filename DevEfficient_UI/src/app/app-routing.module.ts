import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app-component/app.component';
import { AuthGuard } from './modules/core/guards/auth.guard';
import { LoginGuard } from './modules/core/guards/login.guard';
import { DevboardComponent } from './modules/devboard/components/devboard/devboard.component';
import { HomeComponent } from './modules/home/components/home/home.component';
import { TeamManagementComponent } from './modules/management/components/team-management/team-management.component';

const routes: Routes = [
      {
        path: 'home',
        loadChildren: () =>
          import('./modules/home/home.module').then((m) => m.HomeModule),
        canActivate: [AuthGuard],
      },
      {
        path: 'account',
        loadChildren: () =>
          import('./modules/account/account.module').then((m) => m.AccountModule),
        canActivate: [LoginGuard],
      },
      {
        path: 'devboard',
        loadChildren: () =>
          import('./modules/devboard/devboard.module').then((m) => m.DevboardModule),
      },
      {
        path: 'management',
        loadChildren: () =>
          import('./modules/management/management.module').then((m) => m.ManagementModule),
      },
      {
        path: 'item',
        loadChildren: () =>
          import('./modules/item/item.module').then((m) => m.ItemModule),
      },
      {
        path: '',
        pathMatch: 'full',
        redirectTo: 'home'
      }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
