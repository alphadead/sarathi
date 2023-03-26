import 'package:sarathi/ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 197),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/illustration.svg',
                  width: 200.sp,
                ),
              ),
            ),
            SizedBox(
              height: 76.h,
            ),
            const Text(
              "Life is all about Counseling around you.",
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(18.w, 100.h, 18.w, 150.h),
          child: Container(
            height: 512.h,
            width: 340.w,
            decoration: BoxDecoration(
                color: lightBlueColor.withOpacity(0.21),
                borderRadius: BorderRadius.circular(30.r)),
            // child:
          ),
        ),
        // Align(alignment: const Alignment(0.80, 0.90), child: nextButton("NEXT"))
      ]),
    );
  }
}
