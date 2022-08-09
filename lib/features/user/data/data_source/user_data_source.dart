import 'package:architecture_flutter/core/api_client.dart';
import 'package:architecture_flutter/features/user/data/models/user_request_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class UserDataSource {
  Future<UserRequsetModel> getUser(String endpoint);
}

class UserDataSourceImpl extends UserDataSource {
  UserDataSourceImpl(this.apiClient);
  ApiClient apiClient;
  @override
  Future<UserRequsetModel> getUser(String endpoint) async {
    final result = await apiClient.request(endpoint);
    final data = result['data'];
    return UserRequsetModel.fromJson(data);
  }
}

final userDataSourceProvider = Provider<UserDataSource>((ref) {
  return UserDataSourceImpl(ref.watch(apiClientProvider));
});
