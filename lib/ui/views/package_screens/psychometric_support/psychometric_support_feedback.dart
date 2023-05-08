import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sarathi/controllers/user_controller.dart';
import 'package:sarathi/ui/utils/colors.dart';
import 'package:sarathi/ui/utils/headings.dart';
import 'package:sarathi/ui/views/home.dart';
import 'package:sarathi/ui/views/user_profile.dart';

class PsychometricSupportFeedback extends StatefulWidget {
  const PsychometricSupportFeedback({super.key});

  @override
  State<PsychometricSupportFeedback> createState() =>
      _PsychometricSupportFeedbackState();
}

class _PsychometricSupportFeedbackState
    extends State<PsychometricSupportFeedback> {
  final UserController _userController = Get.find<UserController>();
  bool isResultReady = false;
  List<String> stories = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
    "Lorem ipsum dolor sit amet"
  ];
  //
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
          Stack(
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 40.h),
                        child: Icon(Icons.menu, color: whiteColor),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 40.h),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(
                                ProfilePage(user: _userController.user.value));
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
                  )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                SizedBox(
                  height: 340.h,
                ),
                isResultReady == false
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 53.h,
                                  width: 53.w,
                                  child: Image.asset(
                                    'assets/icons/greencheck.png',
                                    fit: BoxFit.contain,
                                  )),
                              SizedBox(width: 15.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Thanks for registering!',
                                    style: TextStyle(
                                        fontSize: 15, color: blackColor),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    'We will get back to you soon.',
                                    style: TextStyle(
                                        fontSize: 15, color: blackColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          SizedBox(
                            height: 325.h,
                            child: MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: ListView.builder(
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 0, 10, 10),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 270.h,
                                          width: 340.w,
                                          decoration: BoxDecoration(
                                              color:
                                                  greyColor.withOpacity(0.10),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                        SizedBox(
                                          height: 270.h,
                                          width: 340.w,
                                          child: Padding(
                                            padding: EdgeInsets.all(12.h),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                          height: 24.h,
                                                          width: 22.w,
                                                          child: Image.asset(
                                                            'assets/icons/moon.png',
                                                            fit: BoxFit.fill,
                                                            color: blackColor,
                                                          )),
                                                      SizedBox(
                                                        width: 8.w,
                                                      ),
                                                      Text(
                                                        "Psychological Stories",
                                                        style: TextStyle(
                                                            fontSize: heading5
                                                                .fontSize,
                                                            fontFamily: heading5
                                                                .fontFamily,
                                                            fontWeight: heading3
                                                                .fontWeight,
                                                            color: blackColor),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(height: 8.h),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 18.w),
                                                    child: Text(
                                                      stories[index],
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize:
                                                              heading5.fontSize,
                                                          fontFamily: heading5
                                                              .fontFamily,
                                                          fontWeight: heading3
                                                              .fontWeight,
                                                          color: blackColor),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.r),
                                                        child: SizedBox(
                                                          height: 142.w,
                                                          width: 142.w,
                                                          child: Image.network(
                                                            "https://images.pexels.com/photos/12548884/pexels-photo-12548884.jpeg",
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        24.r),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        24.r)),
                                                        child: SizedBox(
                                                          height: 142.w,
                                                          width: 142.w,
                                                          child: Image.network(
                                                            "https://images.pexels.com/photos/12548884/pexels-photo-12548884.jpeg",
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      )
                    : Stack(
                        children: [
                          Container(
                            height: 232.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.black.withAlpha(90),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 232.h,
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: SizedBox(
                                              height: 36.h,
                                              width: 34.w,
                                              child: Image.asset(
                                                'assets/icons/moon.png',
                                                fit: BoxFit.fill,
                                              )),
                                        ),
                                        const Spacer()
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 232.h,
                                    width: MediaQuery.of(context).size.width *
                                        0.70,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Hey Adarsh, hope you are doing fine.',
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 22,
                                              color: blackColor),
                                        ),
                                        SizedBox(
                                          height: 12.h,
                                        ),
                                        Text(
                                          'Yor are more inclined towards ABC.\nDownload PDF for more details.',
                                          maxLines: 4,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 22,
                                              color: blackColor),
                                        ),
                                        const Spacer()
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 115.h),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Download ',
                                      style: TextStyle(
                                          fontSize: 15, color: blackColor),
                                    ),
                                    const Text(
                                      'PDF',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.red),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
