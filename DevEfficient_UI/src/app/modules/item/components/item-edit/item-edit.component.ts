/* eslint-disable no-debugger */
import { Component, EventEmitter, Input, OnDestroy, OnInit, Output } from "@angular/core";
import { FormBuilder, FormControl, Validators } from "@angular/forms";
import { Subject } from "rxjs";
import { RetrievedMemberModel } from "src/app/modules/management/models/retrieved-member.model";
import { ItemDetailsModel } from "../../models/item-details.model";

@Component({
    selector: 'app-item-edit',
    templateUrl: 'item-edit.component.html',
    styleUrls: ['item-edit.component.scss']

})
export class ItemEditComponent implements OnInit, OnDestroy {

    private ngUnsubscribe = new Subject<void>();
    @Input() currentUpdatedItem!: ItemDetailsModel; 
    @Input() retrievedMemberModels!: Array<RetrievedMemberModel>;
    @Output() closeEditItemComponent = new EventEmitter<any>(); 
    @Output() updateItem = new EventEmitter<ItemDetailsModel>(); 
    public actualItemState: any;
    public actualItemType: any;
    public form: any;
    public panelOpenState: boolean = false;
    
    constructor(
    // @Inject(MAT_DIALOG_DATA) public data: any,
    private formBuilder: FormBuilder,
    ) {} 

    public priorities: Array<string> = ["Low", "Medium", "High"];
    public itemTypes: Array<string> = ["Task", "Bug", "Feature"];
    public itemStates: Array<string> = ["ToDo", "InProgress", "Done"];
    public effortTypes: Array<string> = ["Time", "Story Points", "T-shirt sizes"];
   

    ngOnDestroy(): void {
        this.ngUnsubscribe.next();
        this.ngUnsubscribe.complete();
      }
    
    ngOnInit() {  
        this.actualItemState = this.currentUpdatedItem.state;
        this.actualItemType = this.currentUpdatedItem.type;
        this.form = this.formBuilder.group({
            title: new FormControl(this.currentUpdatedItem.title, [Validators.required]),
            estimatedHours: new FormControl(this.currentUpdatedItem.estimatedHours, [Validators.required]),
            estimatedEffort: new FormControl(this.currentUpdatedItem.estimatedEffort, [Validators.required]),
            priority: new FormControl(this.currentUpdatedItem.priority, [Validators.required]),
            state: new FormControl(this.currentUpdatedItem.state, [Validators.required]),
            type: new FormControl(this.currentUpdatedItem.type, [Validators.required]),
            actualHours: new FormControl(this.currentUpdatedItem.actualHours),
            assigned: new FormControl(this.currentUpdatedItem.assignedName),
            sprint: new FormControl(this.currentUpdatedItem.sprintName)
        });
        this.form.get("state")?.valueChanges.subscribe(((stateValue: any) => {
            this.actualItemState = stateValue;
        }));
        this.form.get("type")?.valueChanges.subscribe(((typeValue: any) => {
            this.actualItemType = typeValue;
        }));
    }

    get title(): FormControl {
        return this.form.get("title") as FormControl;
    }
    get estimatedHours(): FormControl {
        return this.form.get("estimatedHours") as FormControl;
    }
    get estimatedEffort(): FormControl {
        return this.form.get("estimatedEffort") as FormControl;
    }
    get priority(): FormControl {
        return this.form.get("priority") as FormControl;
    }
    get state(): FormControl {
        return this.form.get("state") as FormControl;
    }
    get actualHours(): FormControl {
        return this.form.get("actualHours") as FormControl;
    }
    get type(): FormControl {
        return this.form.get("type") as FormControl;
    }

    get sprint(): FormControl {
        return this.form.get("sprint") as FormControl;
    }

    get assigned(): FormControl {
        return this.form.get("assigned") as FormControl;
    }

    public onSubmit() {
        const itemDetailsModel: ItemDetailsModel = {
            id: this.currentUpdatedItem.id,
            title: this.title.value,
            estimatedHours: Number(this.estimatedHours.value),
            estimatedEffort: this.estimatedEffort.value,
            priority: this.priority.value,
            state: this.state.value,
            type: this.type.value,
            actualHours: Number(this.actualHours.value),
            sprintName: this.sprint.value,
            assignedName: this.assigned.value
        }
        this.updateItem.emit(itemDetailsModel);
    }

    public onCancelClicked() {
        this.closeEditItemComponent.emit();
    }
}