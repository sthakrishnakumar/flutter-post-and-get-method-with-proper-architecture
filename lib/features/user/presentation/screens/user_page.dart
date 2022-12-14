import 'package:architecture_flutter/features/user/presentation/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPage extends ConsumerWidget {
  const UserPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(userControllerProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('title'),
        ),
        body: Column(
          children: [
            const Text('Hello'),
            data.when(
                data: (d) {
                  return Column(
                    children: [
                      Text(d.email),
                      Text(d.firstName),
                    ],
                  );
                },
                error: (err, s) => const Text(''),
                loading: () => const Text(''))
          ],
        )

        // data.when(
        //   data: (d) {

        //     return Column(
        //       children: [
        //         Text(d.email),
        //         Text(d.firstName),
        //       ],
        //     );
        //   },
        //   error: (err, s) => Text(err.toString()),
        //   loading: () => const Center(
        //     child: CircularProgressIndicator(),
        //   ),
        // ),
        );
  }
}
