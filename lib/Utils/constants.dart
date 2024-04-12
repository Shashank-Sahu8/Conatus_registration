double?h;
double?w;

List<String>branch=['CSE','CSE-AIML','CSE-DS','CS','IT','CSIT','CS-Hindi','ECE','ME','EN','CIVIL'];
List<String>year=["1","2"];
List<String>scholar=['DAYSCHOLAR','HOSTLER'];
List<String>gender=['MALE','FEMALE'];


bool isValidEmail(String email) {

  final RegExp emailRegex =RegExp(r'^[a-zA-Z0-9._-]+@akgec\.ac\.in$');

  return emailRegex.hasMatch(email);
}


bool isValidName(String name) {

  final RegExp nameRegex = RegExp(r'^[a-zA-Z ]+$');

  return nameRegex.hasMatch(name);
}


bool isValidPhoneNumber(String phoneNumber) {

  final RegExp phoneRegex = RegExp(
    r'^[6789]\d{9}$',
  );

  return phoneRegex.hasMatch(phoneNumber);
}


bool isValidStudentNumber(String studentNumber) {

  final RegExp studentNumberRegex = RegExp(r'^(\d{7}|\d{8}|(\d{7}|\d{8})[dD])$');

  return studentNumberRegex.hasMatch(studentNumber);
}