import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sarathi/ui/utils/colors.dart';
import 'package:sarathi/ui/utils/headings.dart';
import 'package:sarathi/ui/views/package_screens/astro_support/astro_support_feedback.dart';

class AstroSupportPage extends StatefulWidget {
  const AstroSupportPage({super.key});

  @override
  State<AstroSupportPage> createState() => _AstroSupportPageState();
}

class _AstroSupportPageState extends State<AstroSupportPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController tobController = TextEditingController();

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        tobController.text = value!.format(context).toString();
      });
    });
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
                            controller: dobController,
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1990),
                                  lastDate: DateTime.now());
                              if (pickDate != null) {
                                setState(() {
                                  dobController.text =
                                      DateFormat('dd-MM-yyy').format(pickDate);
                                });
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Date of Birth",
                                isDense: true,
                                filled: true,
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
                            controller: placeController,
                            decoration: InputDecoration(
                                labelText: "Place of Birth",
                                isDense: true,
                                filled: true,
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
                          controller: tobController,
                          readOnly: true,
                          onTap: _showTimePicker,
                          decoration: InputDecoration(
                              labelText: "Time of Birth",
                              isDense: true,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 13.w, vertical: 13.h),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r))),
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: const [AutofillHints.email],
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
                                    dobController.text.isNotEmpty &&
                                    placeController.text.isNotEmpty &&
                                    tobController.text.isNotEmpty) {
                                  Get.to(const AstroSupportFeedback());
                                }
                              },
                              child: Container(
                                height: 45.h,
                                width: 152.w,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 4,
                                          blurRadius: 2,
                                          offset: Offset(-1, 4))
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
                                  child: Text(
                                    'SUBMIT',
                                    style: heading5
                                  ),
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
