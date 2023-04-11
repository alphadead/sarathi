import 'package:sarathi/ui/auth/sign_up.dart';
import 'package:sarathi/ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

Widget nextButton(String text) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: [
          const Color(0XFF01AE4F).withOpacity(0.50),
          const Color(0XFFFFEEBB).withOpacity(0.50),
        ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(
              -4.0,
              4.0,
            ),
            blurRadius: 10,
            spreadRadius: 2,
          )
        ]),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.w),
          backgroundColor: Colors.transparent,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shadowColor: Colors.transparent),
      onPressed: () {
        Get.to(const SignUpPage());
      },
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16, color: blackColor, fontWeight: FontWeight.w400),
      ),
    ),
  );
}
