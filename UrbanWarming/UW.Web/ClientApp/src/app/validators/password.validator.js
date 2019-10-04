"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var PasswordValidation = /** @class */ (function () {
    function PasswordValidation() {
    }
    PasswordValidation.MatchPassword = function (control) {
        var password = control.get('password').value;
        var confirmPassword = control.get('passwordConfirm').value;
        if (password !== confirmPassword) {
            control.get('passwordConfirm').setErrors({ passwordMatch: true });
        }
        else {
            return null;
        }
    };
    return PasswordValidation;
}());
exports.PasswordValidation = PasswordValidation;
//# sourceMappingURL=password.validator.js.map