import 'package:get/get.dart';

String? validateText(String text) {
  if (text.isEmpty) {
    return 'Can\'t be empty';
  }
  return null;
}

String? validateEmail(String value) {
  if (value.isEmpty) {
    return 'Email is required.';
  } else if (!GetUtils.isEmail(value)) {
    return 'Invalid email format.';
  } else {
    return null;
  }
}
String? validateMobile(String value,int? l) {
// Indian Mobile number are of 10 digit only
  if (value.length != l) {
    return 'Mobile Number must be of $l digit';
  } else {
    return null;
  }
}

String? validatePassword(String value) {
  RegExp regex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  var passNonNullValue = value;
  if (passNonNullValue.isEmpty) {
    return ("Password is required");
  } else if (passNonNullValue.length < 6) {
    return ("Password Must be more than 5 characters");
  } else if (!regex.hasMatch(passNonNullValue)) {
    return ("Password should contain upper,lower,digit and Special character ");
  }
  return null;
}