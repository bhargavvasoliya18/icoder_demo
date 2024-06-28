import 'package:bhargav_practicle/src/Page/TransactionsScreen/transactions_screen.dart';
import 'package:bhargav_practicle/src/Utils/GetxController/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final loginController = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await loginController.signInWithGoogle();
          },
          child: const Text("Login with Google"),
        ),
      ),
    );
  }
}
