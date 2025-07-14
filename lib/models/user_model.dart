// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  int? id;
  String email;
  String password;
  String username;

  UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'username': username,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      password: map['password'],
      username: map['username'],
      id: map['id'],
    );
  }
}
