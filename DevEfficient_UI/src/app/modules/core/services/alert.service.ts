import { Injectable } from '@angular/core';
import { Observable, Subject } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class AlertService {
  public showSuccess(message: string): void {
    alert(message);
  }

  public showError(message: string): void {
    alert(message);
  }

  public showConfirmation(message: string): boolean {
    return confirm(message);
  }
}
