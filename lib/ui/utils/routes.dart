import 'package:get/get.dart';
import 'package:sarathi/ui/auth/login.dart';
import 'package:sarathi/ui/auth/user_info.dart';
import 'package:sarathi/ui/views/home.dart';

import '../auth/email_verify.dart';
import '../auth/reset_password.dart';
import '../views/no_internet.dart';

class Routes {
  static String HOME = '/home';
  static String LOGIN = '/login';
  static String REGISTER = '/register';
  static String OTPEMAIL = '/otpemail';
  static String PROFILE = '/profile';
  static String ONBOARDING = '/onboarding';
  static String RESET_PASSWORD = '/resetpassword';
  static String NO_INTERNET = '/nointernet';
}

final getPages = <GetPage>[
  GetPage(
    name: Routes.LOGIN,
    page: () => const LoginPage(),
  ),
  GetPage(
    name: Routes.HOME,
    page: () => const HomePage(),
  ),
  GetPage(
    name: Routes.PROFILE,
    page: () => const UserInfoPage(),
  ),
  GetPage(name: Routes.OTPEMAIL, page: () =>  EmailVerify()),
  GetPage(name: Routes.RESET_PASSWORD, page: () =>  ResetPasswordPage()),
  GetPage(name: Routes.NO_INTERNET, page: () => const NoInternet()),
];
