import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarathi/controllers/auth_controller.dart';
import 'package:sarathi/controllers/user_controller.dart';
import 'package:sarathi/ui/utils/colors.dart';
import 'package:sarathi/ui/utils/headings.dart';
import 'package:sarathi/ui/utils/routes.dart';
import 'package:sarathi/ui/views/package_screens/astro_support/astro_support.dart';
import 'package:sarathi/ui/views/package_screens/career_counselling/career_counselling.dart';
import 'package:sarathi/ui/views/package_screens/psychometric_support/psychometric_support.dart';
import 'package:sarathi/ui/views/user_profile.dart';
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
      drawer: Drawer(
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: GestureDetector(
              onTap: () {
                Get.to(ProfilePage(user: _userController.user.value));
              },
              child: Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Stack(
                        children: [
                          Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(18.r)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Image.network(
                                  _userController.user.value.image.toString(),
                                  fit: BoxFit.cover,
                                )),
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
                                  border:
                                      Border.all(color: whiteColor, width: 2)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _userController.user.value.name.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: heading1.fontFamily,
                              color: blackColor),
                        ),
                        Text(
                          _userController.user.value.phone.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: heading3.fontFamily,
                              color: heading3.color),
                        )
                      ],
                    )
                  ],
                );
              }),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 12.h),
            child: GestureDetector(
              onTap: () {
                _authController.logOut();
                Get.to(ProfilePage(user: _userController.user.value));
              },
              child: Text(
                'PROFILE',
                style: TextStyle(
                    fontFamily: heading3.fontFamily,
                    color: blueColor,
                    fontSize: heading3.fontSize),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 12.h),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'PURCHASE',
                style: TextStyle(
                    fontFamily: heading3.fontFamily,
                    color: blueColor,
                    fontSize: heading3.fontSize),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 12.h),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'SETTINGS',
                style: TextStyle(
                    fontFamily: heading3.fontFamily,
                    color: blueColor,
                    fontSize: heading3.fontSize),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 12.h),
            child: GestureDetector(
              onTap: () {
                Get.offAllNamed(Routes.LOGIN);
              },
              child: Text(
                'Log Out',
                style: TextStyle(
                    fontFamily: heading3.fontFamily,
                    color: blueColor,
                    fontSize: heading3.fontSize),
              ),
            ),
          ),
        ]),
      ),
      body: Column(
        children: [
          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.only(left: 30.w, right: 22.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(builder: (context) {
                  return GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Image.asset('assets/icons/menu.png'));
                }),
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
                              )),
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
                            Get.to(const AstroSupportPage());
                          },
                          child: CategoryBox(
                            text: categories[0],
                            img: categoryImages[0],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
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
                            Get.to(CareerCounsellingPage());
                          },
                          child: CategoryBox(
                            text: categories[2],
                            img: categoryImages[2],
                          ),
                        ),
                        CategoryBox(
                          text: categories[3],
                          img: categoryImages[3],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CategoryBox(
                          text: categories[4],
                          img: categoryImages[4],
                        ),
                        CategoryBox(
                          text: categories[5],
                          img: categoryImages[5],
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
