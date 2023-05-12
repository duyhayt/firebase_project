class UserModel {
  UserModel({
    required this.fullName,
    required this.role,
    required this.email,
    this.phone,
    this.gender,
    this.id,
    this.birthDay,
  });

  String fullName;
  String role;
  DateTime? birthDay;
  String email;
  String? phone;
  String? gender;
  String? id;
}
