import 'package:architecture_flutter/features/user/presentation/controller/create_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserCreatedPage extends ConsumerWidget {
  const UserCreatedPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    final response = ref.watch(createUserNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Craeted Page'),
      ),
      body: response.when(
          data: (d) {
            return Column(
              children: [
                Text(d.name),
                Text(d.id),
              ],
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const CircularProgressIndicator()),
    );
  }
}
