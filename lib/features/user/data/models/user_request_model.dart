class UserRequsetModel {
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserRequsetModel({
    required this.avatar,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  factory UserRequsetModel.fromJson(Map<String, dynamic> json) {
    return UserRequsetModel(
      avatar: json['avatar'] ?? '',
      email: json['email'] ?? "hello bro",
      firstName: json['first_name'] ?? "",
      lastName: json['last_name'] ?? "",
    );
  }
}
