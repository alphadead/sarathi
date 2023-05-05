import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sarathi/controllers/storage_controller.dart';
import 'package:sarathi/controllers/user_controller.dart';
import 'package:sarathi/ui/auth/login.dart';
import 'package:sarathi/ui/auth/otp.dart';
import 'package:sarathi/ui/auth/otp_email.dart';
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
    print(data);

    try {
      var res = await Dio().postUri(Uri.parse(ADD_PROFILE_DETAILS), data: data);
      if (res.statusCode == 200) {
        if (res.data['message'] == 'Not Verified or User not registered') {
          print("User not verified");
          Get.snackbar("User not verified", "Redirecting to home page");
          Get.offAllNamed(Routes.ONBOARDING);
        } else {
          print("Extra details added");
          isLoggedin.value = true;
          storageController.addVerified();
          _userController.email.value = emailAuth.value;
          _userController.fetchUserDetails();
          Get.offAllNamed(Routes.HOME);
        }
      } else {
        print("Some error occured");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  updateUserProfile(Map<String, dynamic> data) async {
    data["authorization"] = _userController.token.value;
    print(data);
    try {
      var res = await Dio().postUri(Uri.parse(ADD_PROFILE_DETAILS), data: data);
      if (res.statusCode == 200) {
        if (res.data['message'] == 'User details not filled') {
          print("User not verified");
          Get.snackbar("User details not filled", "Redirecting to login page");
          logOut();
          Get.offAllNamed(Routes.LOGIN);
        } else {
          print("User Details Updated");
          Get.snackbar("User Details Updated", "Redirecting to home page");
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
      print(res.data);
      if (res.statusCode == 200) {
        if (res.data['message'] == 'Login Successful') {
          await storageController.addUnverified();
          _userController.token.value = res.data["tokens"];
          await storageController.addToken(res.data['tokens']);
          isLoggedin.value = true;
          if (res.data["profile_status"]) {
            print("Login Successful. Redirecting to home page");
            await storageController.addVerified();

            _userController.email.value = emailAuth.value;
            await _userController.fetchUserDetails();
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

  updatePassword(String email, String password) async {
    try {
      print(UPDATE_PASSWORD);
      var res = await Dio().post(UPDATE_PASSWORD, data: {
        "email": email,
        "password": password,
      });
      print(res.data);
      if (res.statusCode == 200) {
        if (res.data['message'] == 'password updated') {
          print("Password updated");
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
        print(res.statusCode);
        print("Wrong password");
      }
    } catch (e) {
      Get.snackbar("Some error occured", "Please try again");
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

  void logOut() {
    storageController.deleteDetails();
    _userController.reset();
    isLoggedin.value = false;
    emailAuth.value = '';
  }

  void verifyOTP(String email, String otp,
      {bool forgotPassword = false}) async {
    print(email);
    print(otp);
    var res = await Dio().post(VERIFY_OTP_URL, data: {
      "email": email,
      "otp": otp,
    });
    print(res.data);
    print("user data: ");
    if (res != null) {
      if (res.data['status'] == 'Verified') {
        if (forgotPassword) {
          Get.snackbar("OTP Verified", "Redirecting to reset password page");
          Get.offAllNamed(Routes.RESET_PASSWORD, parameters: {"email": email});
          return;
        }
        storageController.addVerified();
        print("TTTTTOKKKKENNNNNN");
        print(res.data['tokens']);
        _userController.token.value = res.data['tokens'];
        await storageController.addToken(res.data['tokens']);
        Get.snackbar("OTP Verified", "Redirecting to add details page");
        Get.offAllNamed(Routes.PROFILE);
        //TODO: show snackbar of user verified and go to login page
      } else if (res.data['status'] == 'Failed') {
        {
          print("otp verification Failed");
          Get.snackbar('Otp Verification Failed', res.data['message']);
          // print("OTP sent");
          // TODO: show snackbar of failed
        }
      } else {
        print("SOme error occured");
      }
    }
  }

  forgotPassword(String email) async {
    try {
      print(FORGOT_PASSWORD);
      var res = await Dio().post(FORGOT_PASSWORD, data: {
        "email": email,
      });
      print(res.data);
      if (res.statusCode == 200) {
        if (res.data['message'] == 'Verification Otp Sent') {
          print("Verification Otp Sent");
          Get.snackbar("Verification Otp Sent", "Please check your email");
          // Get.offAllNamed(Routes.OTPEMAIL);
          emailAuth.value = email;
          Get.offAll(() => EmailVerify(
                forgotPassword: true,
              ));
        } else if (res.data['message'] == 'User Not Register') {
          print("User Not Register");
          Get.snackbar("User Not Register", "Please register first");
          Get.offAllNamed(Routes.REGISTER);
        } else {
          print("Some error occured");
        }
      } else {
        print(res.statusCode);
        print("Some error occured");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
