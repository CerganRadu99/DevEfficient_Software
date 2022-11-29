/* eslint-disable no-debugger */
import { Component, Inject } from "@angular/core";
import { FormBuilder, FormControl, Validators } from "@angular/forms";
import { MatDialogRef, MAT_DIALOG_DATA } from "@angular/material/dialog";
import { CreateSprintModel } from "../../../models/create-sprint.model";
import { ItemModel } from "../../../models/item.model";

@Component({
    selector: 'app-sprint-add',
    templateUrl: './sprint-add.component.html',
    styleUrls: ['./sprint-add.component.scss'],
  })
export class SprintAddComponent {
    form = this.formBuilder.group({
        title: new FormControl("", [Validators.required]),
        goal: new FormControl("", [Validators.required]),
        startDate: new FormControl("", [Validators.required]),
        endDate: new FormControl("", [Validators.required]),
    });

    get title(): FormControl {
        return this.form.get("title") as FormControl;
    }
    get goal(): FormControl {
        return this.form.get("goal") as FormControl;
    }
    get startDate(): FormControl {
        return this.form.get("startDate") as FormControl;
    }
    get endDate(): FormControl {
        return this.form.get("endDate") as FormControl;
    }

    constructor(private formBuilder: FormBuilder, 
                public dialogRef: MatDialogRef<SprintAddComponent>) {}

    public onCancelClicked(){
        this.dialogRef.close({succedeed: false});
    }

    public onSubmit() {
        // const sprintItemIds: Array<string> = [];
        // for(let item of this.sprintItems) {
        //     sprintItemIds.push(item.id);
        // }
        const createSprintModel: CreateSprintModel = {
            title: this.title.value,
            goal: this.goal.value,
            startDate: this.startDate.value,
            endDate: this.endDate.value,
        };
        this.dialogRef.close({succedeed: true, data: createSprintModel});
    }
}