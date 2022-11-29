import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { DevboardComponent } from "../devboard/components/devboard/devboard.component";
import { MailConfirmationPageComponent } from "./components/mail-confirmation-page/mail-confirmation-page.component";

const routes: Routes = [
    {
      path: '',
      component: MailConfirmationPageComponent,
    }
  ];
  
  @NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule],
  })
  export class MailConfirmationRoutingModule {}