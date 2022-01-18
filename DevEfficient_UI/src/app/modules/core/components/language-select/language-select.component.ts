import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { TranslateService } from '@ngx-translate/core';
import { Subscription } from 'rxjs';
import { environment } from 'src/environments/environment';
import { LanguageModel } from '../../models/language.model';

@Component({
  selector: 'app-language-select',
  templateUrl: './language-select.component.html',
  styleUrls: ['./language-select.component.scss'],
})
export class LanguageSelectComponent implements OnInit, OnDestroy {
  public currentLanguage: string = '';
  public formControl: FormControl;
  languageOptions: LanguageModel[];
  private subscriptions: Subscription[] = [];

  constructor(private translateService: TranslateService) {
    this.formControl = new FormControl();
    this.languageOptions = environment.appSettings.languages;
  }

  ngOnInit(): void {
    this.currentLanguage =
      this.translateService.currentLang || this.translateService.defaultLang;

    this.formControl.setValue(this.currentLanguage);

    this.subscriptions.push(
      this.formControl.valueChanges.subscribe({
        next: (newVal) => this.translateService.use(newVal),
      })
    );
  }

  ngOnDestroy(): void {
    this.subscriptions.forEach((s) => s.unsubscribe());
  }
}
