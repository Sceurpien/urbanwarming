import { HttpEvent, HttpHandler, HttpInterceptor, HttpRequest } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

import { SettingsService } from './settings.service';

@Injectable()
export class ApiUrlInterceptor implements HttpInterceptor {
  /**
   * API url interceptor service
   * @param settingsService app settings service
   */
  constructor(private readonly settingsService: SettingsService) { }

  /**
   * Intercepts every request for the API by changing the base URL set in settings
   * @param request the current request
   * @param next the request handler
   */
  intercept(
    request: HttpRequest<any>,
    next: HttpHandler
  ): Observable<HttpEvent<any>> {
    // Check if the url was not already set
    // Or check if the url is for the API
    if (request.url.startsWith('http') || !request.url.startsWith('api/')) {
      return next.handle(request);
    }

    // Clone and modify the url with the API base url
    const clone = request.clone({
      url: `${this.settingsService.settings.apiUrl}/${request.url}`
    });

    // Add the json content type header if not set
    if (
      clone.body != null &&
      !(clone.headers.has('Content-Type') || clone.headers.has('content-type'))
    ) {
      clone.headers.set('Content-Type', 'application/json');
    }

    return next.handle(clone);
  }
}
