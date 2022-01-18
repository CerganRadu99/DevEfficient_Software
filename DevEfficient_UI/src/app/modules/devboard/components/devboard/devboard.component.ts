/* eslint-disable no-debugger */
import { Component, OnDestroy, OnInit } from "@angular/core";
import { ActivatedRoute, Router } from "@angular/router";
import { concatMap, of, Subject, switchMap, takeUntil } from "rxjs";
import { ItemService } from "../../../core/services/item.service";
import { ItemModel } from "../../models/item.model";
import {MatDialog} from '@angular/material/dialog';
import { ItemAddComponent } from "../../../item/components/item-add/item-add.component";
import { ItemEditComponent } from "../../../item/components/item-edit/item-edit.component";
import {CdkDragDrop, moveItemInArray, transferArrayItem} from '@angular/cdk/drag-drop';
import { TeamMemberService } from "src/app/modules/core/services/team-member.service";
import { ItemDetailsModel } from "src/app/modules/item/models/item-details.model";

@Component({
    templateUrl: './devboard.component.html',
    styleUrls: ['./devboard.component.scss'],
  })
export class DevboardComponent implements OnInit,OnDestroy{

  private ngUnsubscribe = new Subject<void>();
  public items: Array<ItemModel> = [];
  public selectedItemId: any;
  public currentUpdatedItem: any;
  constructor(private route: ActivatedRoute, 
    private itemService: ItemService, 
    public dialog: MatDialog, public router: Router, 
    private teamMemberService: TeamMemberService) {}

  ngOnDestroy(): void {
    this.ngUnsubscribe.next();
    this.ngUnsubscribe.complete();
  }

  ngOnInit(): void {
    this.itemService.getItems().pipe(
      takeUntil(this.ngUnsubscribe)
    )
    .subscribe(response => {
      if(response.succeeded === true) {
        this.items = response.data;
      }
    });
  }

  public onAddItemClicked() {
    const dialogRef = this.dialog.open(ItemAddComponent, {
    });

    dialogRef.afterClosed().subscribe(result => {
      if(result !== undefined){
        if(result.succedeed === false) {
        
        }
        else {
          this.itemService.registerItem(result.data).pipe(
            takeUntil(this.ngUnsubscribe)
          )
          .subscribe(response => {
            if(response.succeeded === true) {
              //dialog - item added successfully
              this.ngOnInit();
            }
            else {
              //dialog - item not added
            }
          });
        }
      }
    })
  }

  public toggleHover(selectedItemId: string) {
    this.selectedItemId = selectedItemId;
  }

  public removeHover() {
    this.selectedItemId = null;
  }
  public onMatCardClicked(itemId: string) {
    this.itemService.getItem(itemId).pipe(
      switchMap((result) => {
        this.currentUpdatedItem = result.data;
        return this.teamMemberService.getMembers();
      }),
      switchMap((result) => {
        const dialogRef = this.dialog.open(ItemEditComponent, {
          data: {itemToUpdate: this.currentUpdatedItem, teamMembers: result.data}
        });
        return dialogRef.afterClosed();
      }),
      switchMap((result) => {
        if(result !== undefined) {
          if(result.succedeed === false) {

          }
          else {
            return this.itemService.updateItem(result.data);
          }
        }
        return of(null);
      }),
      takeUntil(this.ngUnsubscribe)
    )
    .subscribe(response => {
      if(response !== null) {
        if(response.succeeded === true) {
          //dialog - item added successfully
          this.ngOnInit();
        }
        else {
          //dialog - item not added
        }
      }
    })
  }

  public refreshDevboard() {
    this.ngOnInit();
  }

  drop(event: CdkDragDrop<ItemModel[]>) {
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