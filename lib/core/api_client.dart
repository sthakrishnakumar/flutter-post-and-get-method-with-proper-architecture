import 'package:architecture_flutter/core/api_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiClient {
  Future request(String endpoint,
      {String type = 'get', Map<String, dynamic> postData = const {}}) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: ApiConstant.baseUrl,
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      final response = type == 'get'
          ? await dio.get(endpoint)
          : await dio.post(
              endpoint,
              data: postData,
            );
      return response.data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});
