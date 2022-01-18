import { HttpInterceptorParams } from 'src/app/modules/core/models/http-interceptor-params.model';
import {
  HttpEvent,
  HttpHandler,
  HttpInterceptor,
  HttpRequest,
} from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { finalize } from 'rxjs/operators';
import { LoadingService } from '../services/loading.service';

@Injectable()
export class LoadingInterceptor implements HttpInterceptor {
  private requests: HttpRequest<any>[] = [];
  constructor(private loadingService: LoadingService) {}

  public intercept(
    req: HttpRequest<any>,
    next: HttpHandler
  ): Observable<HttpEvent<any>> {
    const hideLoading = (req.params as HttpInterceptorParams).interceptorConfig
      ?.hideLoading;

    if (!hideLoading) {
      this.requests.push(req);
      this.loadingService.startLoading();
    }

    return next.handle(req).pipe(
      finalize(() => {
        if (!hideLoading) {
          this.removeRequest(req);
        }
      })
    );
  }

  public removeRequest(req: HttpRequest<any>): void {
    const i = this.requests.indexOf(req);
    if (i >= 0) {
      this.requests.splice(i, 1);
    }

    if (!this.requests.length) {
      this.loadingService.endLoading();
    }
  }
}
