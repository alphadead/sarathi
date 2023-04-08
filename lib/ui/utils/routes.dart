import 'package:get/get.dart';
import 'package:sarathi/ui/auth/otp.dart';
import 'package:sarathi/ui/auth/otp_email.dart';
import 'package:sarathi/ui/views/home.dart';
import 'package:sarathi/ui/views/intropages/page1.dart';
import 'package:sarathi/ui/views/onboarding_screen.dart';

import '../views/user_profile.dart';

class Routes {
  static String HOME = '/home';
  static String LOGIN = '/login';
  static String REGISTER = '/register';
  static String OTPEMAIL = '/otpemail';
  static String PROFILE = '/profile';
  static String ONBOARDING = '/onboarding';
}

final getPages = <GetPage>[
  GetPage(
    name: Routes.HOME,
    page: () => const HomePage(),
  ),
  GetPage(
    name: Routes.PROFILE,
    page: () => const ProfilePage(),
  ),
  GetPage(
    name: Routes.ONBOARDING,
    page: () => const OnBoardingScreen(),
  ),
  GetPage(
    name: Routes.OTPEMAIL,
    page: () =>  OtpScreenEmail()
  ),
];
