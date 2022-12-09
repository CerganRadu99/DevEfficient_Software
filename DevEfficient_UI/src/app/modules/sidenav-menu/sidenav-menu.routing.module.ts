import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";

const routes: Routes = [
    // {
    //   path: 'management',
    //   component: TeamManagementComponent
    // },
    // {
    //     path: 'devboard',
    //     component: DevboardComponent
    // },
    // {
    // path: 'sprint',
    // component: CurrentSprintComponent
    // },
  ];
  
  @NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule],
  })
  export class SidenavRoutingModule {}