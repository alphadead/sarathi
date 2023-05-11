import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sarathi/controllers/storage_controller.dart';
import 'package:sarathi/controllers/user_controller.dart';
import 'package:sarathi/ui/utils/routes.dart';
import 'package:sarathi/utils/backend.dart';

import '../ui/auth/email_verify.dart';

class AuthController extends GetxController {
  RxBool isLoggedin = false.obs;
  RxString emailAuth = ''.obs;
  StorageController storageController = StorageController();
  final UserController _userController = Get.find<UserController>();

  addProfile(Map<String, dynamic> data) async {
    data["authorization"] = _userController.token.value;

    try {
      var res = await Dio().postUri(Uri.parse(ADD_PROFILE_DETAILS), data: data);
      if (res.statusCode == 200) {
        if (res.data['message'] == 'Not Verified or User not registered') {
          Get.snackbar("User not verified", "Redirecting to home page");
          Get.offAllNamed(Routes.ONBOARDING);
        } else {
          isLoggedin.value = true;
          storageController.addVerified();
          _userController.email.value = emailAuth.value;
          _userController.fetchUserDetails();
          Get.offAllNamed(Routes.HOME);
        }
      } else {
                  Get.snackbar("Some error occured","");

      }
    } catch (e) {
                  Get.snackbar("Some error occured",e.toString());

    }
  }

  updateUserProfile(Map<String, dynamic> data) async {
    data["authorization"] = _userController.token.value;
    try {
      var res = await Dio().postUri(Uri.parse(ADD_PROFILE_DETAILS), data: data);
      if (res.statusCode == 200) {
        if (res.data['message'] == 'User details not filled') {
          Get.snackbar("User details not filled", "Redirecting to login page");
          logOut();
          Get.offAllNamed(Routes.LOGIN);
        } else {
          Get.snackbar("User Details Updated", "Redirecting to home page");
          Get.offAllNamed(Routes.HOME);
        }
      } else {
                  Get.snackbar("Some error occured","");
      }
    } catch (e) {
                  Get.snackbar("Some error occured",e.toString());

    }
  }

  login(String email, String password) async {
    try {
      var res = await Dio().post(LOGIN_URL, data: {
        "email": email,
        "password": password,
      });
      if (res.statusCode == 200) {
        if (res.data['message'] == 'Login Successful') {
          await storageController.addUnverified();
          _userController.token.value = res.data["tokens"];
          await storageController.addToken(res.data['tokens']);
          isLoggedin.value = true;
          if (res.data["profile_status"]) {
            await storageController.addVerified();

            _userController.email.value = emailAuth.value;
            await _userController.fetchUserDetails();
            Get.offAllNamed(Routes.HOME);
          } else {
            emailAuth.value = email;
            Get.offAllNamed(Routes.PROFILE);
          }
        } else if ((res.data['error'] == 'Wrong password')) {
          // print("SOme error occured");
          Get.snackbar("Wrong Password", "Please try again");
        }
      } else {
                  Get.snackbar("Some error occured","");

      }
    } catch (e) {
                  Get.snackbar("Some error occured",e.toString());

    }
  }

  updatePassword(String email, String password) async {
    try {
      var res = await Dio().post(UPDATE_PASSWORD, data: {
        "email": email,
        "password": password,
      });
      if (res.statusCode == 200) {
        if (res.data['message'] == 'password updated') {
          Get.snackbar("Password updated", "Redirecting to login page");
          Get.offAllNamed(Routes.LOGIN);
        } else if ((res.data['message'] == 'email not registered')) {
          // print("SOme error occured");
          Get.snackbar("email not registered", "email not registered");
          Get.offAllNamed(Routes.REGISTER);
        } else {
          Get.snackbar("Some error occured", "Please try again");
          Get.offAllNamed(Routes.LOGIN);
        }
      } else {
        Get.snackbar("Some error occured", "Please try again");
      }
    } catch (e) {
      Get.snackbar("Some error occured", "Please try again");
    }
  }

  register(String email, String password) async {
    try {
      var res = await Dio().postUri(Uri.parse(REGISTER_URL), data: {
        "email": email,
        "password": password,
      });
      if (res.statusCode == 200) {
        if (res.data['message'] == 'email or password already available') {
          Get.snackbar("Email already registed", "Redirecting to home page");
          Get.offAllNamed(Routes.LOGIN);
        } else if (res.data['message'] == 'Verification Otp Sent') {
          {
            emailAuth.value = email;
            Get.snackbar("OTP Sent Successfully", "");
            Get.offAllNamed(Routes.OTPEMAIL, parameters: {"email": email});
          }
        } else {
          Get.snackbar("Some error occured","");
        }
      } else {
                  Get.snackbar("Some error occured","");
      }
    } catch (e) {
                Get.snackbar("Some error occured","");
    }
  }

  void logOut() {
    storageController.deleteDetails();
    _userController.reset();
    isLoggedin.value = false;
    emailAuth.value = '';
  }

  void verifyOTP(String email, String otp,
      {bool forgotPassword = false}) async {
    var res = await Dio().post(VERIFY_OTP_URL, data: {
      "email": email,
      "otp": otp,
    });
    if (res.data['status'] == 'Verified') {
      if (forgotPassword) {
        Get.snackbar("OTP Verified", "Redirecting to reset password page");
        Get.offAllNamed(Routes.RESET_PASSWORD, parameters: {"email": email});
        return;
      }
      storageController.addVerified();
      _userController.token.value = res.data['tokens'];
      await storageController.addToken(res.data['tokens']);
      Get.snackbar("OTP Verified", "Redirecting to add details page");
      Get.offAllNamed(Routes.PROFILE);
    } else if (res.data['status'] == 'Failed') {
      {
        Get.snackbar('Otp Verification Failed', res.data['message']);
      }
    } else {
                Get.snackbar("Some error occured","");
    }
  }

  forgotPassword(String email) async {
    try {
      var res = await Dio().post(FORGOT_PASSWORD, data: {
        "email": email,
      });
      if (res.statusCode == 200) {
        if (res.data['message'] == 'Verification Otp Sent') {
          Get.snackbar("Verification Otp Sent", "Please check your email");
          // Get.offAllNamed(Routes.OTPEMAIL);
          emailAuth.value = email;
          Get.offAll(() => EmailVerify(
                forgotPassword: true,
              ));
        } else if (res.data['message'] == 'User Not Register') {
          Get.snackbar("User Not Register", "Please register first");
          Get.offAllNamed(Routes.REGISTER);
        } else {
                  Get.snackbar("Some error occured","");
        }
      } else {
                  Get.snackbar("Some error occured","");
      }
    } catch (e) {
                  Get.snackbar("Some error occured","");
    }
  }
}
