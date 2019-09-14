import { BrowserModule } from '@angular/platform-browser';
import { NgModule, APP_INITIALIZER } from '@angular/core';
import { FormsModule } from '@angular/forms';
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


@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    HomeComponent,
    CounterComponent,
    FetchDataComponent,

    LoginComponent,
    RegisterComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    FormsModule,
    RouterModule.forRoot([
      { path: '', component: BaseComponent, pathMatch: 'full' },
      { path: 'home', component: HomeComponent},
      { path: 'counter', component: CounterComponent },
      { path: 'fetch-data', component: FetchDataComponent },

      { path: 'login', component: LoginComponent },
      { path: 'register', component: RegisterComponent }
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
    },],
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
