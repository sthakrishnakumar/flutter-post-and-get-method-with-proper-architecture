import 'package:architecture_flutter/core/api_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiClient {
  Future request(String endpoint) async {
    try {
      final response = await Dio(
        BaseOptions(baseUrl: ApiConstant.baseUrl),
      ).get(endpoint);
      return response.data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});
