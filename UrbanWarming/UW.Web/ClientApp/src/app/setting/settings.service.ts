import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { catchError, tap } from 'rxjs/operators';

import { ISettings } from './settings';

@Injectable()
export class SettingsService {
  /**
   * Application settings
   */
  settings: ISettings;

  /**
   * Checks if development env
   */
  get isDevelopmentEnv(): boolean {
    return !this.isProductionEnv;
  }

  /**
   * Checks if production env
   */
  get isProductionEnv(): boolean {
    return this.settings.production;
  }

  /**
   * App Settings service constructor
   * @param http Angular's HTTP service
   */
  constructor(private readonly http: HttpClient) { }

  /**
   * Loads the settings of the application from the JSON file
   */
  loadSettings(): Observable<ISettings> {
    const jsonFile = `assets/config/appsettings.json`;

    return this.http.get(jsonFile).pipe(
      tap((settings: ISettings) => (this.settings = settings)),
      catchError((err: any) => throwError(JSON.stringify(err)))
    );
  }
}
