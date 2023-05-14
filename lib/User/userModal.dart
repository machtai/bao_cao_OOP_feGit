class UserModel {
  final String phoneNumber;
  final String email;
  final String first_name;
  final String last_name;
  final String photo;
  final String createdAt;

  UserModel({
    required this.phoneNumber,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.photo,
    required this.createdAt,
  });
  
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] 
              , 
          first_name: json['first_name'] ,
          last_name: json['last_name'] ,
          photo: json['photo'] ,
          createdAt: json['createdAt'] , phoneNumber: json['phoneNumber'],
    );
  }
}
