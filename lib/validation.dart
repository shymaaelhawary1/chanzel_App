class MyValidation {
  String? validateName(String? name) {
    // RegExp regex = RegExp(r'^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$');
    RegExp regex = RegExp(r'^[a-zA-Z-\s]+$');

    // Check if the name matches the regex pattern
    if (regex.hasMatch(name!)) {
      return null;
    } else {
      return "Name is not valid";
    }
  }

  String? validatePhoneNumber(String? phoneNumber) {
    RegExp regex = RegExp(r'^(\+2)?01[0-25][0-9]{8}$');

    if ((regex.hasMatch(phoneNumber!))) {
      return null;
    } else {
      return "Phone number is not valid";
    }
  }

  String? validateEmail(String? email) {
    RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    // Check if the email matches the regex pattern
    if ((email?.endsWith("@gmail.com") ?? false) && (regex.hasMatch(email!))) {
      return null;
    } else {
      return "Email is not valid";
    }
  }

  String? validatePassword(String? password) {
    // Define the regex pattern for password validation
    RegExp regex =
        // RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
        RegExp(r'^(?=.*[A-Z]).{8,}$');

    // Check if the password matches the regex pattern
    if (regex.hasMatch(password!)) {
      return null;
    } else {
      return "Password is not valid must be 8 character at\n least & contain capital letters";
    }
  }
}
