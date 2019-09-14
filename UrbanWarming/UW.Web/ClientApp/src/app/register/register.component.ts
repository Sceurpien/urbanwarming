import { Component, Inject } from '@angular/core';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import * as jwt_decode from "jwt-decode";

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
})
export class RegisterComponent {
  public baseurl: string;
  public loginname: string;
  public email: string;
  public password: string;
  public citytype: string;
  public err: boolean;

  constructor(@Inject('BASE_URL') baseUrl: string, private httpService: HttpClient, private route: ActivatedRoute) {
    this.baseurl = baseUrl;
    this.err = false;
    this.loginname = '';
    this.email = '';
    this.password = '';
    this.citytype = '';

    if (localStorage.getItem('jwt') != undefined)
      window.location.href = baseUrl + 'home/';
  }

  onRegisterPost() {
    this.err = false;
    let data = {
      "loginname": this.loginname,
      "email": this.email,
      "password": this.password,
      "citytype": this.citytype
    };
    let head = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    this.httpService.post<string>('api/Register/Register', JSON.stringify(data), { headers: head }).subscribe(result => {
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
