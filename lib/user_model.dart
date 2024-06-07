class UserModel {
  final String email;
  final String firstName;
  final String lastName;
  final String avater;
  final int id;

  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avater,
    required this.id,
  });

  factory UserModel.fromJshon(Map<String, dynamic> json) {
    return UserModel(
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      avater: json["avatar"],
      id: json["id"],
    );
  }
}
