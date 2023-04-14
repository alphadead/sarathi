import 'package:dio/dio.dart';
import 'package:get/get.dart';

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
  fetchUserDetails() async {
    try {
      var res = await Dio().getUri(Uri.parse(FETCH_PROFILE_DETAILS), data: {
        "email": email.value,
      });
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

  fetchAstroDetails() async {
    try {
      var res = await Dio().getUri(Uri.parse(FETCH_ASTRO_DETAILS), data: {
        "email": email.value,
      });
      if (res.statusCode == 200) {
        user.value = User.fromJson(res.data as Map<String,dynamic>);
        isLoggedin.value = true;
        isVerified.value = true;
        isAstroComplete.value = true;
        isAstroVerified.value = true;
        isAstroPaid.value = true;
      } else {
        print("Some error occured");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  postAstroDetails(Map<String, dynamic> data) async {
    try {
      var res = await Dio().postUri(Uri.parse("ADD_ASTRO_DETAILS"), data: data);
      if (res.statusCode == 200) {
        if (res.data['message'] == 'Not Verified or User not registered') {
          print("User not verified");
          Get.snackbar("User not verified", "Redirecting to home page");
          Get.offAllNamed(Routes.ONBOARDING);
        } else {
          print("Extra details added");
          isLoggedin.value = true;
          isVerified.value = true;
          isAstroComplete.value = true;
          isAstroVerified.value = true;
          isAstroPaid.value = true;
          Get.offAllNamed(Routes.HOME);
        }
      } else {
        print("Some error occured");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
