import { Component, EventEmitter, Input, OnChanges, Output, SimpleChanges } from "@angular/core";
import { FormBuilder, FormControl, FormGroup, Validators } from "@angular/forms";
import { PageEvent } from "./models/page-event";

@Component({
  selector: 'app-paginator',
  templateUrl: './paginator.component.html',
  styleUrls: ['./paginator.component.scss']
})
export class PaginatorComponent implements OnChanges {
  public form: FormGroup = new FormGroup({});
  private FIRST_PAGE_INDEX = 0;
  private INITIAL_NUMBER_OF_PAGES = 1;
  private DEFAULT_PAGE_SIZE = 5;
  private DEFAULT_PAGE_SIZE_OPTIONS = [5, 10, 25];

  constructor(private formBuilder: FormBuilder) {
    this.createForm();
  }

  @Input() pageSize: number = this.DEFAULT_PAGE_SIZE;
  @Input() pageSizeOptions: Array<number> = this.DEFAULT_PAGE_SIZE_OPTIONS;
  @Input() length: number = 0;

  @Output() pageChanged = new EventEmitter<PageEvent>();

  ngOnChanges(changes: SimpleChanges): void {
    if (changes.length || changes.pageSize) {
      this.updateFormValues();
    }
  }

  get currentPage(): FormControl {
    return this.form.get('currentPage') as FormControl;
  }

  get currentPageSize(): FormControl {
    return this.form.get('currentPageSize') as FormControl;
  }

  get numberOfPages(): FormControl {
    return this.form.get('numberOfPages') as FormControl;
  }

  get hasPreviousPage(): boolean {
    return this.currentPage.value > this.FIRST_PAGE_INDEX;
  }

  get hasNextPage(): boolean {
    return this.currentPage.value < this.numberOfPages.value - 1;
  }

  public onChangePageSize(event: unknown): void {
    this.convertCurrentPageSizeValueToNumeric();
    this.numberOfPages.setValue(this.getNumberOfPages());
    this.moveToFirstPage();
    this.emitEvent();
  }

  public onClickPreviousPage() {
    if (this.hasPreviousPage) {
      this.currentPage.setValue(this.currentPage.value - 1);
      this.emitEvent();
    }
  }

  public onClickNextPage() {
    if (this.hasNextPage) {
      this.currentPage.setValue(this.currentPage.value + 1);
      this.emitEvent();
    }
  }

  private createForm() {
    this.form = this.formBuilder.group({
      currentPage: this.formBuilder.control(this.FIRST_PAGE_INDEX),
      currentPageSize: this.formBuilder.control(this.DEFAULT_PAGE_SIZE, Validators.required),
      numberOfPages: this.formBuilder.control(this.INITIAL_NUMBER_OF_PAGES)
    });
  }

  private updateFormValues() {
    this.currentPageSize.setValue(this.pageSize);
    this.numberOfPages.setValue(this.getNumberOfPages());
    this.moveToFirstPage();
  }

  private emitEvent() {
    this.pageChanged.emit({
      pageIndex: this.currentPage.value,
      pageSize: this.currentPageSize.value,
      length: this.length
    });
  }

  private getNumberOfPages(): number {
    if (this.length === 0){
      return 1;
    }

    return Math.ceil(this.length / this.currentPageSize.value);
  }

  private convertCurrentPageSizeValueToNumeric() {
    this.currentPageSize.setValue(Number(this.currentPageSize.value));
  }

  private moveToFirstPage() {
    if (this.currentPage.value !== this.FIRST_PAGE_INDEX)
      this.currentPage.setValue(this.FIRST_PAGE_INDEX);
  }
}
