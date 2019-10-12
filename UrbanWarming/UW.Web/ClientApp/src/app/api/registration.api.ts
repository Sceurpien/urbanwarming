import { ApiBase } from './base.api';
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { IRegisterModel } from './contracts/IRegisterModel';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})

export class RegistrationApi extends ApiBase {
  constructor(private httpClient: HttpClient) {
    super();
  }

  public registerUser(model: IRegisterModel): Observable<string> {
    const head = this.createHeader();

    return this.httpClient.post<string>('api/register/register', JSON.stringify(model), { headers: head });
  }
}
