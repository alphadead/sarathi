import 'package:sarathi/ui/utils/colors.dart';
import 'package:sarathi/ui/widgets/next_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "The best time for new begning is NOW.",
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
        Align(alignment: const Alignment(0.80, 0.90), child: nextButton("NEXT"))
      ]),
    );
  }
}

// Align(alignment: const Alignment(0.80, 0.90), child: nextButton("NEXT"))