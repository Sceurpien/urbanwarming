import { Component, OnInit } from "@angular/core";
import { CityMapApi } from '../../../api/citymap.api';
import { ICityMapRow } from '../../../api/contracts/ICityMap';

@Component({
  selector: 'base-tab',
  templateUrl: './base-tab.component.html',
  styleUrls: ['./base-tab.component.css']
})

export class BaseTabComponent implements OnInit {

  public cityMapRows: ICityMapRow[];

  constructor(private cityMapApi: CityMapApi) {
  }

  ngOnInit(): void {
    // TODO: get city id from..? 
    this.cityMapApi.getCityMap(1).subscribe(response => {
      this.cityMapRows = response;
    });
  }
}
