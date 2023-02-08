
class LoginModel {
  final String userName;
  final String password;
  LoginModel({
    required this.userName,
    required this.password,
  });

  Map<String, dynamic> tojson() {
    return {
      'username': userName,
      'password': password,
    };
  }

  factory LoginModel.fromJson(Map<String, dynamic> map) {
    return LoginModel(
      userName: map['username'] ?? '',
      password: map['password'] ?? '',
    );
  }

}
