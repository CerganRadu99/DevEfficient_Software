/* eslint-disable no-debugger */
import { Component, OnInit } from "@angular/core";
import { FormBuilder, FormControl, FormGroup, Validators } from "@angular/forms";
import { MatDialogRef } from "@angular/material/dialog";
import { CreateItemModel } from "../../models/create-item.model";

@Component({
    selector: 'app-item-add',
    templateUrl: 'item-add.component.html',
    styleUrls: ['item-add.component.scss']

})
export class ItemAddComponent implements OnInit {

    form = this.formBuilder.group({
        title: new FormControl("", [Validators.required]),
        estimatedHours: new FormControl("", [Validators.required]),
        effortType: new FormControl("", [Validators.required]),
        estimatedEffort: new FormControl("", [Validators.required]),
        priority: new FormControl("", [Validators.required]),
        state: new FormControl("", [Validators.required]),
        type: new FormControl("", [Validators.required])
    });

    ngOnInit() {
        this.form.get("state")?.valueChanges.subscribe((stateValue => {
            this.actualItemState = stateValue;
        }));
        this.form.get("type")?.valueChanges.subscribe((typeValue => {
            this.actualItemType = typeValue;
        }));
        this.form.get("effortType")?.valueChanges.subscribe((effortTypeValue => {
            this.actualEffortType = effortTypeValue;
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
    get type(): FormControl {
        return this.form.get("type") as FormControl;
    }

    public actualItemState: string = "";
    public actualItemType: string = "";
    public actualEffortType: string = "";

    public priorities: Array<string> = ["Low", "Medium", "High"];
    public itemTypes: Array<string> = ["Task", "Bug", "Feature"];
    public itemStates: Array<string> = ["ToDo", "InProgress", "Done"];
    public effortTypes: Array<string> = ["Time", "Story Points", "T-shirt sizes"];

    constructor(private formBuilder: FormBuilder, public dialogRef: MatDialogRef<ItemAddComponent>) {} 

    public onSubmit() {
        const createItemModel: CreateItemModel = {
            title: this.title.value,
            estimatedHours: Number(this.estimatedHours.value),
            effortValue: this.estimatedEffort.value,
            priority: this.priority.value,
            state: this.state.value,
            type: this.type.value
        }
        this.dialogRef.close({succedeed: true, data: createItemModel});
    }

    public onCancelClicked() {
        this.dialogRef.close({succedeed: false});
    }

    public isEffortTypeSelected() {
        return this.actualEffortType !== "";
    }
}