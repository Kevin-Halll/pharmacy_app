class User {
  String? id = "";
  String? fullName;
  String? image;
  String? phoneNumber;
  String email;
  String password;
  String? role;

  User({
    this.id,
    this.fullName,
    this.image,
    this.phoneNumber,
    required this.email,
    required this.password,
    this.role,
  });

  User.withoutID({
    this.fullName,
    this.image,
    this.phoneNumber,
    required this.email,
    required this.password,
    this.role,
  });

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      id: json["data"]['_id'],
      fullName: json["data"]['fullName'],
      image: json["data"]['image'],
      phoneNumber: json["data"]['phoneNumber'],
      email: json["data"]['email'],
      password: json["data"]['password'],
      role: json["data"]['role'],
    );
  }
}
