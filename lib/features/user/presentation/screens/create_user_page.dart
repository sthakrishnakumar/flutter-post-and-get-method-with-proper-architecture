import 'package:architecture_flutter/features/user/data/models/create_user_model.dart';
import 'package:architecture_flutter/features/user/presentation/controller/create_user_controller.dart';
import 'package:architecture_flutter/features/user/presentation/screens/user_created_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({Key? key}) : super(key: key);

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  late TextEditingController nameController;
  late TextEditingController jobController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void initState() {
    nameController = TextEditingController();
    jobController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController;
    jobController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (name) {
                return nameController.text.isNotEmpty
                    ? null
                    : "Please Enter name";
              },
              controller: nameController,
              decoration: const InputDecoration(hintText: 'name'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (name) {
                return jobController.text.isNotEmpty
                    ? null
                    : "Please Enter Job";
              },
              controller: jobController,
              decoration: const InputDecoration(hintText: 'job'),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer(builder: (context, ref, child) {
              final postUser = ref.watch(createUserNotifierProvider.notifier);
              return isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          CreateUserModel createUserModel = CreateUserModel(
                              name: nameController.text,
                              job: jobController.text);

                          await postUser.postUser(createUserModel);
                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              content: Text(
                                  "Hello! ${nameController.text} , you are ${jobController.text}"),
                            ),
                          );
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserCreatedPage(),
                            ),
                          );
                        }
                      },
                      child: const Text('Create User'),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
