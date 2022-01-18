import { FormControl } from "@angular/forms";

export function formControlHasError(formControl: FormControl, errorKey: string) {
  return formControl.touched && formControl.hasError(errorKey);
}
