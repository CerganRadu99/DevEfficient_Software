/* eslint-disable no-debugger */
import { Component, ElementRef, HostListener, OnDestroy, OnInit, ViewChild } from "@angular/core";
import { ActivatedRoute, Router } from "@angular/router";
import { concatMap, debounceTime, distinctUntilChanged, of, Subject, switchMap, takeUntil } from "rxjs";
import { ItemService } from "../../../core/services/item.service";
import { ItemModel } from "../../models/item.model";
import {MatDialog} from '@angular/material/dialog';
import { ItemAddComponent } from "../../../item/components/item-add/item-add.component";
import {CdkDragDrop, moveItemInArray, transferArrayItem} from '@angular/cdk/drag-drop';
import { TeamMemberService } from "src/app/modules/core/services/team-member.service";
import { MatMenuTrigger } from "@angular/material/menu";
import { OrderItemsDevboard } from "../../models/order-items-devboard.model";
import { ScrollDispatcher } from "@angular/cdk/scrolling";
import { RetrievedMemberModel } from "src/app/modules/management/models/retrieved-member.model";
import { ItemDetailsModel } from "src/app/modules/item/models/item-details.model";
import { SearchItemsModel } from "../../models/search-items.model";
import { FormBuilder, FormControl } from "@angular/forms";
import { SprintService } from "src/app/modules/core/services/sprint.service";

@Component({
    templateUrl: './devboard.component.html',
    styleUrls: ['./devboard.component.scss'],
  })
export class DevboardComponent implements OnInit,OnDestroy{

  public form: any;
  public filterDropdown: Array<string> = [];
  public isRadioButtonNone: boolean = true;
  private ngUnsubscribe = new Subject<void>();
  public items: Array<ItemModel> = [];
  public selectedItemId: any;
  public selectedMenuOption!: string;
  public currentUpdatedItem!: ItemDetailsModel;
  public retrievedMemberModels: Array<RetrievedMemberModel> = [];
  public menuTopLeftPosition =  {x: '0', y: '0'};
  public isEditItemComponentRendered: boolean = false;
  public searchControl = new FormControl();
  @ViewChild(MatMenuTrigger, {static: true}) matMenuTrigger!: MatMenuTrigger;
  @ViewChild('scrollbarDevboard', { read: ElementRef }) public scrollbarDevboard!: ElementRef<any>; 
  constructor(private route: ActivatedRoute, 
    private itemService: ItemService,
    private sprintService: SprintService,
    public scroll: ScrollDispatcher,
    private formBuilder: FormBuilder,
    public dialog: MatDialog, public router: Router, 
    private teamMemberService: TeamMemberService) {
      this.scroll.scrolled().subscribe((data) => {
        this.matMenuTrigger.closeMenu();
      });
      this.searchControl.valueChanges
      .pipe(
        debounceTime(1000),
        distinctUntilChanged(),
        switchMap((newValue) => {
          const searchItemsModel: SearchItemsModel = {
            searchTerm: newValue,
            filterField: "",
            filterValue: ""
          }
          return this.itemService.getItems(searchItemsModel);
        })
      ).subscribe((response) => {
        if(response.succeeded === true) {
          this.items = response.data;
        }
      });
    };

  ngOnDestroy(): void {
    this.ngUnsubscribe.next();
    this.ngUnsubscribe.complete();
  }

  ngOnInit(): void {
    if(localStorage.getItem("demo") !== null) {
      location.href = '/devboard';
      localStorage.removeItem("demo");
    }
    this.initializeItems();
    this.form = this.formBuilder.group({
      filterOption1: new FormControl("", []),
      filterOption2: new FormControl("", [])
  });
  }

  public initializeItems() {
    const searchItemsModel: SearchItemsModel = {
      searchTerm: "",
      filterField: "",
      filterValue: ""
    }
    this.itemService.getItems(searchItemsModel).pipe(
      takeUntil(this.ngUnsubscribe)
    )
    .subscribe(response => {
      if(response.succeeded === true) {
        this.items = response.data;
      }
    });
  }

