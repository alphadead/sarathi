import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sarathi/controllers/storage_controller.dart';
import 'package:sarathi/controllers/user_controller.dart';
import 'package:sarathi/ui/utils/routes.dart';
import 'package:sarathi/utils/backend.dart';
import 'dart:developer' as developer;
import '../ui/auth/email_verify.dart';

class AuthController extends GetxController {
  RxBool isoffline = false.obs;
  RxBool isLoggedin = false.obs;
  RxString emailAuth = ''.obs;
  StorageController storageController = StorageController();
  final UserController _userController = Get.find<UserController>();

  addProfile(Map<String, dynamic> data) async {
    data["authorization"] = _userController.token.value;
    developer.log(data.toString());

    try {
      var res = await Dio().postUri(Uri.parse(ADD_PROFILE_DETAILS), data: data);
      if (res.statusCode == 200) {
        if (res.data['message'] == 'Not Verified or User not registered') {
          developer.log("User not verified");
          Get.snackbar("User not verified", "Redirecting to home page");
          Get.offAllNamed(Routes.ONBOARDING);
        } else {
          developer.log("Extra details added");
          isLoggedin.value = true;
          storageController.addVerified();
          _userController.email.value = emailAuth.value;
          _userController.fetchUserDetails();
          Get.offAllNamed(Routes.HOME);
        }
      } else {
        developer.log("Some error occured");
      }
    } catch (e) {
      developer.log(e.toString());
    }
  }

  updateUserProfile(Map<String, dynamic> data) async {
    data["authorization"] = _userController.token.value;
    developer.log(data.toString());
    try {
      var res = await Dio().postUri(Uri.parse(ADD_PROFILE_DETAILS), data: data);
      if (res.statusCode == 200) {
        if (res.data['message'] == 'User details not filled') {
          developer.log("User not verified");
          Get.snackbar("User details not filled", "Redirecting to login page");
          logOut();
          Get.offAllNamed(Routes.LOGIN);
        } else {
          developer.log("User Details Updated");
          Get.snackbar("User Details Updated", "Redirecting to home page");
          Get.offAllNamed(Routes.HOME);
        }
      } else {
        developer.log("Some error occured");
      }
    } catch (e) {
      developer.log(e.toString());
    }
  }

  login(String email, String password) async {
    developer.log(password);
    try {
      developer.log(LOGIN_URL);
      var res = await Dio().post(LOGIN_URL, data: {
        "email": email,
        "password": password,
      });
      developer.log(res.data);
      if (res.statusCode == 200) {
        if (res.data['message'] == 'Login Successful') {
          await storageController.addUnverified();
          _userController.token.value = res.data["tokens"];
          await storageController.addToken(res.data['tokens']);
          isLoggedin.value = true;
          if (res.data["profile_status"]) {
            developer.log("Login Successful. Redirecting to home page");
            await storageController.addVerified();

            _userController.email.value = emailAuth.value;
            await _userController.fetchUserDetails();
            Get.offAllNamed(Routes.HOME);
          } else {
            emailAuth.value = email;
            developer.log("Login Successful. Add additional page");
            Get.offAllNamed(Routes.PROFILE);
          }
        } else if ((res.data['error'] == 'Wrong Credentials')) {
          developer.log("Wrong Credentials");
          Get.snackbar("Wrong Credentials", "Please try again");
        } else {
          developer.log("Some error occured");
          Get.snackbar("Some error occured", "Please try again");
        }
      } else {
        developer.log("Some error occured");
        Get.snackbar("Some error occured", "Please try again");
      }
    } catch (e) {
      developer.log(e.toString());
      Get.snackbar("Some error occured", "Please try again");
    }
  }

  updatePassword(String email, String password) async {
    try {
      developer.log(UPDATE_PASSWORD);
      var res = await Dio().post(UPDATE_PASSWORD, data: {
        "email": email,
        "password": password,
      });
      developer.log(res.data);
      if (res.statusCode == 200) {
        if (res.data['message'] == 'password updated') {
          developer.log("Password updated");
          Get.snackbar("Password updated", "Redirecting to login page");
          Get.offAllNamed(Routes.LOGIN);
        } else if ((res.data['message'] == 'email not registered')) {
          // developer.log("SOme error occured");
          Get.snackbar("email not registered", "email not registered");
          Get.offAllNamed(Routes.REGISTER);
        } else {
          Get.snackbar("Some error occured", "Please try again");
          Get.offAllNamed(Routes.LOGIN);
        }
      } else {
        Get.snackbar("Some error occured", "Please try again");
        developer.log(res.statusCode.toString());
        developer.log("Wrong password");
      }
    } catch (e) {
      Get.snackbar("Some error occured", "Please try again");
      developer.log(e.toString());
    }
  }

