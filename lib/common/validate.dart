validateRFC(String rfc) {
  String exp =
      r'/^([A-ZÑ&]{3,4}) ?(?:- ?)?(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])) ?(?:- ?)?([A-Z\d]{2})([A\d])$/';
  return RegExp(exp).hasMatch(rfc);
}

validateEmail(String email) {
  String exp = r'/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/';
  return RegExp(exp).hasMatch(email);
}

validatePhoneNumber(String phoneNumber) {
  String exp = r'/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/';
  return RegExp(exp).hasMatch(phoneNumber);
}

validateZipCode(String zipCode) {
  String exp = r'^[0-9]{5}(?:-[0-9]{4})?$';
  return RegExp(exp).hasMatch(zipCode);
}
