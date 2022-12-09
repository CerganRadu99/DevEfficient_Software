import { NgModule } from "@angular/core";
import { SharedModule } from "../shared/shared.module";
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