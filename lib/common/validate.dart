validateRFC(String rfc) {
  String exp =
      r'/^([A-ZÑ&]{3,4}) ?(?:- ?)?(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])) ?(?:- ?)?([A-Z\d]{2})([A\d])$/';
  return RegExp(exp).hasMatch(rfc);
}

validateEmail(String email) {
  String exp = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  return RegExp(exp).hasMatch(email);
}

validatePhoneNumber(String phoneNumber) {
  String exp = r'^(?:[+0]9)?[0-9]{8,15}$';
  return RegExp(exp).hasMatch(phoneNumber);
}

validateZipCode(String zipCode) {
  String exp = r'^[0-9]{5}(?:-[0-9]{4})?$';
  return RegExp(exp).hasMatch(zipCode);
}
