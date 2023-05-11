import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sarathi/controllers/auth_controller.dart';
import 'package:sarathi/controllers/user_controller.dart';
import 'package:sarathi/ui/utils/colors.dart';
import 'package:sarathi/ui/views/package_screens/astro_support/astro_support.dart';
import 'package:sarathi/ui/views/package_screens/career_counselling/career_counselling.dart';
import 'package:sarathi/ui/views/package_screens/psychometric_support/psychometric_support.dart';
import 'package:sarathi/ui/views/user_profile.dart';
import 'package:sarathi/ui/views/lock_page.dart';
import 'package:sarathi/ui/widgets/category_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserController _userController = Get.find<UserController>();
  final AuthController _authController = Get.find<AuthController>();
  final List<String> categories = [
    'Astro Support',
    'Psychometric Support',
    'Choose A Career',
    'Choose A course',
    'Choose A College',
    'Educational Guidance and Counseling'
  ];
  final List<String> categoryImages = [
    'assets/images/category1.png',
    'assets/images/category2.png',
    'assets/images/category3.png',
    'assets/images/category4.png',
    'assets/images/category5.png',
    'assets/images/category6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        children: [
          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.only(left: 30.w, right: 22.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/logo/namedIcon.svg',
                  fit: BoxFit.fill,
                  height: 50,
                  width: 150,
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(ProfilePage(user: _userController.user.value));
                      },
                      child: Obx(() {
                        return Container(
                          height: 50.h,
                          width: 50.h,
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(18.r)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.network(
                              _userController.user.value.image.toString(),
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return const Icon(Icons.person);
                              },
                            ),
                            // _userController.user.value.image.toString(),
                            // fit: BoxFit.cover,
                          ),
                        );
                      }),
                    ),
                    Positioned(
                      bottom: 0,
                      right: -2.8,
                      child: Container(
                        height: 15.h,
                        width: 15.w,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: whiteColor, width: 2)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (!_userController.isAstroShow.value) {
                              Get.to(const LockPage());
                              return;
                            }
                            Get.to(const AstroSupportPage());
                          },
                          child: CategoryBox(
                            text: categories[0],
                            img: categoryImages[0],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (!_userController.isPsyShow.value) {
                              Get.to(const LockPage());
                              return;
                            }
                            Get.to(const PsychometricSupportPage());
                          },
                          child: CategoryBox(
                            text: categories[1],
                            img: categoryImages[1],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (!_userController.isCareerShow.value) {
                              Get.to(const LockPage());
                              return;
                            }
                            Get.to(const CareerCounsellingPage());
                          },
                          child: CategoryBox(
                            text: categories[2],
                            img: categoryImages[2],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(const LockPage());
                          },
                          child: CategoryBox(
                            text: categories[3],
                            img: categoryImages[3],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(const LockPage());
                          },
                          child: CategoryBox(
                            text: categories[4],
                            img: categoryImages[4],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(const LockPage());
                          },
                          child: CategoryBox(
                            text: categories[5],
                            img: categoryImages[5],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
