/* eslint-disable no-debugger */
import { CdkDragDrop, moveItemInArray, transferArrayItem } from "@angular/cdk/drag-drop";
import { Container } from "@angular/compiler/src/i18n/i18n_ast";
import { Component, EventEmitter, OnDestroy, OnInit, Output} from "@angular/core";
import { MatDialog } from "@angular/material/dialog";
import { MatSnackBar } from "@angular/material/snack-bar";
import { concatMap, of, Subject, switchMap, takeUntil } from "rxjs";
import { ItemService } from "src/app/modules/core/services/item.service";
import { SprintService } from "src/app/modules/core/services/sprint.service";
import { TeamMemberService } from "src/app/modules/core/services/team-member.service";
import { ItemEditComponent } from "src/app/modules/item/components/item-edit/item-edit.component";
import { ItemDetailsModel } from "src/app/modules/item/models/item-details.model";
import { RetrievedMemberModel } from "src/app/modules/management/models/retrieved-member.model";
import { CreateSprintModel } from "../../models/create-sprint.model";
import { ItemModel } from "../../models/item.model";
import { SprintAddComponent } from "./sprint-add/sprint-add.component";

@Component({
    selector: 'app-sprint',
    templateUrl: './sprint.component.html',
    styleUrls: ['./sprint.component.scss'],
  })
export class SprintComponent implements OnInit, OnDestroy{

    private currentSprintId!: string;
    private ngUnsubscribe = new Subject<void>();
    public sprintItems: Array<ItemModel> = [];
    public selectedItemId: any;
    @Output() refreshDevboard: EventEmitter<any> = new EventEmitter<any>();
    @Output() setCurrentUpdatedItem: EventEmitter<any> = new EventEmitter<any>();
    @Output() setRetrievedMemberModels: EventEmitter<any> = new EventEmitter<any>();
    @Output() setIsEditItemComponentRendered: EventEmitter<any> = new EventEmitter<any>();

    constructor(public dialog: MatDialog, private itemService: ItemService, private sprintService: SprintService, private teamMemberService: TeamMemberService, private _snackBar: MatSnackBar){}

    ngOnInit(): void {
      this.sprintService.getCurrentSprintItems().pipe(
        takeUntil(this.ngUnsubscribe)
      )
      .subscribe((response) => {
        debugger;
        if(response.succeeded === true) {
          this.sprintItems = response.data;
        }
      });
    }
    
    ngOnDestroy(): void {
        this.ngUnsubscribe.next();
        this.ngUnsubscribe.complete();
    }

    public onActivateSprintClicked() {
      const dialogRef = this.dialog.open(SprintAddComponent, {
      });
      dialogRef.afterClosed().pipe(
        switchMap((result) => {
          if(result != undefined) {
            if(result.succedeed === true) {
              return this.sprintService.activateSprint(result.data);
            }
            else {
              return of(null);
            }
          }
          return of(null);
        }),
        takeUntil(this.ngUnsubscribe)
      )
      .subscribe((response) => {
        debugger;
        if(response !== null) {
          if(response.succeeded === true) {
            this.sprintItems = [];
            this.refreshDevboard.emit();
          }
          else {
            this._snackBar.open('A sprint is already activated!', 'Close', {
              verticalPosition: 'bottom',
              horizontalPosition: 'end',
              duration: 3000,
              panelClass: ["snackbar-sprint-style"]
            });
          }
        }
      });
    }

    public toggleHover(selectedItemId: string) {
      this.selectedItemId = selectedItemId;
    }
  
    public removeHover() {
      this.selectedItemId = null;
    }

    public drop(event: CdkDragDrop<ItemModel[]>) {
      debugger;
        if (event.previousContainer === event.container) {
          moveItemInArray(event.container.data, event.previousIndex, event.currentIndex);
        } else {
          transferArrayItem(
            event.previousContainer.data,
            event.container.data,
            event.previousIndex,
            event.currentIndex,
          );
          if(event.container.data.length === 1) {
            const sprintItemIds: Array<string> = event.container.data.map(item => item.id);
            const createSprintModel: CreateSprintModel = {
              title: "",
              goal: "",
              startDate: new Date(),
              endDate: new Date(new Date().setDate(new Date().getDate() + 14)),
              itemIds: sprintItemIds
            };
            this.sprintService.registerSprint(createSprintModel).pipe(
              takeUntil(this.ngUnsubscribe)
            )
            .subscribe((response) => {
              if(response.succeeded === true) {
                this.currentSprintId = response.data.sprintId;
              }
            });
          }
          else {
            const currentItem = event.container.data[event.currentIndex];
            this.itemService.setSprintOfItem(currentItem.id).pipe(
              takeUntil(this.ngUnsubscribe)
            )
            .subscribe((response) => {

            });
          }
      }
    }

    public onMatCardClicked(itemId: string) {
      this.setIsEditItemComponentRendered.emit(false);
      setTimeout(() => {this.itemService.getItem(itemId).pipe(
        switchMap((result) => {
          this.setCurrentUpdatedItem.emit(result.data);
          return this.teamMemberService.getMembers();
        }),
        takeUntil(this.ngUnsubscribe)
      )
      .subscribe(response => {
        this.setRetrievedMemberModels.emit(response.data);
        this.setIsEditItemComponentRendered.emit(true);
      });
    }, 1);
  }
    public isActivateSprintBtnDisabled() {
      return this.sprintItems.length === 0;
    }
}