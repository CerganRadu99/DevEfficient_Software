export interface PaginatedResultModel<T> {
  rowsCount: number;
  data: T[];
}
