import { Directive } from "@angular/core";
import { AbstractControl, NG_VALIDATORS, Validator } from "@angular/forms";

@Directive({
  selector: '[passwordPattern]',
  providers: [{ provide: NG_VALIDATORS, useExisting: PasswordPatternDirective, multi: true }]
})
export class PasswordPatternDirective implements Validator {
  private readonly pattern: string = '^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';

  constructor() { }

  validate(control: AbstractControl): { [key: string]: any } | null {
    if (!control.value) {
      return null;
    }
    const regex = new RegExp(this.pattern);
    const valid = regex.test(control.value);
    return valid ? null : { invalidPassword: true };
  }
}
