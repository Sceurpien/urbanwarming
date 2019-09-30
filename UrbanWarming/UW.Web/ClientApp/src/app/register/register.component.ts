import { Component, Inject } from '@angular/core';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import * as jwt_decode from "jwt-decode";
import { Validators, FormBuilder, FormGroup } from '@angular/forms';
import { PasswordValidation } from '../validators/password.validator';

interface IUserData {
  loginname: string;
  email: string;
  password: string;
  passwordConfirm: string;
  cityType: string;
}

enum RegisterFormTypes {
  baseData = "baseData",
  cityType = "cityType"
}

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
})
export class RegisterComponent {
  public baseurl: string;
  public formType: RegisterFormTypes;

  public registrationForm: FormGroup;
  public cityTypeForm: FormGroup;

  constructor(@Inject('BASE_URL') baseUrl: string, private httpService: HttpClient, private route: ActivatedRoute, private fb: FormBuilder) {
    this.baseurl = baseUrl;
    this.formType = RegisterFormTypes.baseData;

    if (localStorage.getItem('jwt') != undefined)
      window.location.href = baseUrl + 'city/';

    this.buildForms();
  }


  public openSecondForm(): void {
    const user: IUserData = this.registrationForm.value;

    if (user.loginname && user.email && user.password === user.passwordConfirm) {
      this.formType = RegisterFormTypes.cityType;
    }
  }

  public onRegisterPost() {
    //this.err = false;
    //let data = {
    //  "loginname": this.loginname,
    //  "email": this.email,
    //  "password": this.password,
    //  "passwordConfirm": this.passwordConfirm,
    //  "citytype": this.citytype
    //};
    //let head = new HttpHeaders({
    //  'Content-Type': 'application/json'
    //});
    //this.httpService.post<string>('api/Register/Register', JSON.stringify(data), { headers: head }).subscribe(result => {
    //  if (result == "") {
    //    this.err = true;
    //  }
    //  else {
    //    localStorage.setItem('jwt', result);
    //    let token = this.getDecodedAccessToken(result);
    //    window.location.href = this.baseurl + 'home/';
    //  }
    //}, error => {
    //  console.error(error)
    //});
  }

  getDecodedAccessToken(token: string): any {
    try {
      return jwt_decode(token);
    }
    catch (Error) {
      return null;
    }
  }

  private buildForms(): void {
    this.registrationForm = this.fb.group({
      loginname: ['', [Validators.required]],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]],
      passwordConfirm: ['', [Validators.required]]
    }, { validator: PasswordValidation.MatchPassword });

    this.cityTypeForm = this.fb.group({
      cityType: ['', [Validators.required]]
    });
  }
}
