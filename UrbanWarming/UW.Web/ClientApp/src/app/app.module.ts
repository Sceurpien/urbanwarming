import { NgModule, APP_INITIALIZER } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { NavMenuComponent } from './nav-menu/nav-menu.component';
import { HomeComponent } from './home/home.component';
import { CounterComponent } from './counter/counter.component';
import { FetchDataComponent } from './fetch-data/fetch-data.component';

import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';

import { SettingsService } from './setting/settings.service';
import { ApiUrlInterceptor } from './setting/api-url.interceptor';
import { BaseComponent } from './base/base.component';
import { CityComponent } from './city/city.component';
import { ForgotPasswordComponent } from './fpass/fpass.component';
import { ResetPasswordComponent } from './rpass/rpass.component';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';

import { CityTypeApi } from './api/citytype.api';
import { RegistrationApi } from './api/registration.api';

import { AuthenticationService } from './service/authentication.service';

@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    BaseComponent,
    HomeComponent,
    CityComponent,

    LoginComponent,
    RegisterComponent,
    ForgotPasswordComponent,
    ResetPasswordComponent,

    CounterComponent,
    FetchDataComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    BrowserAnimationsModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    FontAwesomeModule,
    RouterModule.forRoot([
      { path: '', component: BaseComponent, pathMatch: 'full' },
      { path: 'home', component: HomeComponent},
      { path: 'counter', component: CounterComponent },
      { path: 'fetch-data', component: FetchDataComponent },
      { path: 'city', component: CityComponent },

      { path: 'login', component: LoginComponent },
      { path: 'register', component: RegisterComponent },
      { path: 'fpass', component: ForgotPasswordComponent },
      { path: 'rpass/:token', component: ResetPasswordComponent }
    ])
  ],
  providers: [
    SettingsService,
    {
      provide: APP_INITIALIZER,
      useFactory: AppModule.init,
      deps: [
        SettingsService
      ],
      multi: true
    },
    {
      provide: HTTP_INTERCEPTORS,
      useClass: ApiUrlInterceptor,
      multi: true
    },
    CityTypeApi,
    RegistrationApi,
    AuthenticationService,
  ],
  bootstrap: [AppComponent]
})
export class AppModule {
  static init(settingsService: SettingsService) {
    return () => {
      return new Promise<void>((resolve, reject) => {
        settingsService
          .loadSettings()
          .toPromise()
          .catch(reject)
          .then(() => resolve());
      });
    };
  }
}
