import { CommonModule } from "@angular/common";
import { NgModule } from "@angular/core";
import { ItemAddComponent } from "../item/components/item-add/item-add.component";
import { ItemEditComponent } from "../item/components/item-edit/item-edit.component";
import { SharedModule } from "../shared/shared.module";
import { DevboardComponent } from "./components/devboard/devboard.component";
import { SprintAddComponent } from "./components/sprint/sprint-add/sprint-add.component";
import { SprintComponent } from "./components/sprint/sprint.component";
import { DevboardRoutingModule } from "./devboard-routing.module";

@NgModule({
    declarations: [
        DevboardComponent,
        SprintComponent,
        SprintAddComponent,
        ItemEditComponent,   
        ItemAddComponent
    ],
    imports: [DevboardRoutingModule, SharedModule, CommonModule]
  })
  export class DevboardModule {}