class EmailLogic {
  bool isValidEmail(String email) {
    var emailRegex =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]{0,253}[a-zA-Z0-9]\.(?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])(\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
    return RegExp(emailRegex).hasMatch(email);
  }

  String? emailValidator(String? email) {
    if (email == null) return null;
    if (email == "") return "This field is required";
    if (!isValidEmail(email)) {
      return "Invalid email format";
    }
  }
}
