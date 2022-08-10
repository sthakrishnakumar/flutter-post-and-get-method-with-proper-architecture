// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserResponseModel {
  final String name;
  final String id;
  UserResponseModel({
    required this.name,
    required this.id,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      name: json['name'],
      id: json['id'],
    );
  }
}
