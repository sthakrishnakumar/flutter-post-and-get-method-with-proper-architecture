import 'package:architecture_flutter/features/user/data/models/create_user_model.dart';
import 'package:architecture_flutter/features/user/data/models/user_response.dart';
import 'package:architecture_flutter/features/user/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateUserNotifier extends StateNotifier<AsyncValue<UserResponseModel>> {
  CreateUserNotifier(this.userRepository) : super(const AsyncValue.loading());

  UserRepository userRepository;
  postUser(CreateUserModel createUserModel) async {
    final result = await userRepository.postUser(createUserModel);

    return result.fold(
      (l) => state = AsyncValue.error(l),
      (r) => state = AsyncValue.data(r),
    );
  }
}

final createUserNotifierProvider =
    StateNotifierProvider<CreateUserNotifier, AsyncValue<UserResponseModel>>(
        (ref) {
  return CreateUserNotifier(ref.watch(userRepoProvider));
});
