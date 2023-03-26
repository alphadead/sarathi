import 'package:sarathi/ui/auth/phone.dart';
import 'package:sarathi/ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

Widget nextButton(String text) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: [
          cyanColor.withOpacity(0.50),
          blueColor.withOpacity(0.50),
        ]),
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
        Get.to(const PhoneScreen());
      },
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16, color: whiteColor, fontWeight: FontWeight.w400),
      ),
    ),
  );
}
