/* eslint-disable no-debugger */
import { CdkDragDrop, moveItemInArray } from "@angular/cdk/drag-drop";
import { Component, OnDestroy, OnInit} from "@angular/core";
import { MatDialog } from "@angular/material/dialog";
import { MatSnackBar } from "@angular/material/snack-bar";
import { concatMap, of, Subject, takeUntil } from "rxjs";
import { MailService } from "src/app/modules/core/services/mail.service";
import { TeamMemberService } from "src/app/modules/core/services/team-member.service";
import { RetrievedMemberModel } from "../../models/retrieved-member.model";
import { MemberAddComponent } from "../team-management-add/member-add.component";

@Component({
    templateUrl: './team-management.component.html',
    styleUrls: ['./team-management.component.scss'],
  })
export class TeamManagementComponent implements OnInit, OnDestroy {
  private ngUnsubscribe = new Subject<void>();
  public members: Array<RetrievedMemberModel> = [];

  constructor(private teamMemberService: TeamMemberService, private mailService: MailService, public dialog: MatDialog, private _snackBar: MatSnackBar) {}

    ngOnDestroy(): void {
      this.ngUnsubscribe.next();
      this.ngUnsubscribe.complete();
    }
    
    ngOnInit(): void {
      this.teamMemberService.getMembers().pipe(
        takeUntil(this.ngUnsubscribe)
      )
      .subscribe(response => {
        this.members = response.data;
      }); 
    }

    columns: string[] = ['name', 'role', 'email', 'id'];

    public onCreateMemberClicked() {
      const dialogRef = this.dialog.open(MemberAddComponent, {
      });

      dialogRef.afterClosed().pipe(
        concatMap((result) => {
          debugger;
          if(result !== undefined){
            if(result.succedeed === false) {
              return of(null);
            }
            else {
              // return this.teamMemberService.registerMember(result.data);
              return this.mailService.sendEmail({toEmail: result.data.email});
            }
          }
          return of(null);
        }),
        takeUntil(this.ngUnsubscribe)
      )
      .subscribe(response => {
        if(response !== null) {
          if(response.succeeded === true) {
            this._snackBar.open('Invitation was successfully sent!', 'Close', {
              verticalPosition: 'bottom',
              horizontalPosition: 'end',
              duration: 3000,
              panelClass: ["snackbar-mail-style"]
            });
          }
        }   
      });
    }

    public drop(event: CdkDragDrop<string[]>) {
        moveItemInArray(this.columns, event.previousIndex, event.currentIndex);
    }
}