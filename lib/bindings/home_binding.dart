import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarathi/controllers/auth_controller.dart';
import 'package:sarathi/controllers/user_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
