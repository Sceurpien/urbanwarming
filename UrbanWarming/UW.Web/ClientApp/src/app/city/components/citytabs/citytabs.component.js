"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
var core_1 = require("@angular/core");
var free_solid_svg_icons_1 = require("@fortawesome/free-solid-svg-icons");
var CityTabsComponent = /** @class */ (function () {
    function CityTabsComponent() {
        this.onTabSelection = new core_1.EventEmitter();
        this.faMapMarkedAlt = free_solid_svg_icons_1.faMapMarkedAlt;
        this.faUsers = free_solid_svg_icons_1.faUsers;
        this.faIndustry = free_solid_svg_icons_1.faIndustry;
        this.faSeedling = free_solid_svg_icons_1.faSeedling;
        this.faHiking = free_solid_svg_icons_1.faHiking;
        this.faDollarSign = free_solid_svg_icons_1.faDollarSign;
        this.faLightbulb = free_solid_svg_icons_1.faLightbulb;
        this.faScroll = free_solid_svg_icons_1.faScroll;
    }
    CityTabsComponent.prototype.onClick = function (tab) {
        if (tab !== this.activeTab) {
            this.onTabSelection.emit(tab);
        }
    };
    __decorate([
        core_1.Input()
    ], CityTabsComponent.prototype, "activeTab", void 0);
    __decorate([
        core_1.Output()
    ], CityTabsComponent.prototype, "onTabSelection", void 0);
    CityTabsComponent = __decorate([
        core_1.Component({
            selector: 'citytab',
            templateUrl: './citytabs.component.html',
            styleUrls: ['./citytabs-component.css']
        })
    ], CityTabsComponent);
    return CityTabsComponent;
}());
exports.CityTabsComponent = CityTabsComponent;
//# sourceMappingURL=citytabs.component.js.map