  get filterOption1(): FormControl {
    return this.form.get('filterOption1') as FormControl;
  }

  get filterOption2(): FormControl {
    return this.form.get('filterOption2') as FormControl;
  }

  public onAddItemClicked() {
    const dialogRef = this.dialog.open(ItemAddComponent, {
    });

    dialogRef.afterClosed().subscribe(result => {
      if(result !== undefined){
        if(result.succedeed === false) {
          console.log("result.succedeed is false");
        }
        else {
          this.itemService.registerItem(result.data).pipe(
            concatMap((response) => {
              debugger;
              if(response.succeeded === true) {
                let existingItemIds: Array<string> = this.items.map(item => item.id);
                existingItemIds.push(response.data.itemId);
                return this.itemService.changeItemsOrder({itemIds: existingItemIds});
              }
              return of(null);
            }),
            takeUntil(this.ngUnsubscribe)
          )
          .subscribe(response => {
            debugger;
            if(response !== null && response.succeeded) {
              this.isRadioButtonNone = true;
              this.initializeItems()
            }
          });
        }
      }
    })
  }

  public toggleHover(selectedItemId: string) {
    this.selectedItemId = selectedItemId;
  }

  public toggleButtonHover(menuOption: string) {
    this.selectedMenuOption = menuOption;
  }

  public removeButtonHover() {
    this.selectedMenuOption = "";
  }

  public removeHover() {
    this.selectedItemId = null;
  }
  public onMatCardClicked(itemId: string) {
    this.isEditItemComponentRendered = false;
    setTimeout(() => {this.itemService.getItem(itemId).pipe(
      switchMap((result) => {
        this.currentUpdatedItem = result.data;
        return this.teamMemberService.getMembers();
      }),
      takeUntil(this.ngUnsubscribe)
    )
    .subscribe(response => {
      this.retrievedMemberModels = response.data;
      this.isEditItemComponentRendered = true;
    });
  }, 1);
}

  public refreshDevboard() {
    this.initializeItems();
  }

  public closeEditItemComponent() {
    this.isEditItemComponentRendered = false;
  }

