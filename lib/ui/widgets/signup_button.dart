// ignore_for_file: non_constant_identifier_names

import 'package:sarathi/ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget SignUpButton(String buttonName) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15.w),
    child: Stack(
      alignment: Alignment.centerLeft,
      children: [
        SizedBox(
            width: double.infinity,
            // color: Colors.yellow,
            child: Image.asset(
              'assets/images/signupbutton.png',
              fit: BoxFit.cover,
            )),
        Padding(
          padding: EdgeInsets.only(left: 60.w),
          child: Text(buttonName,
              style: TextStyle(
                  fontSize: 20,
                  color: whiteColor,
                  fontWeight: FontWeight.w300)),
        )
      ],
    ),
  );
}
