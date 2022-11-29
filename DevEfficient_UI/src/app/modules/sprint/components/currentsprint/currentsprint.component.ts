import { CdkDragDrop, moveItemInArray, transferArrayItem } from "@angular/cdk/drag-drop";
import { Container } from "@angular/compiler/src/i18n/i18n_ast";
import { Component, OnDestroy, OnInit } from "@angular/core";
import { FormBuilder, FormControl, Validators } from "@angular/forms";
import { MatDialog } from "@angular/material/dialog";
import { MatSnackBar } from "@angular/material/snack-bar";
import { concatMap, of, Subject, switchMap, takeUntil } from "rxjs";
import { ItemService } from "src/app/modules/core/services/item.service";
import { SprintService } from "src/app/modules/core/services/sprint.service";
import { ItemDetailsModel } from "src/app/modules/item/models/item-details.model";
import { CurrentSprintItemModel } from "../../models/currentsprint-item.model";
import { RetrievedCurrentSprintModel } from "../../models/retrieved-currentsprint.model";
import { CloseSprintComponent } from "../close-sprint/close-sprint.component";

@Component({
    templateUrl: './currentsprint.component.html',
    styleUrls: ['./currentsprint.component.scss']
})
export class CurrentSprintComponent implements OnInit, OnDestroy {
    private ngUnsubscribe = new Subject<void>();
    public isCurrentSprintReady: boolean = false;
    public retrievedCurrentSprintModel!: RetrievedCurrentSprintModel;
    public toDoItems: Array<CurrentSprintItemModel> = [];
    public inProgressItems: Array<CurrentSprintItemModel> = [];
    public doneItems: Array<CurrentSprintItemModel> = [];
    public selectedItemId: any;
    public states: Array<string> = ["TO DO", "IN PROGRESS", "DONE"];
    public remainingDays: number = 0;
    public sprintItems: Array<ItemDetailsModel> = [];
    public isSprintActivated: boolean = false;
    public devboardPath: string = "devboard";
    public form: any;
    constructor(public sprintService: SprintService, public itemService: ItemService, public dialog: MatDialog, private _snackBar: MatSnackBar, private formBuilder: FormBuilder) {}

    ngOnDestroy(): void {
        this.ngUnsubscribe.next();
        this.ngUnsubscribe.complete();
    }

    ngOnInit(): void {
        this.sprintService.getCurrentSprint().pipe(
            takeUntil(this.ngUnsubscribe)
        ).subscribe((response) => {
            if(response.data !== null) {
                this.isSprintActivated = true;
                this.retrievedCurrentSprintModel = response.data;
                for(let item of this.retrievedCurrentSprintModel.sprintItems) {
                    switch(item.state) {
                        case "ToDo":
                            this.toDoItems.push(item);
                            break;
                        case "InProgress":
                            this.inProgressItems.push(item);
                            break;
                        case "Done":
                            this.doneItems.push(item);
                            break;
                    }
                }
                this.remainingDays = this.getRemainingDays(this.retrievedCurrentSprintModel.startDate, this.retrievedCurrentSprintModel.endDate) + 1;
                this.isCurrentSprintReady = true;
            }
            this.isCurrentSprintReady = true;
            this.form = this.formBuilder.group({
                actualWorkedHours: new FormControl("", [Validators.required])
            });
        }); 
    }

    public toggleHover(selectedItemId: string) {
        this.selectedItemId = selectedItemId;
    }
    
    public removeHover() {
        this.selectedItemId = null;
    }

    public getRemainingDays(startDate: Date, endDate: Date) {
        const oneDay = 24 * 60 * 60 * 1000;
        return Math.round(Math.abs((new Date(startDate).getTime() - new Date(endDate).getTime()) / oneDay));
    }

    public isItemDone(itemId: string) {
        var item = this.doneItems.find(item => item.id === itemId);
        return item !== undefined;
    }

    drop(event: CdkDragDrop<CurrentSprintItemModel[]>) {
        if (event.previousContainer === event.container) {
          moveItemInArray(event.container.data, event.previousIndex, event.currentIndex);
        } else {
          transferArrayItem(
            event.previousContainer.data,
            event.container.data,
            event.previousIndex,
            event.currentIndex,
          );
        }
        const movedItem = event.container.data[event.currentIndex];
        let newState = "";
        switch(event.container.id) {
            case "TO DO":
                newState = "ToDo";
                break;
            case "IN PROGRESS":
                newState = "InProgress";
                break;
            case "DONE":
                newState = "Done";
                break;
        }
        this.itemService.updateStateOfItem(movedItem.id, newState).pipe(
            switchMap((response) => {
                if(response.succeeded === true) {
                    if(this.inProgressItems.length === 0 && this.toDoItems.length === 0) {
                        const dialogRef = this.dialog.open(CloseSprintComponent, {
                            data: "All items included in this sprint seem to be done. Do you want to close this sprint?"
                        });
                        return dialogRef.afterClosed();
                    } 
                    return of(null);          
                }
                return of(null);
            }),
            switchMap((response) => {
                if(response !== null && response !== undefined) {
                    if(response.succeeded === true) {
                        return this.sprintService.closeCurrentSprint();
                    }
                }
                return of(null);
            }),
            takeUntil(this.ngUnsubscribe)
        ).subscribe((response) => {
            if(response !== null && response !== undefined) {
                if(response.succeeded === true) {
                    this._snackBar.open('Sprint was successfully closed', 'Close', {
                        verticalPosition: 'bottom',
                        horizontalPosition: 'end',
                        duration: 3000,
                        panelClass: ["snackbar-current-sprint-style"]
                      });
                      this.toDoItems = [];
                      this.inProgressItems = [];
                      this.doneItems = [];
                      this.isSprintActivated = false;
                }
            }
        });
      }

      public onCompleteSprintClicked() {
        const dialogRef = this.dialog.open(CloseSprintComponent, {
            data: "Are you sure you want to close the current sprint?"
        });
        dialogRef.afterClosed().pipe(
            concatMap((response: any) => {
                if(response !== null && response !== undefined) {
                    if(response.succeeded === true) {
                        return this.sprintService.closeCurrentSprint();
                    }
                }
                return of(null);
            }),
            takeUntil(this.ngUnsubscribe))
            .subscribe((response: any) => {
            if(response !== null && response !== undefined) {
                if(response.succeeded === true) {
                    this._snackBar.open('Sprint was successfully closed', 'Close', {
                        verticalPosition: 'bottom',
                        horizontalPosition: 'end',
                        duration: 3000,
                        panelClass: ["snackbar-current-sprint-style"]
                      });
                      this.toDoItems = [];
                      this.inProgressItems = [];
                      this.doneItems = [];
                      this.isSprintActivated = false;
                }
            }
        });
      }

      public isCompleteSprintButtonDisabled() {
        return !this.isSprintActivated;
      }
}