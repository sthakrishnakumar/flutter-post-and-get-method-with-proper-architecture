import 'package:architecture_flutter/features/user/data/models/user_request_model.dart';
import 'package:architecture_flutter/features/user/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserDataNotifier extends StateNotifier<AsyncValue<UserRequsetModel>> {
  UserDataNotifier(this.userRepository) : super(const AsyncValue.loading());

  UserRepository userRepository;

  getUser() async {
    final result = await userRepository.getUser();

    result.fold(
      (l) => state = AsyncValue.error(l),
      (r) => state = AsyncValue.data(r),
    );
  }
}

final userControllerProvider =
    StateNotifierProvider<UserDataNotifier, AsyncValue<UserRequsetModel>>(
        (ref) {
  return UserDataNotifier(ref.watch(userRepoProvider));
});
