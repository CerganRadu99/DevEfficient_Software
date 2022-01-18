import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { TeamManagementComponent } from "./components/team-management/team-management.component";

const routes: Routes = [
    {
      path: '',
      component: TeamManagementComponent,
    },
  ];
  
  @NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule],
  })
  export class ManagementRoutingModule {}