import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sarathi/controllers/storage_controller.dart';
import 'package:sarathi/controllers/user_controller.dart';
import 'package:sarathi/ui/auth/login.dart';
import 'package:sarathi/ui/auth/otp.dart';
import 'package:sarathi/ui/auth/otp_email.dart';
import 'package:sarathi/ui/utils/routes.dart';
import 'package:sarathi/utils/backend.dart';

class AuthController extends GetxController {
  RxBool isLoggedin = false.obs;
  RxString emailAuth = ''.obs;
  StorageController storageController = StorageController();
  // final UserController _userController = Get.find<UserController>();

  updateProfile(Map<String, dynamic> data) async {
    print(data);
    try {
      var res = await Dio().postUri(Uri.parse(ADD_EXTRA_DETAILS), data: data);
      if (res.statusCode == 200) {
        if (res.data['message'] == 'Not Verified or User not registered') {
          print("User not verified");
          Get.snackbar("User not verified", "Redirecting to home page");
          Get.offAllNamed(Routes.ONBOARDING);
        } else {
          print("Extra details added");
          isLoggedin.value = true;
          storageController.addVerified();
          // _userController.email.value = emailAuth.value;
          // _userController.fetchUserDetails();
          Get.offAllNamed(Routes.HOME);
        }
      } else {
        print("Some error occured");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  login(String email, String password) async {
    print(password);
    try {
      print(LOGIN_URL);
      var res = await Dio().post(LOGIN_URL, data: {
        "email": email,
        "password": password,
      });
      if (res.statusCode == 200) {
        if (res.data['message'] == 'Login Successful') {
          await storageController.addEmailPass(email, password);
          isLoggedin.value = true;
          if (res.data["profile_status"]) {
            print("Login Successful. Redirecting to home page");
            await storageController.addVerified();
            // _userController.email.value = emailAuth.value;
            // await _userController.fetchUserDetails();
            Get.offAllNamed(Routes.HOME);
          } else {
            emailAuth.value = email;
            print("Login Successful. Add additional page");
            Get.offAllNamed(Routes.PROFILE);
          }
        } else if ((res.data['error'] == 'Wrong password')) {
          // print("SOme error occured");
          Get.snackbar("Wrong Password", "Please try again");
        }
      } else {
        print(res.statusCode);
        print("Wrong password");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  register(String email, String password) async {
    print(password);
    try {
      var res = await Dio().postUri(Uri.parse(REGISTER_URL), data: {
        "email": email,
        "password": password,
      });
      print(res);
      print(res.data);
      if (res.statusCode == 200) {
        if (res.data['message'] == 'email or password already available') {
          print("Email already registered");
          Get.snackbar("Email already registed", "Redirecting to home page");

          //TODO: show snackbar of already registered and go to login page
          Get.offAllNamed(Routes.LOGIN);
        } else if (res.data['message'] == 'Verification Otp Sent') {
          {
            print("OTP sent");
            emailAuth.value = email;
            Get.snackbar("OTP Sent Successfully", "");
            Get.offAllNamed(Routes.OTPEMAIL, parameters: {"email": email});
            // Get.to(OtpScreenEmail(
            //   email: email,
            // ));
            // TODO: show snackbar of OTP sent and go to OTP page
          }
        } else {
          print("SOme error occured");
        }
      } else {
        print(res.statusCode);
        print("Wrong password");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void verifyOTP(String email, String otp) async {
    var res = await Dio().post(VERIFY_OTP_URL, data: {
      "email": email,
      "otp": otp,
    });
    print(res.data);
    if (res != null) {
      if (res.data['status'] == 'Verified') {
        print("USer verified");
        Get.offAllNamed(Routes.LOGIN);
        //TODO: show snackbar of user verified and go to login page
      } else if (res.data['status'] == 'Failed') {
        {
          print("otp verification Failed");
          // print("OTP sent");
          // TODO: show snackbar of failed
        }
      } else {
        print("SOme error occured");
      }
    }
  }
}
