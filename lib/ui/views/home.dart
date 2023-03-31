import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sarathi/ui/auth/phone.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarathi/ui/utils/colors.dart';
import 'package:sarathi/ui/utils/headings.dart';
import 'package:sarathi/ui/views/user_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
      ),
      drawer: Drawer(
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: GestureDetector(
              onTap: () {
                Get.to(const ProfilePage());
              },
              child: Row(
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
                                'https://images.pexels.com/photos/9950569/pexels-photo-9950569.jpeg',
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
                        'Ashu Garg',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: heading1.fontFamily,
                            color: blackColor),
                      ),
                      Text(
                        '@therealashugarg',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: heading3.fontFamily,
                            color: heading3.color),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Center(
              child: Text(
            'Payments',
            style: TextStyle(
                fontFamily: heading3.fontFamily,
                color: blueColor,
                fontSize: heading3.fontSize),
          ))
        ]),
      ),
      body: Center(
          child: GestureDetector(
              onTap: () {
                Get.to(const PhoneScreen());
              },
              child: const Text('Home'))),
    );
  }
}
