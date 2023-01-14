import 'dart:convert';

class UserModel {
  final String name;
  final String email;
  final String gender;
  final int age;
  final String phone;
  final String? education;

  UserModel({
    required this.name,
    required this.email,
    required this.gender,
    required this.age,
    required this.phone,
    this.education,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'gender': gender,
      'age': age,
      'phone': phone,
      'education': education,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      gender: map['gender'] ?? '',
      age: int.parse(map['age']),
      phone: map['phone'] ?? '',
      education: map['education'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, gender: $gender, age: $age, phone: $phone, education: $education)';
  }
}
