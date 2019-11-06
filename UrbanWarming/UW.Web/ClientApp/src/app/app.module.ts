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
import { CityTabsComponent } from './city/components/citytabs/citytabs.component';
import { BaseTabComponent } from './city/components/basetab/base-tab.component';
import { EnergyTabComponent } from './city/components/energytab/energy-tab.component';
import  {FinanceTabComponent } from './city/components/financetab/finance-tab.component';
import { IndustryTabComponent } from './city/components/industrytab/industry-tab.component';
import { PoliciesTabComponent } from './city/components/policiestab/policies-tab.component';
import { PopulationTabComponent } from './city/components/populationtab/population-tab.component';
import { ServicesTabComponent } from './city/components/servicestab/services-tab.component';
import { TourismTabComponent } from './city/components/tourismtab/tourism-tab.component';

import { CityTypeApi } from './api/citytype.api';
import { CityMapApi } from './api/citymap.api';
import { RegistrationApi } from './api/registration.api';

import { AuthenticationService } from './service/authentication.service';

@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    BaseComponent,
    HomeComponent,
    CityComponent,
    CityTabsComponent,
    BaseTabComponent,
    PopulationTabComponent,
    EnergyTabComponent,
    FinanceTabComponent,
    IndustryTabComponent,
    PoliciesTabComponent,
    ServicesTabComponent,
    TourismTabComponent,

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
    CityMapApi,
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
