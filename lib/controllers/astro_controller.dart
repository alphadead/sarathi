import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sarathi/models/astro.dart';
import '../ui/utils/routes.dart';
import '../utils/backend.dart';
import 'user_controller.dart';

class AstroController extends GetxController {
  Rx<AstroDetails> astroDetails = AstroDetails().obs;
  final UserController _userController = Get.find<UserController>();


  fetchAstroDetails() async {
    try {
      var res = await Dio().getUri(Uri.parse(FETCH_ASTRO_DETAILS), data: {
        "authorization": _userController.token.value,
      });
      if (res.statusCode == 200) {
        astroDetails.value = AstroDetails.fromJson(res.data);
        
      } else {
        print("Some error occured");
      }
    } catch (e) {
      print(e.toString());
    }
  }
  postAstroDetails(String name,String dob,String pob,String tob) async {
    Map<String,dynamic> data = {
      "name" : name,
      "tob" : tob,
      "pob" : pob,
      "dob" : dob,
      "authorization" : _userController.token.value,
    };
    try {
      var res = await Dio().postUri(Uri.parse(POST_ASTRO_DETAILS), data: data);
      if (res.statusCode == 200) {
        if (res.data['message'] == 'Details not added') {
          print("Details not added");
          Get.snackbar("Details not added", "Redirecting to home page");
          Get.offAllNamed(Routes.HOME);
        } else {
          print("Astro Details added");
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
