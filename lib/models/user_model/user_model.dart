class UserModel {
  UserModel({
    required this.fullName,
    required this.role,
    this.email,
    this.phone,
    this.gender,
    this.id,
    this.birthDay,
  });

  String fullName;
  String role;
  String? email;
  DateTime? birthDay;
  String? phone;
  String? gender;
  String? id;

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'role': role,
        'email': email,
        'birthDay': birthDay,
        'phone': phone,
        'gender': gender,
        'id': id,
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        fullName: json["fullName"],
        role: json["role"],
        email: json["email"],
        birthDay: json["birthDay"],
        phone: json["phone"],
        gender: json["gender"],
        id: json["id"],
      );
}
