class User {
  final String name;
  final String email;
  final int contactNumber;
  final String gender;
  final String studentId;
  final String residency;
  final String branch;
  final int currentYear;
  final String token;

  User({
    required this.name,
    required this.email,
    required this.contactNumber,
    required this.gender,
    required this.studentId,
    required this.residency,
    required this.branch,
    required this.currentYear,
    required this.token
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'contactNumber': contactNumber,
      'gender': gender,
      'studentId': studentId,
      'residence': residency,
      'branch':branch,
      'currentYear': currentYear,
      'token':token
    };
  }
}