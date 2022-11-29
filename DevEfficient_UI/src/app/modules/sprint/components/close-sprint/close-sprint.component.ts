import { Component, Inject, OnDestroy } from "@angular/core";
import { MatDialogRef, MAT_DIALOG_DATA } from "@angular/material/dialog";
import { MatSnackBar } from "@angular/material/snack-bar";
import { Subject, takeUntil } from "rxjs";
import { SprintService } from "src/app/modules/core/services/sprint.service";

@Component({
    selector: 'app-close-sprint',
    templateUrl: 'close-sprint.component.html',
    styleUrls: ['close-sprint.component.scss']
})
export class CloseSprintComponent implements OnDestroy {

    private ngUnsubscribe = new Subject<void>()

    constructor(public dialogRef: MatDialogRef<CloseSprintComponent>, private sprintService: SprintService, @Inject(MAT_DIALOG_DATA) public data: string) {

    }

    ngOnDestroy(): void {
        this.ngUnsubscribe.next();
        this.ngUnsubscribe.complete();
    }
    

    public onNoClicked() {
        this.dialogRef.close({succeeded: false});
    }

    public onYesClicked() {
        this.dialogRef.close({succeeded: true});
    }
}