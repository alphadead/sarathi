import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sarathi/controllers/user_controller.dart';
import 'package:sarathi/ui/utils/colors.dart';
import 'package:sarathi/ui/utils/headings.dart';
import 'package:sarathi/ui/views/user_profile.dart';

class PremiumPlanPage extends StatefulWidget {
  const PremiumPlanPage({super.key});

  @override
  State<PremiumPlanPage> createState() => _PremiumPlanPageState();
}

class _PremiumPlanPageState extends State<PremiumPlanPage> {
  final UserController _userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: SizedBox(
        height: 80.h,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/home.png'),
                  size: 25,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/bell.png'),
                  size: 25,
                ),
                label: 'Notification'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/person.png'),
                  size: 22,
                ),
                label: 'Person'),
          ],
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              height: 350.h,
              child: SvgPicture.asset(
                'assets/images/careerastrology.svg',
                fit: BoxFit.cover,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
                child: Icon(Icons.menu, color: whiteColor),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
                child: GestureDetector(
                  onTap: () {
                    Get.to(ProfilePage(user: _userController.user.value));
                  },
                  child: Container(
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
                  ),
                ),
              ),
            ],
          ),
          BackdropFilter(filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          child: Container(
            decoration: BoxDecoration(
              color: blackColor.withOpacity(0.2),
            ),
          ),
          ),
          Column(
            children: [
              SizedBox(
                height: 328.h,
              ),
              Center(
                child: Container(
                  height: 388.h,
                  width: 318.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      gradient: LinearGradient(colors: [
                        greenColor.withOpacity(0.50),
                        yellowColor.withOpacity(0.70)
                      ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Spacer(),
                      Container(
                        height: 140.h,
                        width: 286.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(width: 2, color: whiteColor)),
                        child: Column(
                          children: [
                            Container(
                              width: 286.w,
                              height: 46.h,
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.r),
                                      topRight: Radius.circular(10.r))),
                              child: Stack(children: [
                                Center(
                                  child: Text(
                                    "P R E M I U M",
                                    style: TextStyle(
                                        fontSize: heading5.fontSize,
                                        fontWeight: heading3.fontWeight,
                                        color: heading5.color),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25.w, vertical: 3.h),
                                  child: SvgPicture.asset(
                                      "assets/images/giftbox.svg"),
                                ),
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
                              child: Column(
                                children: [
                                  Text(
                                    "-hi hthis is first benefit",
                                    style: TextStyle(
                                        fontSize: heading5.fontSize,
                                        fontWeight: heading3.fontWeight,
                                        color: heading5.color),
                                  ),
                                  Text(
                                    "-hi hthis is first benefit",
                                    style: TextStyle(
                                        fontSize: heading5.fontSize,
                                        fontWeight: heading3.fontWeight,
                                        color: heading5.color),
                                  ),
                                  Text(
                                    "-hi hthis is first benefit",
                                    style: TextStyle(
                                        fontSize: heading5.fontSize,
                                        fontWeight: heading3.fontWeight,
                                        color: heading5.color),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 140.h,
                        width: 286.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(width: 2, color: whiteColor)),
                        child: Column(
                          children: [
                            Container(
                              width: 286.w,
                              height: 46.h,
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.r),
                                      topRight: Radius.circular(10.r))),
                              child: Stack(children: [
                                Center(
                                  child: Text(
                                    "F R E E M I U M",
                                    style: TextStyle(
                                        fontSize: heading5.fontSize,
                                        fontWeight: heading3.fontWeight,
                                        color: heading5.color),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25.w, vertical: 3.h),
                                  child: SvgPicture.asset(
                                      "assets/images/crown.svg"),
                                ),
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
                              child: Column(
                                children: [
                                  Text(
                                    "-hi hthis is first benefit",
                                    style: TextStyle(
                                        fontSize: heading5.fontSize,
                                        fontWeight: heading3.fontWeight,
                                        color: heading5.color),
                                  ),
                                  Text(
                                    "-hi hthis is first benefit",
                                    style: TextStyle(
                                        fontSize: heading5.fontSize,
                                        fontWeight: heading3.fontWeight,
                                        color: heading5.color),
                                  ),
                                  Text(
                                    "-hi hthis is first benefit",
                                    style: TextStyle(
                                        fontSize: heading5.fontSize,
                                        fontWeight: heading3.fontWeight,
                                        color: heading5.color),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Spacer( flex: 2,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
