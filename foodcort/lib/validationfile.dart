bool isValidEmail(String email) {
  // Regular expression pattern for email validation
  final RegExp emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$',
  );

  return emailRegex.hasMatch(email);
}
bool isValidPassword(String password) {
  // Regular expression pattern for password validation
  final RegExp passwordRegex =RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$');

  return passwordRegex.hasMatch(password);
}

bool isValidUserName(String name){
  final RegExp userNameRegx=RegExp('[a-zA-Z]');
  return userNameRegx.hasMatch(name);
}
