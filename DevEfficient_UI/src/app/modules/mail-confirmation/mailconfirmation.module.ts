import { NgModule } from "@angular/core";
import { SharedModule } from "../shared/shared.module";
import { MailConfirmationPageComponent } from "./components/mail-confirmation-page/mail-confirmation-page.component";
import { MailConfirmationRoutingModule } from "./mailconfirmation-routing.module";

@NgModule({
    declarations: [
        MailConfirmationPageComponent
    ],
    imports: [MailConfirmationRoutingModule, SharedModule],
    providers: []
  })
  export class MailConfirmationModule {}