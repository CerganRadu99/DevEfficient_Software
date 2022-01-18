import { NgModule } from "@angular/core";
import { SharedModule } from "../shared/shared.module";
import { MemberAddComponent } from "./components/team-management-add/member-add.component";
import { TeamManagementComponent } from "./components/team-management/team-management.component";
import { ManagementRoutingModule } from "./management-routing.module";

@NgModule({
    declarations: [
        TeamManagementComponent,
        MemberAddComponent
    ],
    imports: [ManagementRoutingModule, SharedModule],
    providers: []
  })
  export class ManagementModule {}