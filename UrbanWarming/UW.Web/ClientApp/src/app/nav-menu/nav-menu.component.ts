import { Component, Inject } from '@angular/core';
import { DOCUMENT } from '@angular/common';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import * as jwt_decode from "jwt-decode";

@Component({
  selector: 'app-nav-menu',
  templateUrl: './nav-menu.component.html',
  styleUrls: ['./nav-menu.component.css']
})
export class NavMenuComponent {
  public isLoggedIn: boolean = false;
  public isNotAutoDirect: boolean = true;

  constructor(@Inject('BASE_URL') baseUrl: string, @Inject(DOCUMENT) private document: Document) {
    this.isNotAutoDirect = true;

    if (localStorage.getItem('jwt') == undefined)
      this.isLoggedIn = false;
    else
      this.isLoggedIn = true;
  }

}
