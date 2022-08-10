// ignore_for_file: public_member_api_docs, sort_constructors_first
class CreateUserModel {
  final String name;
  final String job;
  CreateUserModel({
    required this.name,
    required this.job,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "job": job,
    };
  }
}
