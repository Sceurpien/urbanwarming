import { Component, Inject } from '@angular/core';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import * as jwt_decode from "jwt-decode";
import { Validators, FormBuilder, FormGroup } from '@angular/forms';
import { PasswordValidation } from '../validators/password.validator';
import { ICityType } from '../api/contracts/ICityType';

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

  public cityTypes: ICityType[];

  constructor(@Inject('BASE_URL') baseUrl: string, private httpService: HttpClient, private route: ActivatedRoute, private fb: FormBuilder) {
    this.baseurl = baseUrl;
    this.formType = RegisterFormTypes.baseData;

    if (localStorage.getItem('jwt') != undefined)
      window.location.href = baseUrl + 'city/';

    this.buildForms();
      this.loadCityTypes();
  }


  public openSecondForm(): void {
    const user: IUserData = this.registrationForm.value;

    if (user.loginname && user.email && user.password === user.passwordConfirm) {
      this.formType = RegisterFormTypes.cityType;

    }
  }

  public goToBaseForm(): void {
    this.formType = RegisterFormTypes.baseData;
  }

  public onRegisterPost() {
    // TODO: refactor
    const user: IUserData = this.registrationForm.value;
    const cityTypeForm: ICityType = this.cityTypeForm.value;

    user.cityType = this.cityTypeForm.value.cityType.id.toString();
    const head = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    this.httpService.post<string>('api/register/register', JSON.stringify(user), { headers: head }).subscribe(result => {

      localStorage.setItem('jwt', result);
      let token = this.getDecodedAccessToken(result);
      window.location.href = this.baseurl + 'city/';
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

  private loadCityTypes(): void {
    // TODO: refactor
    const head = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    this.httpService.get<ICityType[]>('api/CityType/GetAll', { headers: head }).subscribe(result  => {
      this.cityTypes = result;
    }, error => {
      console.error(error)
    });
  }

}
