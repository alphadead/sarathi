import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sarathi/ui/utils/colors.dart';
import 'package:sarathi/ui/utils/headings.dart';

class CareerCounsellingPage extends StatefulWidget {
  const CareerCounsellingPage({super.key});

  @override
  State<CareerCounsellingPage> createState() => _CareerCounsellingPageState();
}

class _CareerCounsellingPageState extends State<CareerCounsellingPage> {
  @override
  void initState() {
    super.initState();
    checkResult();
  }

  checkResult() {
    //TODO
    // isResultReady = true;
  }

  @override
  Widget build(BuildContext context) {
    final astroToggleController = ValueNotifier<bool>(false);
    final psychoToggleController = ValueNotifier<bool>(false);
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
          Column(
            children: [
              SizedBox(
                height: 320.h,
              ),
              SizedBox(
                  height: 340,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/tree.png',
                    fit: BoxFit.contain,
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                SizedBox(
                  height: 340.h,
                ),
                Stack(
                  children: [
                    Container(
                      height: 188.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: greyColor.withOpacity(0.50),
                          borderRadius: BorderRadius.circular(20.r)),
                    ),
                    Center(
                        child: Padding(
                      padding: EdgeInsets.fromLTRB(12.w, 24.h, 12.w, 12.h),
                      child: Container(
                          height: 170.h,
                          child: SvgPicture.asset(
                            "assets/images/reminder.svg",
                            fit: BoxFit.contain,
                          )),
                    ))
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(colors: [
                        greenColor.withOpacity(0.52),
                        yellowColor.withOpacity(0.74)
                      ])),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 18.w),
                          child: Text(
                            "Astrology Data",
                            style: TextStyle(
                                fontSize: heading5.fontSize,
                                fontFamily: heading5.fontFamily,
                                fontWeight: heading3.fontWeight,
                                color: blackColor),
                          ),
                        ),
                        AdvancedSwitch(
                          width: 80.w,
                          height: 40.h,
                          borderRadius: BorderRadius.circular(40.r),
                          controller: astroToggleController,
                          inactiveChild: Padding(
                            padding: EdgeInsets.only(right: 5.w),
                            child: const Text(
                              "No",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          activeChild: Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: const Text(
                              "Sync",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          enabled: true,
                          disabledOpacity: 0.5,
                          activeColor: whiteColor,
                          inactiveColor: whiteColor,
                          thumb: ValueListenableBuilder<bool>(
                            valueListenable: astroToggleController,
                            builder: (context, value, child) {
                              return Container(
                                height: 40.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(colors: [
                                      greenColor.withOpacity(0.52),
                                      yellowColor.withOpacity(0.74)
                                    ])),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 33.h,
                ),
                Container(
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(colors: [
                        greenColor.withOpacity(0.52),
                        yellowColor.withOpacity(0.74)
                      ])),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 18.w),
                          child: Text(
                            "Psychological Data",
                            style: TextStyle(
                                fontSize: heading5.fontSize,
                                fontFamily: heading5.fontFamily,
                                fontWeight: heading3.fontWeight,
                                color: blackColor),
                          ),
                        ),
                        AdvancedSwitch(
                          width: 80.w,
                          height: 40.h,
                          borderRadius: BorderRadius.circular(40.r),
                          controller: psychoToggleController,
                          inactiveChild: Padding(
                            padding: EdgeInsets.only(right: 5.w),
                            child: const Text(
                              "No",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          activeChild: Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: const Text(
                              "Sync",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          enabled: true,
                          disabledOpacity: 0.5,
                          activeColor: whiteColor,
                          inactiveColor: whiteColor,
                          thumb: ValueListenableBuilder<bool>(
                            valueListenable: psychoToggleController,
                            builder: (context, value, child) {
                              return Container(
                                height: 40.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(colors: [
                                      greenColor.withOpacity(0.52),
                                      yellowColor.withOpacity(0.74)
                                    ])),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
