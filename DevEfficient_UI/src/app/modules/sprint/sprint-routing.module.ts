import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { DevboardComponent } from "../devboard/components/devboard/devboard.component";
import { CurrentSprintComponent } from "./components/currentsprint/currentsprint.component";

const routes: Routes = [
    {
      path: '',
      component: CurrentSprintComponent
    },
    {
        path: 'devboard',
        component: DevboardComponent
    }
  ];
  
  @NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule],
  })
  export class SprintRoutingModule {}