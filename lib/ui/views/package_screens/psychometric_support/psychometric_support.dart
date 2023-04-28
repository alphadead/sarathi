import 'package:flutter/material.dart';
import 'package:flutter_chip_tags/flutter_chip_tags.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sarathi/ui/utils/colors.dart';
import 'package:sarathi/ui/utils/headings.dart';
import 'package:sarathi/ui/views/package_screens/psychometric_support/psychometric_support_feedback.dart';

class PsychometricSupportPage extends StatefulWidget {
  const PsychometricSupportPage({super.key});

  @override
  State<PsychometricSupportPage> createState() =>
      _PsychometricSupportPageState();
}

class _PsychometricSupportPageState extends State<PsychometricSupportPage> {
  var interests = List<String>.empty(growable: true);

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController interestController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
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
                    size: 25,
                  ),
                  label: 'Person'),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: 350.h,
                  child: SvgPicture.asset(
                    'assets/images/careerastrology.svg',
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 27.w),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 320.h,
                        ),
                        SizedBox(
                            height: 360,
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/astrologywheel.png',
                              fit: BoxFit.cover,
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 360.h,
                        ),
                        TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                filled: true,
                                isDense: true,
                                labelText: "Name",
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 13.w, vertical: 13.h),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r))),
                            keyboardType: TextInputType.emailAddress,
                            autofillHints: const [AutofillHints.email]),
                        SizedBox(
                          height: 33.h,
                        ),
                        TextField(
                            controller: ageController,
                            decoration: InputDecoration(
                                filled: true,
                                isDense: true,
                                labelText: "Age",
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 13.w, vertical: 13.h),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r))),
                            keyboardType: TextInputType.number,
                            autofillHints: const [AutofillHints.email]),
                        SizedBox(
                          height: 33.h,
                        ),
                        ChipTags(
                          list: interests,
                          chipColor: Colors.grey,
                          iconColor: Colors.black,
                          textColor: Colors.white,
                          chipPosition: ChipPosition.below,
                          createTagOnSubmit: true,
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            labelText: "Interest/Hobbies",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 13.w, vertical: 13.h),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                if (nameController.text.isNotEmpty &&
                                    ageController.text.isNotEmpty &&
                                    interests.isNotEmpty) {
                                  Get.to(const PsychometricSupportFeedback());
                                }
                              },
                              child: Container(
                                height: 45.h,
                                width: 152.w,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          offset: Offset(0, 3))
                                    ],
                                    borderRadius: BorderRadius.circular(25),
                                    gradient: LinearGradient(
                                        colors: [
                                          greenColor.withOpacity(0.5),
                                          yellowColor.withOpacity(0.5)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter)),
                                child: Center(
                                  child: Text('SUBMIT', style: heading5),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
