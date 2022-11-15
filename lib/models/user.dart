class User {
  String? id = "";
  String? fullName;
  String? phoneNumber;
  String email;
  String password;
  String? role;

  User({
    this.id,
    this.fullName,
    this.phoneNumber,
    required this.email,
    required this.password,
    this.role,
  });

  User.withoutID({
    this.fullName,
    this.phoneNumber,
    required this.email,
    required this.password,
    this.role,
  });

  factory User.fromResponseJSON(Map<String, dynamic> json) {
    return User(
      id: json["data"]['_id'],
      fullName: json["data"]['fullName'],
      phoneNumber: json["data"]['phoneNumber'],
      email: json["data"]['email'],
      password: json["data"]['password'],
      role: json["data"]['role'],
    );
  }

  factory User.fromJSON(dynamic json) {
    return User(
      id: json['_id'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
    );
  }
}
