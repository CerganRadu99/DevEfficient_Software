/* eslint-disable no-debugger */
import { CdkDragDrop, moveItemInArray, transferArrayItem } from "@angular/cdk/drag-drop";
import { Component, EventEmitter, OnDestroy, Output} from "@angular/core";
import { MatDialog } from "@angular/material/dialog";
import { concatMap, of, Subject, switchMap, takeUntil } from "rxjs";
import { ItemService } from "src/app/modules/core/services/item.service";
import { SprintService } from "src/app/modules/core/services/sprint.service";
import { ItemEditComponent } from "src/app/modules/item/components/item-edit/item-edit.component";
import { ItemModel } from "../../models/item.model";
import { SprintAddComponent } from "./sprint-add/sprint-add.component";

@Component({
    selector: 'app-sprint',
    templateUrl: './sprint.component.html',
    styleUrls: ['./sprint.component.scss'],
  })
export class SprintComponent implements OnDestroy{

    private ngUnsubscribe = new Subject<void>();
    public sprintItems: Array<ItemModel> = [];
    public selectedItemId: any;
    @Output() refreshDevboard: EventEmitter<any> = new EventEmitter<any>();

    constructor(public dialog: MatDialog, private itemService: ItemService, private sprintService: SprintService){}
    
    ngOnDestroy(): void {
        this.ngUnsubscribe.next();
        this.ngUnsubscribe.complete();
    }

    public onActivateSprintClicked() {
      const dialogRef = this.dialog.open(SprintAddComponent, {
        data: this.sprintItems
      });
      dialogRef.afterClosed().pipe(
        switchMap((result) => {
          if(result != undefined) {
            if(result.succedeed === true) {
              return this.sprintService.registerSprint(result.data);
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
        if(response !== null) {
          if(response.succeeded === true) {
            this.sprintItems = [];
            this.refreshDevboard.emit();
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

    public onMatCardClicked(itemId: string) {
      this.itemService.getItem(itemId).pipe(
        takeUntil(this.ngUnsubscribe)
      )
      .subscribe(response => {
        const dialogRef = this.dialog.open(ItemEditComponent, {
          data: response.data
        });
      })
    }

    public drop(event: CdkDragDrop<ItemModel[]>) {
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
      }
}