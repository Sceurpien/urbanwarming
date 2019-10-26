import { ApiBase } from './base.api';
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ICityType } from './contracts/ICityType';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})

export class CityTypeApi extends ApiBase {
  constructor(private httpClient: HttpClient) {
    super();
  }

  public getAllCityTypes(): Observable<ICityType[]> {
    const header = this.createHeader();

    return this.httpClient.get<ICityType[]>('api/CityType/GetAll', { headers: header });
  }
}
