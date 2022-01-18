/* eslint-disable no-debugger */
import { AfterViewInit, Component, Inject, OnDestroy, OnInit } from "@angular/core";
import { FormBuilder, FormControl, FormGroup, Validators } from "@angular/forms";
import { MatDialogRef, MAT_DIALOG_DATA } from "@angular/material/dialog";
import { Subject, takeUntil } from "rxjs";
import { TeamMemberService } from "src/app/modules/core/services/team-member.service";
import { RetrievedMemberModel } from "src/app/modules/management/models/retrieved-member.model";
import { CreateItemModel } from "../../models/create-item.model";
import { ItemDetailsModel } from "../../models/item-details.model";

@Component({
    selector: 'app-item-edit',
    templateUrl: 'item-edit.component.html',
    styleUrls: ['item-edit.component.scss']

})
export class ItemEditComponent implements OnInit, OnDestroy {

    private ngUnsubscribe = new Subject<void>();
    
    constructor(
    @Inject(MAT_DIALOG_DATA) public data: any,
    private formBuilder: FormBuilder,
    public dialogRef: MatDialogRef<ItemEditComponent>) {} 

    public actualItemState: string = this.data.itemToUpdate.state;
    public actualItemType: string = this.data.itemToUpdate.type;

    public priorities: Array<string> = ["Low", "Medium", "High"];
    public itemTypes: Array<string> = ["Task", "Bug", "Feature"];
    public itemStates: Array<string> = ["ToDo", "InProgress", "Done"];
    public effortTypes: Array<string> = ["Time", "Story Points", "T-shirt sizes"];

    form = this.formBuilder.group({
        title: new FormControl(this.data.itemToUpdate.title, [Validators.required]),
        estimatedHours: new FormControl(this.data.itemToUpdate.estimatedHours, [Validators.required]),
        estimatedEffort: new FormControl(this.data.itemToUpdate.estimatedEffort, [Validators.required]),
        priority: new FormControl(this.data.itemToUpdate.priority, [Validators.required]),
        state: new FormControl(this.data.itemToUpdate.state, [Validators.required]),
        type: new FormControl(this.data.itemToUpdate.type, [Validators.required]),
        actualHours: new FormControl(this.data.itemToUpdate.actualHours),
        assigned: new FormControl(this.data.itemToUpdate.assignedName, [Validators.required]),
        sprint: new FormControl(this.data.itemToUpdate.sprintName)
    });

    ngOnDestroy(): void {
        this.ngUnsubscribe.next();
        this.ngUnsubscribe.complete();
      }
    
    ngOnInit() {  
        this.form.get("state")?.valueChanges.subscribe((stateValue => {
            this.actualItemState = stateValue;
        }));
        this.form.get("type")?.valueChanges.subscribe((typeValue => {
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
        debugger;
        
        const itemDetailsModel: ItemDetailsModel = {
            id: this.data.itemToUpdate.id,
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
        this.dialogRef.close({succedeed: true, data: itemDetailsModel});
    }

    public onCancelClicked() {
        this.dialogRef.close({succedeed: false});
    }
}