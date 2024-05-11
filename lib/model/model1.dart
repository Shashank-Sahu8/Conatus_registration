class User {
  final String teamname;
  final List<String> name;
  final List<String> email;
  final List<int> contactNumber;
  final List<String> gender;
  final List<String> studentId;
  final List<String> residency;
  final List<int> currentYear;
  final List<String> branch;
  String token;


  User({
    required this.teamname,
    required this.name,
    required this.email,
    required this.contactNumber,
    required this.gender,
    required this.studentId,
    required this.residency,
    required this.currentYear,
    required this.branch,
    required this.token
  });

  Map<String, dynamic> toJson() {
    return {
      'teamname':teamname,
      'name': name,
      'email': email,
      'contactNumber': contactNumber,
      'gender': gender,
      'studentId': studentId,
      'residence': residency,
      'currentYear': currentYear,
      'branch':branch,
      'token':token
    };
  }
}