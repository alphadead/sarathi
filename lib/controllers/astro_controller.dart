import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sarathi/models/astro.dart';
import 'package:sarathi/ui/views/package_screens/astro_support/astro_support_feedback.dart';
import '../ui/utils/routes.dart';
import '../utils/backend.dart';
import 'user_controller.dart';

class AstroController extends GetxController {
  Rx<AstroDetails> astroDetails = AstroDetails().obs;
  final UserController _userController = Get.find<UserController>();
  RxBool onLoading = false.obs;
  RxBool fillAstroDetails = false.obs;
  RxBool someOtherPackageSubscribe = false.obs;
  RxBool someErrorOccured = false.obs;
  RxBool astroDetailsUpdated = false.obs;

  @override
  void onClose() {
    onLoading.value = false;
    fillAstroDetails.value = false;
    someOtherPackageSubscribe.value = false;
    someErrorOccured.value = false;
    astroDetailsUpdated.value = false;
    // TODO: implement onClose
    super.onClose();
  }

  @override
  onInit() {
    super.onInit();
    fetchAstroDetails();
  }

  fetchAstroDetails() async {
    onLoading.value = true;
    print("fetchinggggg astro details: " + FETCH_ASTRO_DETAILS);
    try {
      var res = await Dio().getUri(Uri.parse(FETCH_ASTRO_DETAILS), data: {
        "authorization": _userController.token.value,
      });
      print(res.data);
      if (res.statusCode == 200) {
        if (res.data['message'] != null) {
          if (res.data['message'] == "Astro details not filled") {
            fillAstroDetails.value = true;
          } else {
            someOtherPackageSubscribe.value = true;
          }
        } else {
          astroDetailsUpdated.value = true;
          astroDetails.value = AstroDetails.fromJson(res.data);
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
      print(fillAstroDetails.value);
      print(someOtherPackageSubscribe.value);
      print(someErrorOccured.value);
      print(astroDetailsUpdated.value);
      update();
    }
  }

  postAstroDetails(String name, String dob, String pob, String tob) async {
    Map<String, dynamic> data = {
      "name": name,
      "tob": tob,
      "pob": pob,
      "dob": dob,
      "authorization": _userController.token.value,
    };
    print("postinggggg astro detailssss: " + POST_ASTRO_DETAILS);
    try {
      var res = await Dio().postUri(Uri.parse(POST_ASTRO_DETAILS), data: data);
      print(res.data);
      if (res.statusCode == 200) {
        if (res.data['message'] == 'Already applied to psycometric pack') {
          print("Already subscribed to psycometric pack");
          Get.snackbar(
              "Details not added", "Already applied to psycometric pack");
          Get.offAllNamed(Routes.HOME);
        } else {
          print("Astro Details added");
          Get.snackbar("Astro Details added", "");
          astroDetails.value = AstroDetails.fromJson(res.data);
          Get.off(const AstroSupportFeedback());
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
