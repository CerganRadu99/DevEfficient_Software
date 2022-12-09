import { Injectable } from '@angular/core';

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
