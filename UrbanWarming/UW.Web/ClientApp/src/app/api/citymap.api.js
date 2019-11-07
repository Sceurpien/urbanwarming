"use strict";
var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
var base_api_1 = require("./base.api");
var core_1 = require("@angular/core");
var CityMapApi = /** @class */ (function (_super) {
    __extends(CityMapApi, _super);
    function CityMapApi(httpClient) {
        var _this = _super.call(this) || this;
        _this.httpClient = httpClient;
        return _this;
    }
    CityMapApi.prototype.getCityMap = function (cityId) {
        var header = this.createHeader();
        return this.httpClient.get('api/CityMap/' + cityId, { headers: header });
    };
    CityMapApi = __decorate([
        core_1.Injectable({
            providedIn: 'root'
        })
    ], CityMapApi);
    return CityMapApi;
}(base_api_1.ApiBase));
exports.CityMapApi = CityMapApi;
//# sourceMappingURL=citymap.api.js.map