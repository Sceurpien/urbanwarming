import { Component, Inject } from '@angular/core';
import { CityTab } from './model/cityTab';

@Component({
  selector: 'city',
  templateUrl: './city.component.html',
  styleUrls: ['./city.component.css']
})

export class CityComponent {
  public activeTab: CityTab;

  constructor(@Inject('BASE_URL') baseUrl: string) {
    this.activeTab = CityTab.base;
  }

  public onTabSelection(tab: CityTab): void {
    this.activeTab = tab;
  }
}
