import { Component, Inject } from '@angular/core';
import { Validators, FormBuilder, FormGroup } from '@angular/forms';
import { PasswordValidation } from '../validators/password.validator';
import { ICityType } from '../api/contracts/ICityType';
import { faAngleLeft, faAnchor, faRoad } from '@fortawesome/free-solid-svg-icons';
import { CityTypeApi } from '../api/citytype.api';
import { IRegisterModel } from '../api/contracts/IRegisterModel';
import { RegisterFormState } from './model/registerFormState';
import { AuthenticationService } from '../service/authentication.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
})
export class RegisterComponent {
  public faAngleLeft = faAngleLeft;
  public faAnchor = faAnchor;
  public faRoad = faRoad;

  public baseurl: string;
  public formState: RegisterFormState;
  public saving: boolean;

  public registrationForm: FormGroup;
  public cityTypeForm: FormGroup;

  public cityTypes: ICityType[];

  constructor(
    @Inject('BASE_URL') baseUrl: string,
    private fb: FormBuilder,
    private cityTypeApi: CityTypeApi,
    private authenticationService: AuthenticationService) {
    this.baseurl = baseUrl;

    if (localStorage.getItem('jwt') != undefined)
      window.location.href = baseUrl + 'city/';

    this.initialize();
  }

  public openSecondForm(): void {
    const model: IRegisterModel = this.registrationForm.value;

    if (model.loginname && model.email && model.password === model.passwordConfirm) {
      this.formState = RegisterFormState.cityType;
    }
  }

  public goToBaseForm(): void {
    this.formState = RegisterFormState.baseData;
  }

  public onRegisterPost() {
    const model: IRegisterModel = this.registrationForm.value;

    model.cityType = this.cityTypeForm.value.cityType.id.toString();

    this.authenticationService.registerUser(model);
    this.saving = true;
  }

  private initialize(): void {
    this.formState = RegisterFormState.baseData;
    this.saving = false;

    this.buildForms();
    this.loadCityTypes();
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
    this.cityTypeApi.getAllCityTypes().subscribe(result => {
      this.cityTypes = result;
    });
  }
}
