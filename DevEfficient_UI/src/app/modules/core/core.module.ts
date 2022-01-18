import { LoadingSpinnerComponent } from './components/loading-spinner/loading-spinner.component';
import { NavigationComponent } from './components/navigation/navigation.component';
import { LanguageSelectComponent } from './components/language-select/language-select.component';
import { AuthInterceptor } from './interceptors/auth.interceptor';
import {
  HttpClient,
  HttpClientModule,
  HTTP_INTERCEPTORS,
} from '@angular/common/http';
import { ErrorHandler, NgModule, Optional, SkipSelf } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import {
  TranslateCompiler,
  TranslateLoader,
  TranslateModule,
} from '@ngx-translate/core';
import { TranslateHttpLoader } from '@ngx-translate/http-loader';
import { environment } from 'src/environments/environment';
import { AppErrorHandler } from './app-error-handler';
import { AppHttpInterceptor } from './interceptors/http.interceptor';
import { LoadingInterceptor } from './interceptors/loading-interceptor';
import { TranslateMessageFormatCompiler } from 'ngx-translate-messageformat-compiler';
import { RouterModule } from '@angular/router';

// AoT requires an exported function for factories
export function createTranslateLoader(httpClient: HttpClient): TranslateLoader {
  return new TranslateHttpLoader(httpClient, 'assets/i18n/', '.json');
}

@NgModule({
  imports: [
    BrowserModule,
    HttpClientModule,
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useFactory: createTranslateLoader,
        deps: [HttpClient],
      },
      compiler: {
        provide: TranslateCompiler,
        useClass: TranslateMessageFormatCompiler,
      },
      defaultLanguage: environment.defaultLanguage,
      useDefaultLang: true,
    }),
    ReactiveFormsModule,
    RouterModule
  ],
  declarations: [NavigationComponent, LanguageSelectComponent, LoadingSpinnerComponent],
  exports: [TranslateModule, ReactiveFormsModule, NavigationComponent, LanguageSelectComponent, LoadingSpinnerComponent],
  providers: [
    { provide: HTTP_INTERCEPTORS, useClass: AppHttpInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: LoadingInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi: true },
    { provide: ErrorHandler, useClass: AppErrorHandler },
  ],
})
export class CoreModule {
  constructor(@Optional() @SkipSelf() parentModule: CoreModule) {
    if (parentModule) {
      throw new Error(
        'CoreModule is already loaded. Import it in the AppModule only'
      );
    }
  }
}
