import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { HttpInterceptorParams } from 'src/app/modules/core/models/http-interceptor-params.model';
import { PaginatedResultModel } from '../models/paginated-result.model';
import { HttpInterceptorConfig } from '../models/http-interceptor-config.model';

export abstract class DataService {
  protected url: string;

  constructor(
    public http: HttpClient,
    private urlString: string,
    private baseUrl?: string
  ) {
    if (!baseUrl) {
      this.url =
        this.urlString === ''
          ? environment.baseApiUrl
          : `${environment.baseApiUrl}/${urlString}`;
    } else {
      this.url =
        this.urlString === '' ? this.baseUrl! : `${this.baseUrl}/${urlString}`;
    }
  }

  private getOne<T>(
    url: string,
    params?: HttpInterceptorConfig
  ): Observable<T> {
    const options = {
      params: new HttpInterceptorParams(params),
    };

    return this.http.get<T>(url, options);
  }

  public getMany<T>(
    path: string,
    params?: HttpInterceptorConfig
  ): Observable<T> {
    const url = path ? `${this.url}/${path}` : `${this.url}`;
    const options = {
      params: new HttpInterceptorParams(params),
    };

    return this.http.get<T>(url, options);
  }

  public update<T>(
    id: string,
    entity: any,
    path?: string,
    params?: HttpInterceptorConfig
  ): Observable<T> {
    const body = JSON.stringify(entity);
    const url = path ? `${this.url}/${path}/${id}` : `${this.url}/${id}`;
    const options = {
      params: new HttpInterceptorParams(params),
    };
    return this.http.put<T>(url, body, options);
  }

  public updateWithoutBody<T> (
    id: string,
    entity?: any,
    path?: string,
    params?: HttpInterceptorConfig
  ): Observable<T>{
    let body = null;
    if(entity) {
      body = JSON.stringify(entity);
    }
    const url = path ? `${this.url}/${path}/${id}` : `${this.url}/${id}`;
    const options = {
      params: new HttpInterceptorParams(params),
    };

    return this.http.put<T>(url, body, options);
  }

  public updateMultiple<T>(
    array: any[],
    path?: string,
    params?: HttpInterceptorConfig
  ): Observable<T> {
    const body = JSON.stringify(array);
    const url = path ? `${this.url}/${path}/` : `${this.url}/`;
    const options = {
      params: new HttpInterceptorParams(params),
    };

    return this.http.put<T>(url, body, options);
  }

  public add<T>(
    entity: any,
    path?: string,
    params?: HttpInterceptorConfig
  ): Observable<T> {
    const body = JSON.stringify(entity);
    const url = path ? `${this.url}/${path}` : `${this.url}`;
    const options = {
      params: new HttpInterceptorParams(params),
    };

    return this.http.post<T>(url, body, options);
  }

  public post<T>(
    path: string,
    data: any,
    params?: HttpInterceptorConfig
  ): Observable<T> {
    const body = data ? JSON.stringify(data) : {};
    const url = `${this.url}/${path}`;
    const options = {
      params: new HttpInterceptorParams(params),
    };

    return this.http.post<T>(url, body, options);
  }

  public put<T>(
    path: string,
    data: any,
    params?: HttpInterceptorConfig
  ): Observable<T> {
    const body = data ? JSON.stringify(data) : {};
    const url = `${this.url}/${path}`;
    const options = {
      params: new HttpInterceptorParams(params),
    };

    return this.http.put<T>(url, body, options);
  }

  public delete(
    id: string,
    path?: string,
    params?: HttpInterceptorConfig
  ): Observable<any> {
    const url = path ? `${this.url}/${path}/${id}` : `${this.url}/${id}`;

    const options = {
      params: new HttpInterceptorParams(params),
    };

    return this.http.delete<any>(url, options);
  }

  public deleteWithoutId(
    path: string,
    id?: string,
    params?: HttpInterceptorConfig
  ): Observable<any> {
    const url = id ? `${this.url}/${path}/${id}` : `${this.url}/${path}`;

    const options = {
      params: new HttpInterceptorParams(params),
    };

    return this.http.delete<any>(url, options);
  }

  public deleteMultiple(
    ids: number[],
    path?: string,
    params?: HttpInterceptorConfig
  ): Observable<any> {
    const body = JSON.stringify(ids);
    const url = path ? `${this.url}/${path}` : `${this.url}`;

    const options = { params: new HttpInterceptorParams(params), body };

    return this.http.delete<any>(url, options);
  }

  public getOneById<T>(
    id: string,
    params?: HttpInterceptorConfig
  ): Observable<T> {
    const url = `${this.url}/${id}`;

    return this.getOne<T>(url, params);
  }

  public getOneByPath<T>(
    path: string,
    params?: HttpInterceptorConfig
  ): Observable<T> {
    const url = `${this.url}/${path}`;

    return this.getOne<T>(url, params);
  }

  public getAll<T>(params?: HttpInterceptorConfig): Observable<T> {
    return this.getMany<T>('', params);
  }

  public getPaginated<T>(
    pageIndex: number,
    itemsNumber: number,
    searchKey: string,
    apiPath?: string,
    params?: HttpInterceptorConfig
  ): Observable<PaginatedResultModel<T>> {
    let path = apiPath ? `paginated/${apiPath}` : 'paginated';
    path = `${path}?pageIndex=${pageIndex}&itemsNumber=${itemsNumber}&key=${searchKey}`;

    return this.post<PaginatedResultModel<T>>(path, {}, params);
  }

  /*
  This method is not REST-compliant as it sends the filter in the body of a POST request.
  However, in practice this is a viable solution when the filter is larger than the limit specified by the browser or web server.
  */
  public getPaginatedWithFilter<T, V>(
    pageIndex: number,
    itemsNumber: number,
    sortField: string,
    sortDirection?: string,
    filter?: V,
    params?: HttpInterceptorConfig
  ): Observable<PaginatedResultModel<T>> {
    if (!sortField) {
      sortField = '';
    }
    if (!sortDirection) {
      sortDirection = '';
    }
    const path = `paginated?pageIndex=${pageIndex}&itemsNumber=${itemsNumber}&sortField=${sortField}&sortDirection=${sortDirection}`;

    return this.post<PaginatedResultModel<T>>(path, filter, params);
  }
}
