import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sarathi/controllers/user_controller.dart';
import 'package:sarathi/ui/utils/colors.dart';
import 'package:sarathi/ui/views/user_profile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PsychometricQuestionsPage extends StatefulWidget {
  const PsychometricQuestionsPage({super.key});

  @override
  State<PsychometricQuestionsPage> createState() =>
      _PsychometricQuestionsPageState();
}

class _PsychometricQuestionsPageState extends State<PsychometricQuestionsPage> {
  final PageController _controller = PageController();
  final UserController _userController = Get.find<UserController>();
  String gender = "";
  var age;
  String relationship = "";
  String identity = "";
  List<List<String>> questionOptions = [
    ['Women', 'Men'],
    [],
    ['Single', 'In a relationship', 'Married', 'Divorced', 'Widowed', 'Other'],
    ['Hindu', 'Islam', 'Judaism', 'Other']
  ];
  List<String> question = [
    'What is your gender identity?',
    'How old are you?',
    'What is your relationship status?',
    'Which religion do you identify with?'
  ];
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
              PageView(
                controller: _controller,
                children: [
                  // One
                  Column(
                    children: [
                      SizedBox(
                        height: 370.h,
                      ),
                      Center(
                        child: Container(
                          height: 326.h,
                          width: 332.w,
                          decoration: BoxDecoration(
                            color: lightGreyColor.withOpacity(0.30),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(20.h),
                                child: Text(
                                  question[0],
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    gender = question[0][0];
                                    _controller.nextPage(
                                        duration: const Duration(milliseconds: 200),
                                        curve: Curves.linear);
                                  });
                                },
                                child: Container(
                                  height: 54.h,
                                  width: 290.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27.r),
                                      gradient: LinearGradient(colors: [
                                        yellowColor.withOpacity(0.5),
                                        greenColor.withOpacity(0.5)
                                      ])),
                                  child: Center(
                                      child: Text(questionOptions[0][0])),
                                ),
                              ),
                              SizedBox(
                                height: 37.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    gender = question[0][1];
                                    _controller.nextPage(
                                        duration: const Duration(milliseconds: 200),
                                        curve: Curves.linear);
                                  });
                                },
                                child: Container(
                                  height: 54.h,
                                  width: 290.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27.r),
                                      gradient: LinearGradient(colors: [
                                        yellowColor.withOpacity(0.5),
                                        greenColor.withOpacity(0.5)
                                      ])),
                                  child: Center(
                                      child: Text(questionOptions[0][1])),
                                ),
                              ),
                              const Spacer()
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  // Two
                  Column(
                    children: [
                      SizedBox(
                        height: 370.h,
                      ),
                      Center(
                        child: Container(
                          height: 326.h,
                          width: 332.w,
                          decoration: BoxDecoration(
                            color: lightGreyColor.withOpacity(0.30),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(20.h),
                                child: Text(
                                  question[1],
                                ),
                              ),
                              const Spacer(),
                              Container(
                                  height: 54.h,
                                  width: 290.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27.r),
                                      gradient: LinearGradient(colors: [
                                        yellowColor.withOpacity(0.5),
                                        greenColor.withOpacity(0.5)
                                      ])),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    child: DropdownButton<int>(
                                      hint: const Text("Select your age"),
                                      isExpanded: true,
                                      items: Iterable<int>.generate(100)
                                          .toList()
                                          .map((int age) {
                                        return DropdownMenuItem<int>(
                                          value: age,
                                          child: Text(age.toString()),
                                        );
                                      }).toList(),
                                      value: age,
                                      onChanged: (value) {
                                        setState(() {
                                          age = value;
                                          _controller.nextPage(
                                              duration:
                                                  const Duration(milliseconds: 200),
                                              curve: Curves.linear);
                                        });
                                      },
                                    ),
                                  )),
                              const Spacer()
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  // Three
                  Column(
                    children: [
                      SizedBox(
                        height: 370.h,
                      ),
                      Center(
                        child: Container(
                          height: 332.h,
                          width: 332.w,
                          decoration: BoxDecoration(
                            color: lightGreyColor.withOpacity(0.30),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(20.h),
                                child: Text(
                                  question[2],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    relationship = questionOptions[2][0];
                                    _controller.nextPage(
                                              duration:
                                                  const Duration(milliseconds: 200),
                                              curve: Curves.linear);
                                  });
                                },
                                child: Container(
                                  height: 35.h,
                                  width: 290.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27.r),
                                      gradient: LinearGradient(colors: [
                                        yellowColor.withOpacity(0.5),
                                        greenColor.withOpacity(0.5)
                                      ])),
                                  child: Center(
                                      child: Text(questionOptions[2][0])),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    relationship = questionOptions[2][1];
                                    _controller.nextPage(
                                              duration:
                                                  const Duration(milliseconds: 200),
                                              curve: Curves.linear);
                                  });
                                },
                                child: Container(
                                  height: 35.h,
                                  width: 290.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27.r),
                                      gradient: LinearGradient(colors: [
                                        yellowColor.withOpacity(0.5),
                                        greenColor.withOpacity(0.5)
                                      ])),
                                  child: Center(
                                      child: Text(questionOptions[2][1])),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    relationship = questionOptions[2][2];
                                    _controller.nextPage(
                                              duration:
                                                  const Duration(milliseconds: 200),
                                              curve: Curves.linear);
                                  });
                                },
                                child: Container(
                                  height: 35.h,
                                  width: 290.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27.r),
                                      gradient: LinearGradient(colors: [
                                        yellowColor.withOpacity(0.5),
                                        greenColor.withOpacity(0.5)
                                      ])),
                                  child: Center(
                                      child: Text(questionOptions[2][2])),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    relationship = questionOptions[2][3];
                                    _controller.nextPage(
                                              duration:
                                                  const Duration(milliseconds: 200),
                                              curve: Curves.linear);
                                  });
                                },
                                child: Container(
                                  height: 35.h,
                                  width: 290.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27.r),
                                      gradient: LinearGradient(colors: [
                                        yellowColor.withOpacity(0.5),
                                        greenColor.withOpacity(0.5)
                                      ])),
                                  child: Center(
                                      child: Text(questionOptions[2][3])),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    relationship = questionOptions[2][4];
                                    _controller.nextPage(
                                              duration:
                                                  const Duration(milliseconds: 200),
                                              curve: Curves.linear);
                                  });
                                },
                                child: Container(
                                  height: 35.h,
                                  width: 290.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27.r),
                                      gradient: LinearGradient(colors: [
                                        yellowColor.withOpacity(0.5),
                                        greenColor.withOpacity(0.5)
                                      ])),
                                  child: Center(
                                      child: Text(questionOptions[2][4])),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    relationship = questionOptions[2][5];
                                    _controller.nextPage(
                                              duration:
                                                  const Duration(milliseconds: 200),
                                              curve: Curves.linear);
                                  });
                                },
                                child: Container(
                                  height: 35.h,
                                  width: 290.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27.r),
                                      gradient: LinearGradient(colors: [
                                        yellowColor.withOpacity(0.5),
                                        greenColor.withOpacity(0.5)
                                      ])),
                                  child: Center(
                                      child: Text(questionOptions[2][5])),
                                ),
                              ),
                              const Spacer()
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  // Four
                  Column(
                    children: [
                      SizedBox(
                        height: 370.h,
                      ),
                      Center(
                        child: Container(
                          height: 326.h,
                          width: 332.w,
                          decoration: BoxDecoration(
                            color: lightGreyColor.withOpacity(0.30),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(20.h),
                                child: Text(
                                  question[3],
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    identity = questionOptions[3][0];
                                  });
                                },
                                child: Container(
                                  height: 45.h,
                                  width: 290.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27.r),
                                      gradient: LinearGradient(colors: [
                                        yellowColor.withOpacity(0.5),
                                        greenColor.withOpacity(0.5)
                                      ])),
                                  child: Center(
                                      child: Text(questionOptions[3][0])),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    identity = questionOptions[3][1];
                                  });
                                },
                                child: Container(
                                  height: 45.h,
                                  width: 290.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27.r),
                                      gradient: LinearGradient(colors: [
                                        yellowColor.withOpacity(0.5),
                                        greenColor.withOpacity(0.5)
                                      ])),
                                  child: Center(
                                      child: Text(questionOptions[3][1])),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    identity = questionOptions[3][2];
                                  });
                                },
                                child: Container(
                                  height: 45.h,
                                  width: 290.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27.r),
                                      gradient: LinearGradient(colors: [
                                        yellowColor.withOpacity(0.5),
                                        greenColor.withOpacity(0.5)
                                      ])),
                                  child: Center(
                                      child: Text(questionOptions[3][2])),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    identity = questionOptions[3][3];
                                  });
                                },
                                child: Container(
                                  height: 45.h,
                                  width: 290.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27.r),
                                      gradient: LinearGradient(colors: [
                                        yellowColor.withOpacity(0.5),
                                        greenColor.withOpacity(0.5)
                                      ])),
                                  child: Center(
                                      child: Text(questionOptions[3][3])),
                                ),
                              ),
                              const Spacer()
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                  alignment: const Alignment(0, -0.08),
                  child:
                      SmoothPageIndicator(controller: _controller, count: 4)),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
                    child: Icon(Icons.menu, color: whiteColor),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
