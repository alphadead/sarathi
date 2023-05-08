import 'package:get/get.dart';
import 'package:sarathi/controllers/auth_controller.dart';
import 'package:sarathi/controllers/storage_controller.dart';
import 'package:flutter/material.dart';
import 'package:sarathi/ui/auth/user_info.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../controllers/user_controller.dart';
import '../utils/routes.dart';


import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController _authController = Get.find<AuthController>();
  final StorageController _storageController = StorageController();
  StreamSubscription? internetconnection;
  final AuthController authController = Get.put(AuthController());
  @override
  void initState() {
    // authController.onInit();
    internetconnection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        _authController.isoffline.value = true;
      } else if (result == ConnectivityResult.mobile) {
        _authController.isoffline.value = false;
      } else if (result == ConnectivityResult.wifi) {
        _authController.isoffline.value = false;
      }
    });
      super.initState();
    _changeScreen();
  }

  @override
  dispose() {
    super.dispose();
    internetconnection!.cancel();
  }

  _changeScreen() async {
    // await Future.delayed(const Duration(milliseconds: 1500), () {
    //   Navigator.pushReplacement(context,
    //       MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
    // });
    await Future.delayed(const Duration(milliseconds: 1500), () async {

      if(_authController.isoffline.value){
        Get.offAllNamed(Routes.NO_INTERNET);
      }
    // Get.offAll(UserInfoPage());
    else{
      var data = await _storageController.getDetails();
      if (data['token'] != null && data['verified'] != null && data['token'].toString().isNotEmpty) {
        if (data['verified'] == 'true') {
          Get.find<UserController>().token.value = data['token']!;
          Get.find<UserController>().fetchUserDetails();
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.offAllNamed(Routes.ONBOARDING);
        }
        // await Get.find<AuthController>().login(data['email']!, data['pass']!);
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    }
    });
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