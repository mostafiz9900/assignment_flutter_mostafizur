import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              'AuthView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
