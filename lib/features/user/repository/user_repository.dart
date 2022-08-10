import 'package:architecture_flutter/core/app_error.dart';
import 'package:architecture_flutter/features/user/data/data_source/user_data_source.dart';
import 'package:architecture_flutter/features/user/data/models/create_user_model.dart';
import 'package:architecture_flutter/features/user/data/models/user_request_model.dart';
import 'package:architecture_flutter/features/user/data/models/user_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class UserRepository {
  Future<Either<AppError, UserRequsetModel>> getUser();
  Future<Either<AppError, UserResponseModel>> postUser(
      CreateUserModel createUserModel);
}

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.userDataSource);
  UserDataSource userDataSource;
  @override
  Future<Either<AppError, UserRequsetModel>> getUser() async {
    try {
      final result = await userDataSource.getUser();

      return Right(result);
    } on DioError catch (e) {
      return Left(
        AppError(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<AppError, UserResponseModel>> postUser(
      CreateUserModel createUserModel) async {
    try {
      final result = await userDataSource.postUser(createUserModel);
      return Right(result);
    } on DioError catch (e) {
      return Left(AppError(message: e.message));
    }
  }
}

final userRepoProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.watch(userDataSourceProvider));
});
