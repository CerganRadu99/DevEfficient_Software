import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { LoadingService } from '../../services/loading.service';

@Component({
  selector: 'app-loading-spinner',
  templateUrl: './loading-spinner.component.html',
  styleUrls: ['./loading-spinner.component.scss'],
})
export class LoadingSpinnerComponent implements OnInit, OnDestroy {
  public isLoading!: boolean;
  public subs: Subscription[] = [];

  constructor(private loadingService: LoadingService) {}

  public ngOnInit(): void {
    this.subs.push(
      this.loadingService.isLoading$.subscribe(
        (loading: boolean) => (this.isLoading = loading)
      )
    );
  }

  public ngOnDestroy(): void {
    this.subs.forEach((s) => s.unsubscribe());
  }
}
