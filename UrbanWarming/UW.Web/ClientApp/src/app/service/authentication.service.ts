import { Injectable } from '@angular/core';
import { Inject } from '@angular/core';
import * as jwt_decode from "jwt-decode";
import { IRegisterModel } from '../api/contracts/IRegisterModel';
import { RegistrationApi } from '../api/registration.api';

@Injectable({
  providedIn: 'root'
})

export class AuthenticationService {
  public baseurl: string;

  constructor(@Inject('BASE_URL') baseUrl: string, private registrationApi: RegistrationApi) {
    this.baseurl = baseUrl;
  }

  public registerUser(model: IRegisterModel): void {
    this.registrationApi.registerUser(model).subscribe(result => {
      let redirect = 'login/';

      if (result && result.length > 0) {
        localStorage.setItem('jwt', result);
        let token = this.getDecodedAccessToken(result);
      } else {
        redirect = 'register/';
      }
      window.location.href = this.baseurl + redirect;
    });
  }

  private getDecodedAccessToken(token: string): any {
    try {
      return jwt_decode(token);
    }
    catch (Error) {
      return null;
    }
  }
}