  public updateItem(item: ItemDetailsModel) {
    this.itemService.updateItem(item).pipe(
      takeUntil(this.ngUnsubscribe)
    ).subscribe((response) => {
      if(response.succeeded === true) {
        this.isRadioButtonNone = true;
        this.initializeItems();
      }
    });
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
      let currentItem = event.container.data[event.currentIndex];
      if(event.previousContainer.data.length === 0) {
        this.itemService.clearSprintOfItem(currentItem.id).pipe(
          switchMap((response) => {
            return this.sprintService.deleteCurrentSprint();
          }),
          takeUntil(this.ngUnsubscribe)
        )
        .subscribe((response) => {
        });
      }
      else {
        this.itemService.clearSprintOfItem(currentItem.id).pipe(
          takeUntil(this.ngUnsubscribe)
        )
        .subscribe((response) => {

        });
    }
    }
    let currentItems = event.container.data;
    const itemIds: Array<string> = currentItems.map(currentItem => currentItem.id);
    this.itemService.changeItemsOrder({itemIds: itemIds}).pipe(
      takeUntil(this.ngUnsubscribe)
    )
    .subscribe((response) => {

    });
  }

  public onRightClick(event: MouseEvent, item: ItemModel) { 
    // preventDefault avoids to show the visualization of the right-click menu of the browser 
    this.matMenuTrigger.closeMenu();
    event.preventDefault(); 
    event.stopPropagation();

    // we record the mouse position in our object 
    this.menuTopLeftPosition.x = event.clientX + 'px'; 
    this.menuTopLeftPosition.y = event.clientY + 'px'; 

    // we open the menu 
    // we pass to the menu the information about our object 
    this.matMenuTrigger.menuData = {item: item} 

    // we open the menu 
    setTimeout(() => {
      this.matMenuTrigger.openMenu(); 
    }, 150)
  } 

  @HostListener('document:click', ['$event'])
  clickout(event: any) {
    this.matMenuTrigger.closeMenu();
  }

  public onTopOfDevboard(item: ItemModel) {
    const orderItemsDevboard: OrderItemsDevboard = {
      itemIds: this.items.map(item => item.id),
      itemId: item.id,
      option: "top"
    };
    this.itemService.orderItemsTopBottomDevboard(orderItemsDevboard).subscribe((response) => {
      let orderedItems: Array<ItemModel> = [];
      for(let itemId of response.data) {
        orderedItems.push(this.items.find(item => item.id === itemId)!);
      }
      this.items = orderedItems;
      this.scrollbarDevboard.nativeElement.scrollTop = 0;
    });

  }

  public onBottomOfDevboard(item: ItemModel) {
    const orderItemsDevboard: OrderItemsDevboard = {
      itemIds: this.items.map(item => item.id),
      itemId: item.id,
      option: "bottom"
    };
    this.itemService.orderItemsTopBottomDevboard(orderItemsDevboard).subscribe((response) => {
      let orderedItems: Array<ItemModel> = [];
      for(let itemId of response.data) {
        orderedItems.push(this.items.find(item => item.id === itemId)!);
      }
      this.items = orderedItems;
      this.scrollbarDevboard.nativeElement.scrollTop = 9999;
    });
  }


  public onDeleteItem(item: ItemModel) {
    this.itemService.deleteItem(item.id).pipe(
      concatMap((response) => {
        if(response.succeeded === true) {
          let existingItemIds: Array<string> = this.items.map(item => item.id);
          const itemToRemoveId = existingItemIds.indexOf(item.id);
          existingItemIds.splice(itemToRemoveId, 1);
          return this.itemService.changeItemsOrder({itemIds: existingItemIds});
        }
        return of(null);
      }),
      takeUntil(this.ngUnsubscribe)
    ).subscribe((response) => {
      if(response !== null && response.succeeded === true) {
        this.initializeItems();
      }
    })
  }

  public setCurrentUpdatedItem(currentUpdatedItem: ItemDetailsModel) {
    this.currentUpdatedItem = currentUpdatedItem;
  }

  public setRetrievedMemberModels(retrievedMemberModels: Array<RetrievedMemberModel>) {
    this.retrievedMemberModels = retrievedMemberModels;
  }

  public setIsEditItemComponentRendered(flag: boolean) {
    this.isEditItemComponentRendered = flag;
  }

  public onRadioChange(event: any) {
    switch(event.value) {
      case "Type":
        this.filterDropdown = ["Task", "Bug", "Feature"];
        this.isRadioButtonNone = false;
        break;
      case "Priority":
        this.filterDropdown = ["Low", "Medium", "High"];
        this.isRadioButtonNone = false;
        break;
      case "State":
        this.filterDropdown = ["ToDo", "InProgress", "Done"];
        this.isRadioButtonNone = false;
        break;
      case "Effort":
        this.filterDropdown = ["1", "2", "3", "4", "5", "S", "M", "L"];
        this.isRadioButtonNone = false;
        break;
      case "All Items":
        this.filterDropdown = [];
        this.isRadioButtonNone = true;
        const searchItemsModel: SearchItemsModel = {
          searchTerm: "",
          filterField: "",
          filterValue: ""
        }
    
        this.itemService.getItems(searchItemsModel).pipe(
          takeUntil(this.ngUnsubscribe)
        )
        .subscribe((response) => {
          if(response.succeeded === true) {
            this.items = response.data;
          }
        });
        break;
    }
  }

  public onFilterOption2Changed(event: any) {
    const filterOption1Value = this.filterOption1.value;
    const filterOption2Value = this.filterOption2.value;
    debugger;

    const searchItemsModel: SearchItemsModel = {
      searchTerm: "",
      filterField: filterOption1Value,
      filterValue: filterOption2Value
    }

    this.itemService.getItems(searchItemsModel).pipe(
      takeUntil(this.ngUnsubscribe)
    )
    .subscribe((response) => {
      if(response.succeeded === true) {
        this.items = response.data;
      }
    });
  }
}