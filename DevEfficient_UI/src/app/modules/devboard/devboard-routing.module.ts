import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { DevboardComponent } from "./components/devboard/devboard.component";

const routes: Routes = [
    {
      path: '',
      component: DevboardComponent
    },
  ];
  
  @NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule],
  })
  export class DevboardRoutingModule {}