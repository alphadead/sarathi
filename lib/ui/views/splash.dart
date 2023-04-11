import 'package:get/get.dart';
import 'package:sarathi/controllers/auth_controller.dart';
import 'package:sarathi/controllers/storage_controller.dart';
import 'package:sarathi/controllers/user_controller.dart';
import 'package:sarathi/ui/views/onboarding_screen.dart';
import 'package:flutter/material.dart';

import '../utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController _authController = Get.find<AuthController>();
  final StorageController _storageController = StorageController();
  @override
  void initState() {
    super.initState();
    _changeScreen();
  }

  _changeScreen() async {
    // await Future.delayed(const Duration(milliseconds: 1500), () {
    //   Navigator.pushReplacement(context,
    //       MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
    // });

    // await Future.delayed(const Duration(milliseconds: 1500), () async {
      var data = await _storageController.getDetails();
      if (data['email'] != null && data['pass']!=null) {
        await Get.find<AuthController>().login(data['email']!,data['pass']!);
        // if (data['verified'] == 'true') {
        //   Get.find<UserController>().email.value = data['email']!;
        //   Get.offAllNamed(Routes.HOME);
        // } else {
        //   Get.offAllNamed(Routes.ONBOARDING);
        // }
      } else {
        Get.offAllNamed(Routes.ONBOARDING);
      }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/splashScreen.png',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}


// Things to do:(BACKEND)
// 1. What if user has created an account but has never provided extra details? What will happen next time they login?
// 2. User once verified can change the password only after authenticating with otp sent on the email.
// 3. Check if user has filled the astrology details. If yes give appropriate response. else ask them to fill the details.


// FRONTEND:
// 1. Seperate the login and signup screens using both email and password.
// 2. Change the coolour of app is in figma.
// 3. ADd the extra pages as in figma.