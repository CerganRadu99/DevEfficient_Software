export interface ResponseModel<T> {
    data: T;
    succeeded: boolean;
    errors: string[];
  }