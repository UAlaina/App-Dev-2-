class User {
  final int? id;
  final String name;
  final String phone;
  final String email;

  const User({
    this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
    };
  }
}