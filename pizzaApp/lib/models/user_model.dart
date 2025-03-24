class User {
  final String userId;
  final String password;

  User({required this.userId, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'],
      password: map['password'],
    );
  }
}