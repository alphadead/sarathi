import 'package:country_state_picker/country_state_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CareerAstrologyPage extends StatefulWidget {
  const CareerAstrologyPage({super.key});

  @override
  State<CareerAstrologyPage> createState() => _CareerAstrologyPageState();
}

class _CareerAstrologyPageState extends State<CareerAstrologyPage> {
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
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notification_add_outlined),
                  label: 'Notification'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined), label: 'Person'),
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
                    'assets/images/packagepagesillustration.svg',
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
                          height: 45.h,
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
                          height: 45.h,
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
                          height: 45.h,
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
                            autofillHints: const [AutofillHints.email]),
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
