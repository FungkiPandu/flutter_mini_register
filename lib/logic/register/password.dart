class PasswordLogic {
  bool isContainLowerCase(String text) => text.contains(RegExp(r"[a-z]"));

  bool isContainUpperCase(String text) => text.contains(RegExp(r"[A-Z]"));

  bool isContainNumber(String text) => text.contains(RegExp(r"[0-9]"));

  bool isLast8(String text) => text.length >= 8;

  int calculatePasswordPoint(String text) {
    var point = 0;
    if (isContainLowerCase(text)) point++; // very weak
    if (isContainUpperCase(text)) point++; // weak
    if (isContainNumber(text)) point++; // good
    if (isLast8(text)) point++; // strong
    return point;
  }

  bool isValidPassword(String text) {
    return calculatePasswordPoint(text) > 3;
  }
}
