import { Component, Inject } from '@angular/core';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import * as jwt_decode from "jwt-decode";

@Component({
  selector: 'app-fpass',
  templateUrl: './fpass.component.html',
})
export class ForgotPasswordComponent {
  public baseurl: string;
  public loginname: string;
  public email: string;
  public err: boolean;
  public processed: boolean = false;

  constructor(@Inject('BASE_URL') baseUrl: string, private httpService: HttpClient, private route: ActivatedRoute) {
    this.baseurl = baseUrl;
    this.err = false;
    this.loginname = '';
    this.email = '';

    if (localStorage.getItem('jwt') != undefined)
      window.location.href = baseUrl + 'city/';
  }

  onForgotPasswordPost() {
    this.err = false;
    let data = {
      "loginname": this.loginname,
      "email": this.email
    };
    let head = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    this.httpService.post<string>('api/ForgotPassword/ForgotPassword', JSON.stringify(data), { headers: head }).subscribe(result => {
      if (result == "") {
        this.err = true;
      }
      else {
        this.processed = true;
      }
    }, error => {
      console.error(error)
    });
  }

  getDecodedAccessToken(token: string): any {
    try {
      return jwt_decode(token);
    }
    catch (Error) {
      return null;
    }
  }
}
