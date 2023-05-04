import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../models/psy.dart';
import '../ui/utils/routes.dart';
import '../utils/backend.dart';
import 'user_controller.dart';

class PsycologyController extends GetxController {
  Rx<PsyDetails> psyDetails = PsyDetails().obs;
  final UserController _userController = Get.find<UserController>();


  fetchPsyDetails() async {
    try {
      var res = await Dio().getUri(Uri.parse(FETCH_PSY_DETAILS), data: {
        "authorization": _userController.token.value,
      });
      if (res.statusCode == 200) {
        psyDetails.value = PsyDetails.fromJson(res.data);
        
      } else {
        print("Some error occured");
      }
    } catch (e) {
      print(e.toString());
    }
  }
  postPsyDetails(String name,String age,List<String> interests) async {
    Map<String,dynamic> data = {
      "name" : name,
      "age" : age,
      "interests" : interests,
      "authorization" : _userController.token.value,
    };
    try {
      var res = await Dio().postUri(Uri.parse(POST_PSY_DETAILS), data: data);
      if (res.statusCode == 200) {
        if (res.data['message'] == 'Details not added') {
          print("Details not added");
          Get.snackbar("Details not added", "Redirecting to home page");
          Get.offAllNamed(Routes.HOME);
        } else {
          print("Psy Details added");
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
