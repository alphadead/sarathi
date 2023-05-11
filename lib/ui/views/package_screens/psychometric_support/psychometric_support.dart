import 'package:flutter/material.dart';
import 'package:flutter_chip_tags/flutter_chip_tags.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sarathi/controllers/psycology_controller.dart';
import 'package:sarathi/controllers/user_controller.dart';
import 'package:sarathi/ui/utils/colors.dart';
import 'package:sarathi/ui/utils/headings.dart';
import 'package:sarathi/ui/views/user_profile.dart';
import 'package:sarathi/ui/widgets/custom_progress_indicator.dart';

class PsychometricSupportPage extends StatefulWidget {
  const PsychometricSupportPage({super.key});

  @override
  State<PsychometricSupportPage> createState() =>
      _PsychometricSupportPageState();
}

class _PsychometricSupportPageState extends State<PsychometricSupportPage> {
  var interests = List<String>.empty(growable: true);
  final UserController _userController = Get.find<UserController>();
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
                padding: EdgeInsets.symmetric(horizontal: 27.w),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 340.h,
                        ),
                        SizedBox(
                            height: 300,
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/brain.svg',
                              fit: BoxFit.cover,
                            )),
                      ],
                    ),
                    GetBuilder<PsyController>(
                        init: PsyController(),
                        builder: (controller) {
                          if (controller.onLoading.value) {
                            return const Center(
                                child: CustomProgressIndicator());
                          } else if (controller.someErrorOccured.value) {
                            return const Text("Some error occured");
                          } else if (controller.fillPsyDetails.value) {
                            return Column(
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
                                            borderRadius:
                                                BorderRadius.circular(15.r))),
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
                                            borderRadius:
                                                BorderRadius.circular(15.r))),
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
                                          controller.postPsyDetails(
                                              nameController.text,
                                              ageController.text,
                                              interests);
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
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            gradient: LinearGradient(
                                                colors: [
                                                  greenColor.withOpacity(0.5),
                                                  yellowColor.withOpacity(0.5)
                                                ],
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter)),
                                        child: Center(
                                          child:
                                              Text('SUBMIT', style: heading5),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            );
                          } else {
                            //Get.offAll(const PsychometricSupportFeedback());
                            return Container();
                          }
                        })
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
