"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
var core_1 = require("@angular/core");
var core_2 = require("@angular/core");
var jwt_decode = require("jwt-decode");
var AuthenticationService = /** @class */ (function () {
    function AuthenticationService(baseUrl, registrationApi) {
        this.registrationApi = registrationApi;
        this.baseurl = baseUrl;
    }
    AuthenticationService.prototype.registerUser = function (model) {
        var _this = this;
        this.registrationApi.registerUser(model).subscribe(function (result) {
            var redirect = 'login/';
            if (result && result.length > 0) {
                localStorage.setItem('jwt', result);
                var token = _this.getDecodedAccessToken(result);
            }
            else {
                redirect = 'register/';
            }
            window.location.href = _this.baseurl + redirect;
        });
    };
    AuthenticationService.prototype.getDecodedAccessToken = function (token) {
        try {
            return jwt_decode(token);
        }
        catch (Error) {
            return null;
        }
    };
    AuthenticationService = __decorate([
        core_1.Injectable({
            providedIn: 'root'
        }),
        __param(0, core_2.Inject('BASE_URL'))
    ], AuthenticationService);
    return AuthenticationService;
}());
exports.AuthenticationService = AuthenticationService;
//# sourceMappingURL=authentication.service.js.map