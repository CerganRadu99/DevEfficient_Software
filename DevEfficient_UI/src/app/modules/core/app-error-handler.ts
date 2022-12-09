import { ErrorHandler, Injectable } from '@angular/core';
import { AlertService } from './services/alert.service';

@Injectable()
export class AppErrorHandler implements ErrorHandler {
  constructor(private alertService: AlertService) {}

  public handleError(error: any): void {
    console.log(error);

    const chunkFailedMessage = /Loading chunk [d]+ failed/;
    if (chunkFailedMessage.test(error.message)) {
      window.location.reload();
    }

    this.alertService.showError(error.message);
  }
}