  register(String email, String password) async {
    developer.log(password);
    try {
      var res = await Dio().postUri(Uri.parse(REGISTER_URL), data: {
        "email": email,
        "password": password,
      });
      developer.log(res.toString());
      developer.log(res.data);
      if (res.statusCode == 200) {
        if (res.data['message'] == 'email or password already available') {
          developer.log("Email already registered");
          Get.snackbar("Email already registed", "Redirecting to home page");

          //TODO: show snackbar of already registered and go to login page
          Get.offAllNamed(Routes.LOGIN);
        } else if (res.data['message'] == 'Verification Otp Sent') {
          {
            developer.log("OTP sent");
            emailAuth.value = email;
            Get.snackbar("OTP Sent Successfully", "");
            Get.offAllNamed(Routes.OTPEMAIL, parameters: {"email": email});
            // Get.to(OtpScreenEmail(
            //   email: email,
            // ));
            // TODO: show snackbar of OTP sent and go to OTP page
          }
        } else {
          developer.log("SOme error occured");
        }
      } else {
        developer.log(res.statusCode.toString());
        developer.log("Wrong password");
      }
    } catch (e) {
      developer.log(e.toString());
    }
  }

  void logOut() {
    storageController.deleteDetails();
    _userController.reset();
    isLoggedin.value = false;
    emailAuth.value = '';
    Get.offAllNamed(Routes.LOGIN);
  }

  void verifyOTP(String email, String otp,
      {bool forgotPassword = false}) async {
    developer.log(email);
    developer.log(otp);
    var res = await Dio().post(VERIFY_OTP_URL, data: {
      "email": email,
      "otp": otp,
    });
    developer.log(res.data);
    developer.log("user data: ");
    if (res != null) {
      if (res.data['status'] == 'Verified') {
        if (forgotPassword) {
          Get.snackbar("OTP Verified", "Redirecting to reset password page");
          Get.offAllNamed(Routes.RESET_PASSWORD, parameters: {"email": email});
          return;
        }
        storageController.addVerified();
        developer.log("TTTTTOKKKKENNNNNN");
        developer.log(res.data['tokens']);
        _userController.token.value = res.data['tokens'];
        await storageController.addToken(res.data['tokens']);
        Get.snackbar("OTP Verified", "Redirecting to add details page");
        Get.offAllNamed(Routes.PROFILE);
        //TODO: show snackbar of user verified and go to login page
      } else if (res.data['status'] == 'Failed') {
        {
          developer.log("otp verification Failed");
          Get.snackbar('Otp Verification Failed', res.data['message']);
          // developer.log("OTP sent");
          // TODO: show snackbar of failed
        }
      } else {
        Get.snackbar("Some error occured", "Please try again");

        developer.log("SOme error occured");
      }
    }
  }

  forgotPassword(String email) async {
    try {
      developer.log(FORGOT_PASSWORD);
      var res = await Dio().post(FORGOT_PASSWORD, data: {
        "email": email,
      });
      developer.log(res.data);
      if (res.statusCode == 200) {
        if (res.data['message'] == 'Verification Otp Sent') {
          developer.log("Verification Otp Sent");
          Get.snackbar("Verification Otp Sent", "Please check your email");
          // Get.offAllNamed(Routes.OTPEMAIL);
          emailAuth.value = email;
          Get.offAll(() => EmailVerify(
                forgotPassword: true,
              ));
        } else if (res.data['message'] == 'User Not Register') {
          developer.log("User Not Register");
          Get.snackbar("User Not Register", "Please register first");
          Get.offAllNamed(Routes.REGISTER);
        } else {
          developer.log("Some error occured");
        Get.snackbar("Some error occured", "Please try again");

        }
      } else {
        developer.log(res.statusCode.toString());
        developer.log("Some error occured");
        Get.snackbar("Some error occured", "Please try again");

      }
    } catch (e) {
      developer.log(e.toString());
        Get.snackbar("Some error occured", "Please try again");

    }
  }

  resendOTP(String email) async {
    var res = await Dio().post(RESEND_OTP_URL, data: {
      "email": email,
    });
    developer.log(res.data);
    if (res.data['message'] == 'Verification Otp Sent') {
      developer.log("Resend OTP");
      Get.snackbar("Verification Otp Sent", "Please check your email");
    }
    else{
      developer.log("Some error occured");
        Get.snackbar("Some error occured", "Please try again");
    }
  }
}
