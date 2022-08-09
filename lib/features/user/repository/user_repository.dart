import 'package:architecture_flutter/core/app_error.dart';
import 'package:architecture_flutter/features/user/data/data_source/user_data_source.dart';
import 'package:architecture_flutter/features/user/data/models/user_request_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class UserRepository {
  Future<Either<AppError, UserRequsetModel>> getUser(String endpoint);
}

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(this.userDataSource);
  UserDataSource userDataSource;
  @override
  Future<Either<AppError, UserRequsetModel>> getUser(String endpoint) async {
    try {
      final result = await userDataSource.getUser(endpoint);
      return Right(result);
    } on DioError catch (e) {
      return Left(
        AppError(
          message: e.message,
        ),
      );
    }
  }
}

final userRepoProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.watch(userDataSourceProvider));
});
