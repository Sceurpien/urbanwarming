import { Component, Inject } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';

@Component({
  selector: 'base',
  templateUrl: './base.component.html',
})
export class BaseComponent {
  constructor(@Inject('BASE_URL') baseUrl: string) {
    if (localStorage.getItem('jwt') == undefined)
      window.location.href = baseUrl + 'home/';
    else
      window.location.href = baseUrl + 'city/';
  }
}
