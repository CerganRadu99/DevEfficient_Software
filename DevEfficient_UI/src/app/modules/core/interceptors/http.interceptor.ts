import { AuthService } from './../services/auth.service';
import { HttpInterceptorParams } from 'src/app/modules/core/models/http-interceptor-params.model';
import {
  HttpEvent,
  HttpInterceptor,
  HttpHandler,
  HttpRequest,
  HttpErrorResponse,
  HttpStatusCode,
} from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, filter, tap } from 'rxjs/operators';
import { Injectable } from '@angular/core';
import { BadRequestError } from '../models/bad-request-error';
import { NotFoundError } from '../models/not-found-error';
import { ConflictError } from '../models/conflict-error';
import { ForbiddenError } from '../models/forbidden-error';
import { UnauthorizedError } from '../models/unauthorized-error';
import { AppError } from '../models/app-error';
import { AlertService } from '../services/alert.service';

@Injectable()
export class AppHttpInterceptor implements HttpInterceptor {
  constructor(private alertService: AlertService, private authService: AuthService) {}

  intercept(
    req: HttpRequest<any>,
    next: HttpHandler
  ): Observable<HttpEvent<any>> {
    const config = (req.params as HttpInterceptorParams).interceptorConfig;
    const successMessage = config?.successMessage ?? '';
    const showSuccessMessage = config?.showSuccessMessage;
    const request = req.clone({
      headers: req.headers.set('Content-Type', 'application/json'),
    });

    return next.handle(request).pipe(
      filter((e) => e.type !== 0),
      tap(() => {
        if (showSuccessMessage) this.alertService.showSuccess(successMessage);
      }),
      catchError((err) => this.handleError(err))
    );
  }

  public handleError(errorResponse: HttpErrorResponse): Observable<never> {
    switch (errorResponse?.status) {
      case HttpStatusCode.BadRequest: {
        throw new BadRequestError(errorResponse?.error);
      }
      case HttpStatusCode.NotFound: {
        throw new NotFoundError(errorResponse?.error);
      }
      case HttpStatusCode.Conflict: {
        throw new ConflictError(errorResponse?.error);
      }
      case HttpStatusCode.Forbidden: {
        throw new ForbiddenError(errorResponse?.error);
      }
      case HttpStatusCode.Unauthorized: {
        this.authService.logout();
        throw new UnauthorizedError(errorResponse?.error);
      }
      case HttpStatusCode.InternalServerError: {
        throw new AppError('Invalid Request');
      }
    }

    return throwError(() => errorResponse);
  }
}
