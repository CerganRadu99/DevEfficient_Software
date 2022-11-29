import { NgModule } from "@angular/core";
import { SharedModule } from "../shared/shared.module";
import { CloseSprintComponent } from "./components/close-sprint/close-sprint.component";
import { CurrentSprintComponent } from "./components/currentsprint/currentsprint.component";
import { SprintRoutingModule } from "./sprint-routing.module";

@NgModule({
    declarations: [
        CurrentSprintComponent,
        CloseSprintComponent
    ],
    imports: [SprintRoutingModule, SharedModule],
    providers: []
  })
  export class SprintModule {}