/* eslint-disable no-debugger */
import { Component} from "@angular/core";
import { FormBuilder, FormControl, Validators } from "@angular/forms";
import { MatDialogRef } from "@angular/material/dialog";
import { CreateMemberModel } from "../../models/create-member.model";

@Component({
    selector: 'app-member-add',
    templateUrl: 'member-add.component.html',
    styleUrls: ['member-add.component.scss']

})
export class MemberAddComponent {

    form = this.formBuilder.group({
        // name: new FormControl("", [Validators.required]),
        email: new FormControl("", [Validators.required])
        // role: new FormControl("", [Validators.required]),
    });

    constructor(private formBuilder: FormBuilder, public dialogRef: MatDialogRef<MemberAddComponent>) {} 

    // get name(): FormControl {
    //     return this.form.get("name") as FormControl;
    // }

    get email(): FormControl {
        return this.form.get("email") as FormControl;
    }

    // get role(): FormControl {
    //     return this.form.get("role") as FormControl;
    // }

    public onSubmit() {
        const createMemberModel: CreateMemberModel = {
            email: this.email.value
        }
        this.dialogRef.close({succedeed: true, data: createMemberModel});
    }

    public onCancelClicked() {
        this.dialogRef.close({succedeed: false});
    }
}