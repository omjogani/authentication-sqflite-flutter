class User {
  final String email;
  final String password;

  User({
    required this.email,
    required this.password,
  });

  User.fromMap(Map<dynamic, dynamic> res)
  : email = res['email'],
  password = res['password'];

  Map<String, Object?> toMap(){
    return {
      'email' : email,
      'password' : password,
    };
  }
}
