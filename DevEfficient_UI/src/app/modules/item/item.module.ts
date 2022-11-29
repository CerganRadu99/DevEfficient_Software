import { NgModule } from "@angular/core";
import { SharedModule } from "../shared/shared.module";
import { ItemAddComponent } from "./components/item-add/item-add.component";
import { ItemEditComponent } from "./components/item-edit/item-edit.component";
import { ItemRoutingModule } from "./item-routing.module";


@NgModule({
    declarations: [
        // ItemAddComponent,
        // ItemEditComponent   
    ],
    imports: [ItemRoutingModule, SharedModule],
    providers: []
  })
  export class ItemModule {}