class UserModel {
  final String id;
  final String phoneNumber;
  final String password;

  UserModel({required this.id, required this.phoneNumber, required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
    );
  }
}
