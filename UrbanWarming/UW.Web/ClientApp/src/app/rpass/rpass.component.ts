import { Component, Inject } from '@angular/core';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import * as jwt_decode from "jwt-decode";

@Component({
  selector: 'app-rpass',
  templateUrl: './rpass.component.html',
})
export class ResetPasswordComponent {
  public baseurl: string;
  private sub: any;
  public token: string;
  public password1: string;
  public password2: string;
  public err: boolean;
  public processed: boolean = false;

  constructor(@Inject('BASE_URL') baseUrl: string, private httpService: HttpClient, private route: ActivatedRoute) {
    this.baseurl = baseUrl;
    this.err = false;
    this.token = '';
    this.password1 = '';
    this.password2 = '';

    this.sub = this.route.params.subscribe(params => {
      this.token = params['token'];
    });

    if (localStorage.getItem('jwt') != undefined)
      window.location.href = baseUrl + 'city/';
  }

  onResetPasswordPost() {
    this.err = false;
    if (this.password1 === this.password2 && this.password1.length > 6) {
      let data = {
        "token": this.token,
        "password": this.password1
      };
      let head = new HttpHeaders({
        'Content-Type': 'application/json'
      });
      this.httpService.post<string>('api/ForgotPassword/ResetPassword', JSON.stringify(data), { headers: head }).subscribe(result => {
        if (result == "") {
          this.err = true;
        }
        else {
          window.location.href = this.baseurl + 'login/';
        }
      }, error => {
        console.error(error)
      });
    }
    
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
