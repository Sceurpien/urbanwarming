import { Component, Inject } from '@angular/core';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import * as jwt_decode from "jwt-decode";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
})
export class LoginComponent {
  public baseurl: string;
  public loginname: string;
  public password: string;
  public err: boolean;

  constructor(@Inject('BASE_URL') baseUrl: string, private httpService: HttpClient, private route: ActivatedRoute) {
    this.baseurl = baseUrl;
    this.err = false;
    this.loginname = '';
    this.password = '';
  }

  onLoginPost() {
    this.err = false;
    let data = {
      "loginname": this.loginname,
      "password": this.password
    };
    let head = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    this.httpService.post<string>('api/Login/Login', JSON.stringify(data), { headers: head }).subscribe(result => {
      if (result == "") {
        this.err = true;
      }
      else {
        localStorage.setItem('jwt', result);
        let token = this.getDecodedAccessToken(result);
        window.location.href = this.baseurl + 'home/';
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
