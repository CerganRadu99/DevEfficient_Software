import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class LoadingService {
  private loadingSource = new BehaviorSubject<boolean>(false);
  public isLoading$ = this.loadingSource.asObservable();

  public startLoading(): void {
    this.loadingSource.next(true);
  }

  public endLoading(): void {
    this.loadingSource.next(false);
  }
}
