import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sarathi/ui/utils/colors.dart';

class CategoryBox extends StatelessWidget {
  final img;
  final text;

  const CategoryBox({super.key, this.img, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      width: 146.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),

        gradient: LinearGradient(colors: [
          yellowColor.withOpacity(0.3),
          greenColor.withOpacity(0.3)
        ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(2,3)
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: SizedBox(
                height: 90.h,
                width: 90.w,
                child: Image.asset(
                  img,
                  fit: BoxFit.contain,
                )),
          ),
          Center(
            child: SizedBox(
                width: 115.w,
                child: Text(
                  text,
                  maxLines: 4,
                  style: TextStyle(fontSize: 15.h),
                )),
          ),
        ],
      ),
    );
  }
}
