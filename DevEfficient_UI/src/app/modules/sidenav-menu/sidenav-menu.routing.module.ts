import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { DevboardComponent } from "../devboard/components/devboard/devboard.component";
import { TeamManagementComponent } from "../management/components/team-management/team-management.component";
import { CurrentSprintComponent } from "../sprint/components/currentsprint/currentsprint.component";

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