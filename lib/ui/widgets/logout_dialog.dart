import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class LogoutDialog extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Logout'),
      content: const Text('Are you sure you want to logout?'),
      actions: [
        ElevatedButton(
          child: const Text('Cancel'),
          onPressed: () {
            Get.back();
          },
        ),
        ElevatedButton(
          child: const Text('Logout'),
          onPressed: () {
            _authController.logOut();
          },
        ),
      ],
    );
  }
}
