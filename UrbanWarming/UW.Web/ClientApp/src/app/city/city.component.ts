import { Component, Inject } from '@angular/core';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import * as jwt_decode from "jwt-decode";

@Component({
  selector: 'city',
  templateUrl: './city.component.html',
})
export class CityComponent {
  constructor(@Inject('BASE_URL') baseUrl: string) {
    if (localStorage.getItem('jwt') == undefined)
      window.location.href = baseUrl + 'login/';


  }
}
