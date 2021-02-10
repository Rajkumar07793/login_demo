class AppConstants{
  static final passwordPattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{5,}$';
  static final emailPattern = "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]";
  static final phoneRegx = "([0-9]{10})";

  bool validatePhone(String value){
    RegExp regxPassword = new RegExp(phoneRegx);
    return regxPassword.hasMatch(value);
  }

  bool validatePassword(String value){
    RegExp regxPassword = new RegExp(passwordPattern);
    return regxPassword.hasMatch(value);
  }

  bool validateEmail(String value){
    RegExp regxPassword = new RegExp(emailPattern);
    return regxPassword.hasMatch(value);
  }
}

