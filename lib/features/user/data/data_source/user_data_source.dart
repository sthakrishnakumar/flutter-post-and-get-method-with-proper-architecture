import 'package:architecture_flutter/core/api_client.dart';
import 'package:architecture_flutter/core/api_constant.dart';
import 'package:architecture_flutter/features/user/data/models/create_user_model.dart';
import 'package:architecture_flutter/features/user/data/models/user_request_model.dart';
import 'package:architecture_flutter/features/user/data/models/user_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class UserDataSource {
  Future<UserRequsetModel> getUser();
  Future<UserResponseModel> postUser(CreateUserModel userModel);
}

class UserDataSourceImpl extends UserDataSource {
  UserDataSourceImpl(this.apiClient);
  ApiClient apiClient;
  @override
  Future<UserRequsetModel> getUser() async {
    final result = await apiClient.request('users/2');
    final data = result['data'];

    return UserRequsetModel.fromJson(data);
  }

  @override
  Future<UserResponseModel> postUser(CreateUserModel userModel) async {
    final result = await apiClient.request(
      ApiConstant.createUser,
      type: 'post',
      postData: userModel.toJson(),
    );
    return UserResponseModel.fromJson(result);
  }
}

final userDataSourceProvider = Provider<UserDataSource>((ref) {
  return UserDataSourceImpl(ref.watch(apiClientProvider));
});
