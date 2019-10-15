import { Component, EventEmitter, Input, Output } from '@angular/core';
import { CityTab } from '../../model/cityTab';
import { faMapMarkedAlt, faUsers, faIndustry, faSeedling, faHiking, faDollarSign, faLightbulb, faScroll } from '@fortawesome/free-solid-svg-icons';

@Component({
  selector: 'citytab',
  templateUrl: './citytabs.component.html',
  styleUrls: ['./citytabs-component.css']
})

export class CityTabsComponent {
  @Input() activeTab: CityTab;
  @Output() onTabSelection = new EventEmitter<CityTab>();

  public faMapMarkedAlt = faMapMarkedAlt;
  public faUsers = faUsers;
  public faIndustry = faIndustry;
  public faSeedling = faSeedling;
  public faHiking = faHiking;
  public faDollarSign = faDollarSign;
  public faLightbulb = faLightbulb;
  public faScroll = faScroll;

  public onClick(tab: CityTab): void {
    if (tab !== this.activeTab) {
      this.onTabSelection.emit(tab);
    }
  }
}
