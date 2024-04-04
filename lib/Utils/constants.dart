double?h;
double?w;

List<String>branch=['CSE','CSE-AIML','CSE-DS','CS','IT','CS','CS-Hindi','ECE','ML','EN','CIVIL'];
List<String>year=['First Year','Second Year'];
List<String>scholar=['Days Scholar','Hosteller'];


bool isValidEmail(String email) {
  // Regular expression pattern for validating an email address
  final RegExp emailRegex =RegExp(r'^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$');

  return emailRegex.hasMatch(email);
}


bool isValidName(String name) {
  // Regular expression pattern for validating a name
  final RegExp nameRegex = RegExp(r'^[a-zA-Z]+(?: [a-zA-Z]+)*$');

  return nameRegex.hasMatch(name);
}


bool isValidPhoneNumber(String phoneNumber) {
  // Regular expression pattern for validating a phone number
  final RegExp phoneRegex = RegExp(
    r'^\+?[0-9]{1,3}[-. ]?\(?[0-9]{1,3}\)?[-. ]?[0-9]{1,3}[-. ]?[0-9]{4,}$',
  );

  return phoneRegex.hasMatch(phoneNumber);
}


bool isValidStudentNumber(String studentNumber) {
  // Regular expression pattern for validating a 7-digit numeric student number
  final RegExp studentNumberRegex = RegExp(r'^\d{7}(d)?$');

  return studentNumberRegex.hasMatch(studentNumber);
}