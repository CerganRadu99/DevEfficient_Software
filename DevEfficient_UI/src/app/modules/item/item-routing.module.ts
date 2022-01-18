import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { ItemAddComponent } from "./components/item-add/item-add.component";

const routes: Routes = [
    {
      path: '',
      component: ItemAddComponent,
    },
];
  
  @NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule],
  })
  export class ItemRoutingModule {}