class User {
  String id;
  final String name;
  final int age;
  final String address;

  User(
      {this.id = '',
      required this.name,
      required this.age,
      required this.address});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'address': address,
      };

  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      address: json['address']);
}
