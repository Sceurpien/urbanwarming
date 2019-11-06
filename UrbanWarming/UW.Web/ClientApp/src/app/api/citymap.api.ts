import { ApiBase } from './base.api';
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ICityMapRow } from './contracts/ICityMap';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CityMapApi extends ApiBase {
  constructor(private httpClient: HttpClient) {
    super();
  }

  public getCityMap(cityId: number): Observable<ICityMapRow[]> {
    const header = this.createHeader();

    return this.httpClient.get<ICityMapRow[]>('api/CityMap/' + cityId, { headers: header });
  }
}
