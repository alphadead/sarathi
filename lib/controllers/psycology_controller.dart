import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sarathi/models/psy.dart';
import 'package:sarathi/ui/views/package_screens/psychometric_support/psychometric_questions.dart';

import 'package:sarathi/ui/views/package_screens/psychometric_support/psychometric_support_feedback.dart';
import '../ui/utils/routes.dart';
import '../utils/backend.dart';
import 'user_controller.dart';

class PsyController extends GetxController {
  Rx<PsyDetails> psyDetails = PsyDetails().obs;
  final UserController _userController = Get.find<UserController>();
  RxBool onLoading = false.obs;
  RxBool fillPsyDetails = false.obs;
  RxBool someOtherPackageSubscribe = false.obs;
  RxBool someErrorOccured = false.obs;
  RxBool psyDetailsUpdated = false.obs;

  @override
  onInit() {
    super.onInit();
    fetchPsyDetails();
  }

  @override
  void onClose() {
    onLoading.value = false;
    fillPsyDetails.value = false;
    someOtherPackageSubscribe.value = false;
    someErrorOccured.value = false;
    psyDetailsUpdated.value = false;
    // TODO: implement onClose
    super.onClose();
  }

  fetchPsyDetails() async {
    onLoading.value = true;
    try {
      var res = await Dio().getUri(Uri.parse(FETCH_PSY_DETAILS), data: {
        "authorization": _userController.token.value,
      });
      if (res.statusCode == 200) {
        if (res.data['message'] != null) {
          if (res.data['message'] == "Psycometric details not filled") {
            fillPsyDetails.value = true;
          } else {
            someOtherPackageSubscribe.value = true;
          }
        } else {
          psyDetailsUpdated.value = true;
          psyDetails.value = PsyDetails.fromJson(res.data);
          Get.off(const PsychometricSupportFeedback());
        }
      } else {
        print("Some error occured");
        Get.snackbar("error occured", "");
        someErrorOccured.value = true;
      }
    } catch (e) {
      Get.snackbar("Some error occured", e.toString());
      print(e.toString());
      someErrorOccured.value = true;
    } finally {
      onLoading.value = false;
      update();
    }
  }

  postPsyDetails(String name, String age, List<String> interests) async {
    Map<String, dynamic> data = {
      "name": name,
      "age": age,
      "hobbies": interests,
      "authorization": _userController.token.value,
    };
    try {
      var res = await Dio().postUri(Uri.parse(POST_PSY_DETAILS), data: data);
      if (res.statusCode == 200) {
        if (res.data['message'] == 'Already applied to astro package') {
          print("Already applied to astro package");
          Get.snackbar("Details not added", "Already applied to astro package");
          Get.offAllNamed(Routes.HOME);
        } else {
          print("Psy Details added");
          Get.snackbar("Psy Details added", "");
          psyDetails.value = PsyDetails.fromJson(res.data);
          Get.off(const PsychometricSupportFeedback());
          
        }
      } else {
        print("Some error occured");
        Get.snackbar("Some error occured", "");
        Get.offAllNamed(Routes.HOME);
      }
    } catch (e) {
      Get.snackbar("Some error occured", e.toString());
      print(e.toString());
      Get.offAllNamed(Routes.HOME);
    } finally {
      update();
    }
  }
}
