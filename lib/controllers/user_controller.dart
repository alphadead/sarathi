import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sarathi/ui/auth/email_verify.dart';

import '../models/user.dart';
import '../ui/utils/routes.dart';
import '../utils/backend.dart';

class UserController extends GetxController {
  RxString email = ''.obs;
  Rx<User> user = User().obs;
  RxBool isLoggedin = false.obs;
  RxBool isVerified = false.obs;
  RxBool isAstroComplete = false.obs;
  RxBool isAstroVerified = false.obs;
  RxBool isAstroPaid = false.obs;
  RxString token = ''.obs;
  fetchUserDetails() async {
    try {
      print(token.value);
      print(FETCH_PROFILE_DETAILS);
      var res = await Dio().getUri(Uri.parse(FETCH_PROFILE_DETAILS), data: {
        "authorization": token.value,
      });
      print(res.data);
      if (res.statusCode == 200) {
        user.value = User.fromJson(res.data);
        isLoggedin.value = true;
        isVerified.value = true;
      } else {
        print("Some error occured");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  
  void reset() {
    email.value = '';
    user.value = User();
    isLoggedin.value = false;
    isVerified.value = false;
    isAstroComplete.value = false;
    isAstroVerified.value = false;
    isAstroPaid.value = false;
    token.value = '';
  }
}
