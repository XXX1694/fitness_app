class Validation {
  checkPassword(String pass1, String pass2) {
    if (!validateStructure(pass1)) {
      return false;
    }
    return true;
  }
}

bool validateStructure(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}
/*
  1 - passwords are not sanme
  2 - password should contain at least one upper case
      should contain at least one lower case
      should contain at least one digit
      should contain at least one Special character
      Must be at least 8 characters in length  
  3 - password is ok
*/
