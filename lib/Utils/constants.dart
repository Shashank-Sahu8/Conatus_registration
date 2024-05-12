double?h;
double?w;

List<String>branch=['CSE','CSE-AIML','CSE-DS','CS','IT','CSIT','CS-Hindi','ECE','ME','EN','CIVIL'];
List<String>year=["1","2"];
List<String>scholar=['DAYSCHOLAR','HOSTLER'];
List<String>gender=['MALE','FEMALE','OTHER'];


bool isValidEmail(String email) {

  final RegExp emailRegex =RegExp(r'^[a-z]+[0-9.]+@akgec\.ac\.in$');

  return emailRegex.hasMatch(email);
}


bool isValidName(String name) {

  final RegExp nameRegex = RegExp(r'^[a-zA-Z\s]{3,20}$');

  return nameRegex.hasMatch(name);
}

bool isValidTeam(String team) {

  final RegExp nameRegex = RegExp(r'^[a-zA-Z\s]{3,20}$');

  return nameRegex.hasMatch(team);
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

