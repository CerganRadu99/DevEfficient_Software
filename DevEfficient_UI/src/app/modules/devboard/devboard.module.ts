import { NgModule } from "@angular/core";
import { SharedModule } from "../shared/shared.module";
import { DevboardComponent } from "./components/devboard/devboard.component";
import { SprintAddComponent } from "./components/sprint/sprint-add/sprint-add.component";
import { SprintComponent } from "./components/sprint/sprint.component";
import { DevboardRoutingModule } from "./devboard-routing.module";

@NgModule({
    declarations: [
        DevboardComponent,
        SprintComponent,
        SprintAddComponent   
    ],
    imports: [DevboardRoutingModule, SharedModule],
    providers: []
  })
  export class DevboardModule {}