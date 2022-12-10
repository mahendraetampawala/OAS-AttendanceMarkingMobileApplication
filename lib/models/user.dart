class User {
  int? id;
  int? typeId;
  String? type;
  String? employeeNumber;
  String? fullName;
  String? shortName;
  int? gender;
  String? dob;
  String? email;
  String? mobile;
  String? address;
  String? religion;
  String? nationality;
  String? nativeLanguage;
  String? token;

  User();

  User.all({
    required this.id,
    required this.typeId,
    required this.type,
    required this.employeeNumber,
    required this.fullName,
    required this.shortName,
    required this.gender,
    required this.dob,
    required this.email,
    required this.mobile,
    required this.address,
    required this.religion,
    required this.nationality,
    required this.nativeLanguage,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => new User.all(
        id: json['id'],
        typeId: json['type'],
        type: "Employee",
        employeeNumber: json['employeeNumber'],
        fullName: json['fullName'],
        shortName: json['shortName'],
        gender: json['gender'],
        dob: json['dob'],
        email: json['email'],
        mobile: json['mobile'],
        address: json['address'],
        religion: json['religion'],
        nationality: json['nationality'],
        nativeLanguage: json['nativeLanguage'],
        token: json['token'],
      );

  String get genderForDisplay {
    return this.gender == 0 ? "Male" : "Female";
  }
}
