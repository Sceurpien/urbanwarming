import {AbstractControl} from '@angular/forms';

export class PasswordValidation {
  static MatchPassword(control: AbstractControl) {
    let password = control.get('password').value;
    let confirmPassword = control.get('passwordConfirm').value;

    if (password !== confirmPassword) {
      control.get('passwordConfirm').setErrors({ passwordMatch: true });
    } else {
      return null;
    }
  }
}
