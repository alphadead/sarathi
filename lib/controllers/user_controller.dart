import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sarathi/ui/utils/routes.dart';

import '../models/user.dart';
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

  RxBool isPsyShow = false.obs;
  RxBool isAstroShow = false.obs;
  RxBool isCareerShow = false.obs;
  RxBool isCourseShow = false.obs;
  RxBool isCollegeShow = false.obs;
  RxBool isCounselingShow = false.obs;

  @override
  void onInit() {
    super.onInit();
    showFeatures();
  }

  fetchUserDetails() async {
    try {
      var res = await Dio().getUri(Uri.parse(FETCH_PROFILE_DETAILS), data: {
        "authorization": token.value,
      });
      if (res.statusCode == 200) {
        user.value = User.fromJson(res.data);
        isLoggedin.value = true;
        isVerified.value = true;
        Get.offAllNamed(Routes.HOME);
      } else {
        print("Some error occured");
        reset();
        Get.offAllNamed(Routes.LOGIN);
      }
    } catch (e) {
      print(e.toString());
      reset();
      Get.offAllNamed(Routes.LOGIN);
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

  void showFeatures() async {
    try {
      print(token.value);
      print(FETCH_USER_SHOW);
      var res = await Dio().postUri(Uri.parse(FETCH_USER_SHOW));
      print(res.data);
      if (res.statusCode == 200) {
        isPsyShow.value = res.data['Psychometric'];
        isAstroShow.value = res.data['astro'];
        isCareerShow.value = res.data['Career'];
        isCourseShow.value = res.data['Course'];
        isCollegeShow.value = res.data['College'];
        isCounselingShow.value = res.data['Counseling'];
      } else {
        print("Some error occured");
      }
    } catch (e) {
      print("$e+++++++++++++++++++++++++++++++++++++++++++++");
    } finally {
      update();
    }
  }
}
